# ============================================================================
# FigA6.R
#
# Produces Appendix Figure A6: SPEI (12-month Gaussian) Maps of Afghanistan.
#   Panel A: SPEI averaged over all sample years (2013–2020)
#   Panel B: SPEI during the drought year 2018
#
# Input:  Data/figures_data/rasterwithmask.nc   (grid geometry)
#         Data/figures_data/spei_cellym.dta     (x, y, ym, speipm12_g, year)
#         Note: spei_cellym.dta is a column subset of
#         raw_data/climate/drought_gaussian_cellmonth_220322_temp.dta;
#         values in shared columns are identical.
# Output: Output/Figures/spei_by_district.pdf
#
# Required packages: pacman (loads tidyverse, haven, data.table, sf,
#                    lubridate, stars, this.path, geosphere,
#                    fastcluster, kableExtra)
# To install:  install.packages("pacman")
#
# USAGE: No path configuration needed. Run as-is — maindir is resolved
#        automatically relative to this script's location via this.path.
# ============================================================================

# setup env and paths =========================================================================================================================================================

# Load Packages
if (!require(pacman)) install.packages('pacman', repos = 'https://cran.rstudio.com')
pacman::p_load(tidyverse, haven, data.table, sf, lubridate, stars, this.path, geosphere, fastcluster, kableExtra)

# Setting home directory
maindir <- dirname(dirname(this.path::this.dir()))


# File Paths
paths = list(
  # Grid Raster
  'grid_raster' = file.path(maindir, 'Data/figures_data/rasterwithmask.nc'),
  # SPEI Data
  'spei_grid_data' = file.path(maindir, 'Data/figures_data/spei_cellym.dta'),
  
  # Output
  'outputdir' = file.path(maindir, 'Output/Figures')
)

crs_unproj = 4326
crs_proj = 24313



# read data ===============================================================================================================================================================

# Get Grids
geodf_grid = stars::read_ncdf(paths[['grid_raster']]) |>
  st_as_sf() |>
  st_transform(crs_proj) |>
  dplyr::select(-layer)

# get grid centroids
geodf_grid_centroids = geodf_grid |>
  st_transform(crs_unproj) |>
  st_centroid() |>
  st_coordinates() |>
  as.data.frame() |>
  
  # Add district/province info by grid
  st_as_sf(coords = c('X','Y'), crs = crs_unproj, remove = F) |>
  st_transform(crs_proj) |>
  st_drop_geometry()

# Add centroid to grid
geodf_grid = geodf_grid |>
  mutate(grid_cent_lng = geodf_grid_centroids[,"X"],
         grid_cent_lat = geodf_grid_centroids[,"Y"]) |>
  mutate(gridid = paste0(round(grid_cent_lng, 1), "X", round(grid_cent_lat, 1)))


# SPEI Data
df_spei = haven::read_dta(paths$spei_grid_data) |>
  mutate(gridid = paste0(as.character(round(x, 1)), "X", as.character(round(y,1)))) |>
  dplyr::select(gridid, year, speipm12_g)

df_spei_2018 = df_spei |>
  filter(year == 2018) |>
  group_by(gridid) |>
  summarise(across(.cols = c(speipm12_g),
                   .fns = ~mean(.x, na.rm = T),
                   .names = "{.col}_2018")) |>
  ungroup()

df_spei_avg = df_spei |>
  group_by(gridid) |>
  summarise(across(.cols = c(speipm12_g),
                   .fns = ~mean(.x, na.rm = T))) |>
  ungroup()



# Grids with SPEI
geodf_grid_w_spei = geodf_grid |>
  left_join(df_spei_avg, by = "gridid") |>
  left_join(df_spei_2018, by = "gridid")

geodf_grid_w_spei_long = geodf_grid_w_spei |>
  pivot_longer(cols = c(speipm12_g, speipm12_g_2018),
               names_to = "spei_variable",
               values_to = "spei_value") |>
  filter(spei_variable %in% c('speipm12_g', 'speipm12_g_2018'))


# plot the heatmap =========================================================================================================================================================



ggplot(data = geodf_grid_w_spei_long |>
         mutate(spei_variable = ifelse(spei_variable == "speipm12_g", 
                                       "Panel A: SPEI - All Years (2013-2020)",
                                       "Panel B: SPEI - Drought Year (2018)"))) +
  geom_sf(aes(fill = spei_value), colour = NA) +
  facet_wrap(~spei_variable, nrow = 2) +
  scale_fill_gradient(name = "SPEI", low = "red", high = "yellow") +
  theme(panel.background = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())

ggsave(filename = paste0(paths$outputdir, "/spei_by_district.pdf"), width = 8.5, height = 5.3, plot = last_plot())







