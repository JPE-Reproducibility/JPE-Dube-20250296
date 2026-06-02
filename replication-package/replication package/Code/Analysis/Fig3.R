# ============================================================================
# Fig3.R
#
# Produces Figure 3: Maghrib Dip for Other CDR Types (Zoomed, ±140 min).
#   Panel A: Shortcode calls per minute
#   Panel B: SMS per minute
#   Panel C: Data packets per minute
#
# Input:  Data/figures_data/cdr_shortcode_relativemins_data.csv
#         Data/figures_data/cdr_sms_relativemins_data.csv
#         Data/figures_data/cdr_data_relativemins_data.csv
# Output: Output/Figures/day_shortcodevol_zoomed.pdf
#         Output/Figures/day_smsvol_zoomed.pdf
#         Output/Figures/day_datavol_zoomed.pdf
#
# Required packages: data.table, dplyr, ggplot2, scales
# To install:  install.packages(c("data.table", "dplyr", "ggplot2", "scales"))
#
# USAGE: No path configuration needed. Run as-is — rootdir is resolved
#        automatically relative to this script's location via this.path.
# ============================================================================

# setup env and paths =========================================================================================================================================================

library(data.table)
library(dplyr)
library(ggplot2)
library(scales)
library(this.path)

rootdir <- dirname(dirname(this.path::this.dir()))

paths <- list(
  shortcode = file.path(rootdir, "Data/figures_data/cdr_shortcode_relativemins_data.csv"),
  sms       = file.path(rootdir, "Data/figures_data/cdr_sms_relativemins_data.csv"),
  data      = file.path(rootdir, "Data/figures_data/cdr_data_relativemins_data.csv"),
  output_dir = file.path(rootdir, "Output/Figures")
)


# plot the figures ========================================================================================================================================================

# Theme 
plot_global_theme_zm <- theme(
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  axis.line = element_line(colour = "black"),
  panel.border = element_blank(),
  panel.background = element_blank(),
  plot.title = element_text(size = 5),
  axis.title = element_text(size = 10),
  axis.text.x = element_text(size = 8),
  axis.text.y = element_text(size = 8),
  plot.subtitle = element_text(size = 4)
)

# Common x settings
breaks_zoomfig <- seq(-140, 140, 10)
labs_zoomfig <- as.character(breaks_zoomfig)
labs_zoomfig[c(FALSE, TRUE)] <- ""  

# ---- Config table for each CDR type ----
cfg <- list(
  shortcode = list(
    ylimits = c(150, 450),
    ybreaks = seq(150, 450, 75),
    ylabs   = "Total Shortcode Calls per Minute (Daily Average)",
    out     = "day_shortcodevol_zoomed.pdf"
  ),
  sms = list(
    ylimits = c(5000, 10000),
    ybreaks = seq(5000, 10000, 1000),
    ylabs   = "Total SMS per Minute (Daily Average)",
    out     = "day_smsvol_zoomed.pdf"
  ),
  data = list(
    ylimits = c(5400, 7300),
    ybreaks = seq(5500, 7500, 500),
    ylabs   = "Total Data Packets per Minute (Daily Average)",
    out     = "day_datavol_zoomed.pdf"
  )
)

# ---- Run once, output 3 figures ----
for (cdr_type in names(cfg)) {
  
  message("Plotting: ", cdr_type)
  
  df_per_relmin <- fread(paths[[cdr_type]])
  
  p <- ggplot(
    data = df_per_relmin %>%
      filter(rel_min >= -140, rel_min <= 140)
  ) +
    geom_line(aes(x = rel_min, y = vol_avg), linewidth = 0.5) +
    geom_vline(xintercept = 0, linetype = "dotted") +
    geom_vline(xintercept = -30, linetype = "dotdash", colour = "grey") +
    geom_vline(xintercept = 30, linetype = "dotdash", colour = "grey") +
    labs(
      x = "Minute Relative to Start of Maghrib",
      y = cfg[[cdr_type]]$ylabs
    ) +
    plot_global_theme_zm +
    scale_y_continuous(
      labels = scales::comma,
      expand = c(0, 0),
      limits = cfg[[cdr_type]]$ylimits,
      breaks = cfg[[cdr_type]]$ybreaks
    ) +
    scale_x_continuous(
      breaks = breaks_zoomfig,
      labels = labs_zoomfig,
      expand = expansion(add = c(0, 4))
    ) +
    geom_line(aes(x = rel_min, y = ci_lower), colour = "red", alpha = 0.5, linewidth = 0.2) +
    geom_line(aes(x = rel_min, y = ci_upper), colour = "red", alpha = 0.5, linewidth = 0.2)
  
  out_path <- file.path(paths$output_dir, cfg[[cdr_type]]$out)
  ggsave(out_path, p, dpi = 500, width = 6.5, height = 4.5, units = "in")
}

