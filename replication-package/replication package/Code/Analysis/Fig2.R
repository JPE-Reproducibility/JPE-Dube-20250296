# ============================================================================
# Fig2.R
#
# Produces Figure 2: Heatmap of Call Volume by Time of Day and Date.
#   Panel A: Full heatmap (Jan 2015 – Dec 2016), with sunrise/sunset lines,
#            highlighting the Maghrib Dip and Ramadan 2016.
#   Panel B: Zoomed heatmap, highlighting the
#            Maghrib Dip, Zuhr Prayer, and Friday worship pattern.
#
# Input:  Data/figures_data/cdr_relativemins_day_1516_withsun.csv
# Output: Output/Figures/heatmap_full_w_sunrise.png
#         Output/Figures/heatmap_zoomed.png
#
# Required packages: data.table, dplyr, ggplot2, lubridate, grid
# To install:  install.packages(c("data.table", "dplyr", "ggplot2", "lubridate", "grid"))
#
# USAGE: No path configuration needed. Run as-is — rootdir is resolved
#        automatically relative to this script's location via this.path.
# ============================================================================

# setup env and paths =======================================================================================================================================================

library('data.table')
library('dplyr')
library('ggplot2')
library('lubridate')
library('grid')
library('this.path')

rootdir <- dirname(dirname(this.path::this.dir()))

# Paths
paths = list(
  'data' = file.path(rootdir, 'Data/figures_data/cdr_relativemins_day_1516_withsun.csv'),
  'output_dir' = file.path(rootdir, 'Output/Figures')
)


# Function to Convert minutes to HHMM
convert_min_to_hhmm = function(min){
  hh = floor(min/60)
  mm = min - (hh*60)
  return(sprintf("%02d:%02d", hh, mm))
}


# read data ===============================================================================================================================================================

df_calls_per_relmin = fread(paths[['data']])



# plot the figures ========================================================================================================================================================


#--------------   Figure 2 Panel A    -------------------


heatmap_theme = theme(
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  axis.line = element_line(colour = "black"),
  panel.border = element_blank(), 
  panel.background = element_blank(),
  axis.text = element_text(size = 10),
  axis.title = element_text(size = 12),
  legend.text = element_text(size = 5),
  legend.title = element_text(size = 6)
)

scale_limits = c(
  min(df_calls_per_relmin$ncalls),
  max(df_calls_per_relmin$ncalls)
)

# Full Figure
breaks_fullfig = seq.Date(as.Date("2015-01-01"), as.Date("2016-12-31"), by = "month")
labs_fullfig = strftime(breaks_fullfig, format = "%b %d\n%Y")
labs_fullfig[c(F, T, T)] = ""


plot = ggplot(data = df_calls_per_relmin) +
  geom_tile(aes(x = date, y = abs_min, fill = ncalls)) +
  # sunset line
  geom_line(aes(x = date, y = sunset_min), colour = "blue", linewidth = 0.5, linetype = "dotdash", alpha = 0.5) +
  # sunrise line
  geom_line(aes(x = date, y = sunrise_min), colour = "blue", linewidth = 0.5, linetype = "dotdash", alpha = 0.5) +
  # Sunrise
  annotate("text", x = as.Date("2017-02-10"), y = 430, label = "Sunrise", size = 6/.pt, colour = 'gray50') +
  annotate("segment", x = as.Date("2017-01-25"), y = 430, xend = as.Date("2017-01-5"), yend = 430, arrow = arrow(type = "open", length = unit(0.01, "npc")), colour = 'gray50', linewidth = 0.35) +
  # Start of Sunset
  annotate("text", x = as.Date("2017-02-10"), y = 1000, label = "Sunset", size = 6/.pt, colour = 'gray50') +
  annotate("segment", x = as.Date("2017-01-25"), y = 1000, xend = as.Date("2017-01-5"), yend = 1020, arrow = arrow(type = "open", length = unit(0.01, "npc")), colour = 'gray50', linewidth = 0.35) +
  # Maghrib Dip
  annotate("text", x = as.Date("2017-02-15"), y = 1050, label = "Maghrib Dip", size = 6/.pt, colour = 'gray50') +
  annotate("segment", x = as.Date("2017-01-25"), y = 1050, xend = as.Date("2017-01-5"), yend = 1035, arrow = arrow(type = "open", length = unit(0.01, "npc")), colour = 'gray50', linewidth = 0.35) +
  # Ramadan
  annotate("text", x = as.Date("2017-02-15"), y = 1440, label = "Ramadan 2016 \n (Jun 6 - Jul 5)", size = 6/.pt, colour = 'gray50') +
  annotate("segment", x = as.Date("2017-01-5"), y = 1460, xend = as.Date("2016-06-15"), yend = 1460, arrow = arrow(type = "open", length = unit(0.01, "npc")), colour = 'gray50', linewidth = 0.35) +
  
  scale_fill_gradient(low = "white", high = "red", limits = scale_limits) +
  labs(x = "Date", 
       y = "Time of Day", 
       fill = "Total Calls per Minute") +
  scale_y_continuous(
    breaks = seq(0, 1440, 60),
    labels = convert_min_to_hhmm) +
  coord_cartesian(ylim = c(60, 1400), xlim = c(as.Date('2015-01-01'), as.Date('2016-12-31')), clip = "off") +
  heatmap_theme +
  scale_x_date(expand = c(0, 0),
               breaks = breaks_fullfig,
               labels = labs_fullfig)

ggsave(file.path(paths[['output_dir']], 'heatmap_full_w_sunrise.png'), plot, dpi = 500, width = 11, height = 5.5, units = "in")



#--------------   Figure 2 Panel B    -------------------

# zoomed in heatmap
breaks_zoomedfig = seq.Date(as.Date("2015-10-28"), as.Date("2015-11-20"), by = "day")
labs_zoomedfig = strftime(breaks_zoomedfig, format = "%b %d\n%a")
labs_zoomedfig[c(F,T, T)] = ""

filter_zoomedfig = seq.Date(as.Date("2015-10-28"), as.Date("2015-11-21"), by = "day")
df_for_zoomed = df_calls_per_relmin %>%
  filter(date %in% filter_zoomedfig) %>%
  mutate(weekday = weekdays(date)) %>%
  mutate(weekday_abbr = substr(weekday, 1, 3))


plot_zoomed = ggplot(data = df_for_zoomed) +
  geom_tile(aes(x = date, y = abs_min, fill = ncalls)) +
  # Zuhr Prayer
  annotation_custom(
    grob = textGrob(
      label = "Zuhr Prayer", 
      x = unit(1.073, "npc"),
      y = unit(0.548, "npc"),
      gp = gpar(col = "grey50", fontsize = 7))
  ) +
  annotation_custom(
    grob = textGrob(
      label = "Maghrib Dip", 
      x = unit(1.073, "npc"),
      y = unit(0.704, "npc"),
      gp = gpar(col = "grey50", fontsize = 7))
  ) +
  annotation_custom(
    grob = textGrob(
      label = "Friday (sacred\nday of worship)", 
      x = unit(1.073, "npc"),
      y = unit(1.05, "npc"),
      gp = gpar(col = "grey50", fontsize = 7))
  ) +
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(1.04, "npc"),
      x1 = unit(1.005, "npc"),
      y0 = unit(0.704, "npc"),
      y1 = unit(0.704, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50"),
      arrow = arrow(type = "closed", length = unit(0.01, "npc"), ends = "last")
    )
  ) +
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(1.04, "npc"),
      x1 = unit(1.005, "npc"),
      y0 = unit(0.548, "npc"),
      y1 = unit(0.548, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50"),
      arrow = arrow(type = "closed", length = unit(0.01, "npc"), ends = "last")
    )
  ) +
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(.104, "npc"),
      x1 = unit(1.03, "npc"),
      y0 = unit(1.05, "npc"),
      y1 = unit(1.05, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50")
    )
  ) +
  # line 1
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(.104, "npc"),
      x1 = unit(.104, "npc"),
      y0 = unit(1.05, "npc"),
      y1 = unit(1.01, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50"),
      arrow = arrow(type = "closed", length = unit(0.01, "npc"), ends = "last")
    )
  ) +
  # line 2
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(.396, "npc"),
      x1 = unit(.396, "npc"),
      y0 = unit(1.05, "npc"),
      y1 = unit(1.01, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50"),
      arrow = arrow(type = "closed", length = unit(0.01, "npc"), ends = "last")
    )
  ) +
  # line 3
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(.687, "npc"),
      x1 = unit(.687, "npc"),
      y0 = unit(1.05, "npc"),
      y1 = unit(1.01, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50"),
      arrow = arrow(type = "closed", length = unit(0.01, "npc"), ends = "last")
    )
  ) +
  # line 4
  annotation_custom(
    grob = segmentsGrob(
      x0 = unit(.9785, "npc"),
      x1 = unit(.9785, "npc"),
      y0 = unit(1.05, "npc"),
      y1 = unit(1.01, "npc"),
      gp = gpar(col = "grey50", lwd = 0.5, fill = "grey50"),
      arrow = arrow(type = "closed", length = unit(0.01, "npc"), ends = "last")
    )
  ) +
  scale_fill_gradient(low = "white", high = "red", limits = scale_limits) +
  labs(x = "Date", 
       y = "Time of Day", 
       fill = "Total Calls per Minute") +
  scale_y_continuous(
    breaks = seq(0, 1440, 60),
    labels = convert_min_to_hhmm) +
  coord_cartesian(ylim = c(60, 1400), xlim = c(as.Date('2015-10-28') - 0.5, as.Date('2015-11-20') + 0.5), clip = "off") +
  heatmap_theme +
  theme(legend.position = "none", plot.margin = unit(c(3, 7, 1, 1), "lines")) +
  scale_x_date(
    expand = c(0, 0),
    breaks = breaks_zoomedfig,
    labels = labs_zoomedfig,
    limits = c(as.Date('2015-10-26') + 0.5, as.Date('2015-11-20') + 0.5))


ggsave(file.path(paths[['output_dir']], 'heatmap_zoomed.png'), plot_zoomed, dpi = 500, width = 11, height = 5.5, units = "in")
