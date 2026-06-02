# ============================================================================
# FigA3.R
#
# Produces Appendix Figure A3: Number of Active Users by Interaction Type
#   per Month (Jan 2013 – Oct 2020).
#   Series: All Interactions, Calls, Data, SMS.
#
# Input:  Data/figures_data/n_users_combined.csv
# Output: Output/Figures/users_by_month.pdf
#
# Required packages: data.table, fixest, DescTools, dplyr, magrittr,
#                    ggplot2, scales, stringr, lubridate, tidyr
# To install:  install.packages(c("data.table", "fixest", "DescTools",
#                "dplyr", "magrittr", "ggplot2", "scales",
#                "stringr", "lubridate", "tidyr"))
#
# USAGE: No path configuration needed. Run as-is — maindir is resolved
#        automatically relative to this script's location via this.path.
# ============================================================================

# setup env and paths =========================================================================================================================================================

library('data.table')
library('fixest')
library('DescTools')
library('dplyr')
library('magrittr')
library('ggplot2')
library('scales')
library('stringr')
library('lubridate')
library('tidyr')
library('this.path')

maindir <- dirname(dirname(this.path::this.dir()))


# Paths
paths = list(
  # num users by type
  'calls' = file.path(maindir, 'Data/figures_data/n_users_combined.csv'),
  # Output Directory
  'fig_output' = file.path(maindir, 'Output/Figures')
)


# read data ===============================================================================================================================================================

# Import Data
num_callers = fread(paths[['calls']])
users_by_month = num_callers[, date := ym(ym2)]
users_by_month = users_by_month %>% 
  complete(data_type, date)
users_by_month = rename(users_by_month, Date = date)



# plot the figure ========================================================================================================================================================

users_bymonth_plot = ggplot(data=users_by_month %>% filter(data_type != 'Shortcode'), aes(x=Date, y=phonehash, colour=factor(data_type), shape = factor(data_type))) +
  geom_point(size = 2, stroke = 1) + geom_line() +
  ylab('Number of users') +
  xlab('Year-Month') +
  labs(color = 'Interaction') +
  scale_y_continuous(labels=comma, expand = c(0,0),limits = c(0, 4500000)) +
  scale_x_date(date_labels = "%b\n%Y",date_breaks = "3 months", limits = c(as.Date('2013-01-01'), max = as.Date('2020-11-01')),
               expand=c(0,0)) +
  scale_colour_manual(name = "Interactions",
                      labels = c("All Interactions", "Calls", "Data", "SMS"),
                      values = c("black", "red", "#1a9e1a", "blue")) +   
  scale_shape_manual(name = "Interactions",
                     labels = c("All Interactions", "Calls", "Data", "SMS"),
                     values = c(16, 3, 8, 4)) +
  theme_classic(base_size = 9)
ggsave(paste0(paths[['fig_output']], '/users_by_month.pdf'), users_bymonth_plot, dpi = 500, width = 9.5, height = 6.5, units = "in")

