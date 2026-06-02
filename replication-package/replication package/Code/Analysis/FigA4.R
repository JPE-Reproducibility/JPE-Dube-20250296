# ============================================================================
# FigA4.R
#
# Produces Appendix Figure A4: Survey-Based Religiosity Bar Charts.
#   Loops over each unique question in the survey data and saves one bar
#   chart per question showing response category counts and shares.
#
# Input:  Data/figures_data/survey_relig_aggregated_counts.csv
# Output: Output/Figures/survey_barplots_<question>.png
#
# Required packages: pacman (loads tidyverse, ggthemes, this.path, haven)
# To install:  install.packages("pacman")
#
# USAGE: No path configuration needed. Run as-is — maindir is resolved
#        automatically relative to this script's location via this.path.
# ============================================================================

# setup env and paths =========================================================================================================================================================

rm(list = ls())

# Load Packages
if (!require(pacman)) install.packages('pacman', repos = 'https://cran.rstudio.com')
pacman::p_load(tidyverse, ggthemes, this.path, haven)

# Setting home directory
maindir <- dirname(dirname(this.path::this.dir()))

paths = list(
  # num users by type
  'survey' = file.path(maindir, 'Data/figures_data/survey_relig_aggregated_counts.csv'),
  # Output Directory
  'fig_output' = file.path(maindir, 'Output/Figures')
)



# plot the figures ========================================================================================================================================================


df_survey_tidy = read_csv(paths[['survey']]) 

questions = unique(df_survey_tidy$question)

for(x in questions){
  
  data = df_survey_tidy |>
    filter(question == x)
  
  plot = ggplot(data = data) +
    geom_col(aes(y = value, x = reorder(category_name, category_order)), fill = '#800020') +
    geom_text(aes(y = value, x = reorder(category_name, category_order), label = share, vjust = -1)) +
    scale_y_continuous(limits = c(0, 1250), breaks = seq(0, 1250, 250)) +
    labs(y = 'Count', x = '') +
    theme_minimal() +
    theme(panel.grid = element_line(colour = 'gray97'),
          axis.line.x = element_line(colour = 'red', size = 0.75),
          axis.text.x = element_text(size = 7, face = 'bold'),
          axis.ticks.y = element_line(),
          axis.title.x = element_text(vjust = 1, hjust = 0, size = 10, face = 'bold'),
          axis.title.y = element_text(face = 'bold'),
          plot.title = element_text(vjust = 1, size = 12),
          plot.caption = element_text(hjust = 0, colour = 'gray40', size = 8),
          plot.background = element_rect(fill = "white", colour = NA))
  
  
  fname = unique(data$question) |> str_remove_all(" ") |> str_to_lower()
  str_to_lower(str_remove_all(unique(data$question), " "))
  
  ggsave(
    filename = file.path(paths[['fig_output']],
                         paste0('survey_barplots_', fname, '.png')),
    plot = plot,
    width = 6,
    height = 4.5
  )
  
}



