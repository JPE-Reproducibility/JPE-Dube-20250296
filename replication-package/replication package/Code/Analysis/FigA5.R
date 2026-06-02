# ============================================================================
# FigA5.R
#
# Produces Appendix Figure A5: ISAF Incidents in Afghanistan (2013–2014).
#   Four spatial heatmaps on a 0.05° grid, one per violence type:
#     (a) Insurgent Violence        (b) State-led Violence
#     (c) Other Insurgent Activity  (d) Other State-led Activity
#   Color scale is log(1 + count), fixed across all four panels.
#
# Input:  Data/figures_data/sigacts_afghanistan.csv
#         Data/figures_data/SIGACTS_event_classifications.csv
#         Data/raw_data/geo_data/district_shp/district398.shp
# Output: Output/Figures/sigacts_insurgent_violence_heatmap.png
#         Output/Figures/sigacts_stateled_violence_heatmap.png
#         Output/Figures/sigacts_other_insurgent_heatmap.png
#         Output/Figures/sigacts_other_stateled_heatmap.png
#         Output/Figures/legend.png  (standalone legend for LaTeX assembly)
#
# Required packages: data.table, sf, readr, lubridate, ggplot2, stringr,
#                    dplyr, tidyr, scales, xtable, patchwork,
#                    ggpointdensity, MASS, ggtext, cowplot
# To install:  install.packages(c("data.table", "sf", "readr", "lubridate",
#                "ggplot2", "stringr", "dplyr", "tidyr", "scales", "xtable",
#                "patchwork", "ggpointdensity", "MASS", "ggtext", "cowplot"))
#
# USAGE: No path configuration needed. Run as-is — maindir is resolved
#        automatically relative to this script's location via this.path.
# ============================================================================

# setup env and paths =========================================================================================================================================================

library('data.table')
library('sf')
library('readr')
library('lubridate')
library('ggplot2')
library('stringr')
library('dplyr') # for sf manipulation, otherwise I prefer data.table
library('tidyr')
library('scales')
library('xtable')
library('patchwork')
library('ggpointdensity') 
library('MASS')
library('ggtext')
library('cowplot')

maindir <- dirname(dirname(this.path::this.dir()))

paths = list(
  # all conflict files
  'sigacts' = file.path(maindir, 'Data/figures_data/sigacts_afghanistan.csv'),
  'sigacts_event_class' = file.path(maindir, 'Data/figures_data/SIGACTS_event_classifications.csv'),
  # afg district shp file
  'districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
  # figures output
  'figOutput' = file.path(maindir,'Output/Figures')
)
options(scipen = 999)


# read data ===============================================================================================================================================================

# violence
sigacts = fread(paths[['sigacts']])

# afg shape
districts = st_read(paths[['districts']]) %>%
  st_make_valid()


# data processing =========================================================================================================================================================

## SIGACTS
sigacts$event_id <- seq.int(nrow(sigacts))
sigacts = sigacts[, `:=` (lat = as.numeric(str_sub(lat, end = -2)), 
                          lon = as.numeric(str_sub(lon, end = -2)), 
                          date = as.Date(time), 
                          year = as.integer(year(time)),
                          data_set = 'sigacts',
                          geo_prec = 1L) ][
                          , loc_within_25km := fifelse(geo_prec <= 2L, 1L, 0) ][
                          year %in% list(2013,2014), ][
                          , .(event_id, event_type, event_category, lat, lon, date, year, data_set, geo_prec, loc_within_25km)]
# adding event id
setnames(sigacts, 'event_category', 'sub_event_type')

# convert to spatial object.
sigacts_sf <- st_as_sf(sigacts, coords = c("lon", "lat"),  crs = 4326)

# get all sigacts events within Afg
eventsWithinAfg <- function(conflicts, districts){
  conflict_within = sf::st_join(x = conflicts, 
                                y = districts,
                                join = sf::st_within) %>% 
    filter(!is.na(DISTID)) %>%
    mutate(year = as.numeric(year))
}
sigacts_within = eventsWithinAfg(sigacts_sf, districts)
sigacts_within_prec = sigacts_within %>%
  filter(loc_within_25km == 1) %>%
  mutate(full_event_type = sprintf('%s%s', event_type, sub_event_type))

sigacts_class = fread(paths[['sigacts_event_class']]) %>%
  .[, full_event_type := sprintf('%s%s', event_type, sub_event_type)] %>%
  .[, `:=` (event_type = NULL, sub_event_type = NULL)]

sigacts_data = merge(sigacts_within_prec, sigacts_class, by = 'full_event_type', all.x = TRUE)


sigacts_data <- sigacts_data %>%
  mutate(type = case_when(
    classification == 3 & friendly == 0 ~ "Insurgent Violence",
    classification == 3 & friendly == 1 ~ "State-led Violence",
    classification != 3 & friendly == 0 ~ "Other Insurgent Activity",
    classification != 3 & friendly == 1 ~ "Other State-led Activity",
    TRUE ~ NA_character_  
  ))

table(sigacts_data$type)


# plot the heatmap =========================================================================================================================================================

violence_types <- c(
  "Insurgent Violence",
  "State-led Violence",
  "Other Insurgent Activity",
  "Other State-led Activity"
)

file_names <- c(
  "sigacts_insurgent_violence_heatmap.png",
  "sigacts_stateled_violence_heatmap.png",
  "sigacts_other_insurgent_heatmap.png",
  "sigacts_other_stateled_heatmap.png"
)

grid <- st_make_grid(districts, cellsize = 0.05, square = TRUE)
grid_sf <- st_sf(grid_id = 1:length(grid), geometry = grid) %>%
  st_filter(districts, .predicate = st_intersects)


# ---------- STEP 1: calculate global max ----------
# do the log_count
sigacts_counts <- sigacts_data %>%
  st_join(grid_sf, left = FALSE) %>%
  st_drop_geometry() %>%
  group_by(type, grid_id) %>%
  summarise(count = n(), .groups = "drop")

global_max <- max(log1p(sigacts_counts$count))
raw_global_max <- max(sigacts_counts$count)     


# ---------- STEP 2: loop for graphing ----------
ref_plot <- NULL  # will hold first plot with legend, for legend extraction

for (i in seq_along(violence_types)) {
  
  vt <- violence_types[i]
  file_name <- paste0(paths[['figOutput']], "/", file_names[i])
  
  # filter points for this type
  points_sf <- sigacts_data %>% filter(type == vt)
  
  # join with grid
  joined <- st_join(points_sf, grid_sf, left = FALSE)
  
  # calculate heatmap counts
  heatmap_df <- grid_sf %>%
    left_join(
      joined %>%
        st_drop_geometry() %>%
        group_by(grid_id) %>%
        summarise(count = n(), .groups = "drop"),
      by = "grid_id"
    ) %>%
    replace_na(list(count = 0)) %>%
    mutate(log_count = log1p(count))  # log(1+x)
  
  # plot with fixed color scale
  plot_heatmap <- ggplot() +
    geom_sf(data = heatmap_df, aes(fill = log_count), color = NA) +
    geom_sf(data = districts, fill = NA, color = "black", size = 0.02) +
    scale_fill_gradientn(
      colors = c("#FFFFFF", "#FFE699", "#FFA500", "#FF6600", "#990000"),
      values = scales::rescale(c(0, 0.5, 1.5, 3, global_max), from = c(0, global_max)),
      limits = c(0, global_max),  # fix the scale so that comparable between graphs
      breaks = c(0, 1.87938, 3.75876, 5.63814, 7.51752), 
      name = NULL, 
      labels = function(x) round(expm1(x))
    ) +
    theme_void() +
    theme(
      legend.position = "none",
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA), 
      legend.title = element_text(size = 10, lineheight = 0.8), 
      legend.text = element_text(size = 8)  
    ) + guides(
      fill = guide_colorbar(
        title = "\\# of incidents <br><span style='font-size:8pt'>(log scale)</span>",
        title.theme = ggtext::element_markdown(
          size = 10,                
          lineheight = 1.0,
          margin = margin(b = 5.5)   
        ),
        label.theme = ggplot2::element_text(size = 8.5),
        barheight = grid::unit(30, "mm"),
        barwidth  = grid::unit(6, "mm")
      )
    )
  
  # capture first plot (with legend re-enabled) for legend extraction
  if (i == 1) ref_plot <- plot_heatmap + theme(legend.position = "right")

  # save map (no legend)
  ggsave(
    filename = file_name,
    plot = plot_heatmap,
    height = 5, width = 6,
    dpi = 900
  )

  message("Saved heatmap for ", vt, " as ", file_names[i])
}

# ---------- STEP 3: extract and save standalone legend ----------
legend_grob <- cowplot::get_legend(ref_plot)
ggsave(
  filename = file.path(paths[['figOutput']], "legend.png"),
  plot     = cowplot::ggdraw(legend_grob),
  height   = 3, width = 1.2,
  dpi      = 900
)
message("Saved legend.png")




