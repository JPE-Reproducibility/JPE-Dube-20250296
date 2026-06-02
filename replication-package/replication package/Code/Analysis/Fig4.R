# ============================================================================
# Fig4.R
#
# Produces Figure 4: District-Level Map of Maghrib Dip (Z-Score), with
#   Pashto-majority district boundaries overlaid.
#
# Input:  Data/raw_data/geo_data/district_shp/district398.shp
#         Data/figures_data/cdr_ethnicity_distlevel.csv
# Output: Output/Figures/religiosity_by_districts_pashto.png
#
# Required packages: pacman (loads tidyverse, stringr, haven, data.table,
#                    sf, grid, lubridate, stars, this.path, geosphere,
#                    fastcluster, kableExtra)
# To install:  install.packages("pacman")
#
# USAGE: No path configuration needed. Run as-is — maindir is resolved
#        automatically relative to this script's location via this.path.
# ============================================================================

# setup env and paths =========================================================================================================================================================

# Load Packages
if (!require(pacman)) install.packages('pacman', repos = 'https://cran.rstudio.com')
pacman::p_load(tidyverse, stringr, haven, data.table, sf, grid, lubridate, stars, this.path, geosphere, fastcluster, kableExtra)

# Setting home directory
maindir <- dirname(dirname(this.path::this.dir()))


# File Paths
paths = list(
  # District shapefile
  'shp_districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
  # District Religiosity and Ethnicity
  'cdr_ethn_dist' = file.path(maindir, 'Data/figures_data/cdr_ethnicity_distlevel.csv'),
  # Output
  'outputdir' = file.path(maindir, 'Output/Figures')
)

crs_proj = 24313




# read data ===============================================================================================================================================================


#----------------------------   District Geometry    -------------------------#

df_cdr_dist = read_csv(paths[['cdr_ethn_dist']])

# Get Afghanistan districts
geodf_districts = read_sf(paths[['shp_districts']]) |>
  st_transform(crs_proj) |>
  # tidy columns
  rename(provinceName = PROV_34_NA,
         districtName = DIST_34_NA,
         distid = DISTID,
         provid = PROVID) |>
  dplyr::select(-OBJECTID) |>
  
  # add religiosity
  left_join(df_cdr_dist, by = "distid")




#------------------   Pashto-majority Multilinestring    ---------------------#

global_proj_crs <- 32642

dist_ethn <- geodf_districts |>
  filter(!is.na(vpm_diff_30m_zscore)) |> 
  group_by(maj_ethn) |>
  summarise(geometry = st_union(geometry)) |>
  st_as_sf() |>
  st_transform(global_proj_crs) |>
  st_cast("MULTILINESTRING")


dist_ethn = dist_ethn |>
  filter(maj_ethn == "pashto") |>
  mutate(maj_ethn = str_to_title(maj_ethn))



# plot the figure ========================================================================================================================================================



p = ggplot() +
  geom_sf(data = geodf_districts, aes(fill = vpm_diff_30m_zscore), colour = NA) +
  scale_fill_gradient2(low = "#ffefce", mid = "#ff3214", high = "#120000", na.value = "#d7d7d7", limits = c(-3, 3)) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_blank(),
        panel.border = element_blank(), 
        panel.background = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank()) +
  labs(fill = "Z-Score of Maghrib Dip")



p2 = p + geom_sf(data = dist_ethn, aes(colour = maj_ethn), linewidth = 0.5) +
  scale_colour_manual(values = "yellow", labels = "Pashto", name = " ") +
  theme(legend.key = element_rect(fill = "grey70")) +
  guides(colour = guide_legend(order = 1), fill = guide_colorbar(order = 2)) +
  # dari line
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(.95, "npc"),
      x1 = unit(1, "npc"),
      y0 = unit(.369, "npc"),
      y1 = unit(.369, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50"),
      arrow = arrow(type = "closed", length = unit(0.01, "npc"), ends = "last")
    )
  ) +
  # pashto line
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(.95, "npc"),
      x1 = unit(1, "npc"),
      y0 = unit(.412, "npc"),
      y1 = unit(.412, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50"),
      arrow = arrow(type = "closed", length = unit(0.01, "npc"), ends = "last")
    )
  ) + 
  annotation_custom(
    grob = textGrob(
      label = "Pashto (0.52)", 
      x = unit(.895, "npc"),
      y = unit(.412, "npc"),
      gp = gpar(col = "black", fontsize = 7))
  ) +
  annotation_custom(
    grob = textGrob(
      label = "Dari (-0.59)", 
      x = unit(.9, "npc"),
      y = unit(.369, "npc"),
      gp = gpar(col = "black", fontsize = 7)
    )
  )


print(p2) 
ggsave(filename = paste0(paths$outputdir, "/religiosity_by_districts_pashto.png"), width = 8.5, height = 5.3, plot = last_plot())

