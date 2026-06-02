# ============================================================================
# All_Figures.R
#
# Master script: runs all figure-generating scripts in sequence.
# Produces all figures in Output/Figures/.
#
# USAGE: Run this script from any working directory — paths are resolved
#        automatically relative to this file's location via this.path.
#        Requires: install.packages("this.path") if not already installed.
#
# Figures produced:
#   Fig1.R  -> day_callvol.pdf, day_callvol_zoomed.pdf
#   Fig2.R  -> heatmap_full_w_sunrise.png, heatmap_zoomed.png
#   Fig3.R  -> day_shortcodevol_zoomed.pdf, day_smsvol_zoomed.pdf,
#              day_datavol_zoomed.pdf
#   Fig4.R  -> religiosity_by_districts_pashto.png
#   FigA2.qmd -> FigA2_cell_towers_in_afg.pdf  (run independently — synthetic coords, not meaningful)
#   FigA3.R -> users_by_month.pdf
#   FigA4.R -> survey_barplots_<question>.png (one per survey question)
#   FigA5.R -> sigacts_insurgent_violence_heatmap.png,
#              sigacts_stateled_violence_heatmap.png,
#              sigacts_other_insurgent_heatmap.png,
#              sigacts_other_stateled_heatmap.png,
#              legend.png
#   FigA6.R -> spei_by_district.pdf
# ============================================================================

library('this.path')

script_dir <- this.path::this.dir()

scripts <- c(
  "Fig1.R",
  "Fig2.R",
  "Fig3.R",
  "Fig4.R",
  "FigA3.R",
  "FigA4.R",
  "FigA5.R",
  "FigA6.R"
)

for (s in scripts) {
  message("\n====== Running ", s, " ======")
  source(file.path(script_dir, s), local = new.env())
  message("====== Done: ", s, " ======")
}

message("\nAll figures complete.")
