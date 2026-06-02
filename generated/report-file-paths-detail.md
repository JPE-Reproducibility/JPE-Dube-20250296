## Filepaths Analysis Details

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/FigA4.R**

- Line 8, unix : # Input:  Data/figures_data/survey_relig_aggregated_counts.csv
- Line 31, unix : 'survey' = file.path(maindir, 'Data/figures_data/survey_relig_aggregated_counts.csv'),
- Line 33, unix : 'fig_output' = file.path(maindir, 'Output/Figures')

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/TabA13.R**

- Line 11, unix : #             first-stage regression of Maghrib dip on SPEI + grid/quarter
- Line 42, unix : 'hashQtrPanel' = file.path(root, 'Data/tables_data/synthetic/hash_grid_qtr_panel_synthetic.csv'),
- Line 43, unix : 'outputDir'    = file.path(root, 'Output/Tables')
- Line 59, unix : # Load data and split into pre/post-2015 periods
- Line 96, unix : # stored in the panel as medianInitRelig_avg_denom_to15 (above/below median)
- Line 97, unix : # and tercileInitRelig_avg_denom_to15 (tercile rank 0/1/2).
- Line 101, unix : # Col 1: above/below median split
- Line 133, unix : #   Then construct above/below-median and tercile dummies from these residuals
- Line 152, unix : # Construct above/below-median and tercile dummies from residual baseline
- Line 163, unix : # Col 3: above/below-median residual baseline (point estimates; SEs from bootstrap below)
- Line 463, unix : # Write final table to Output/Tables/

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/FigA5.R**

- Line 10, unix : # Input:  Data/figures_data/sigacts_afghanistan.csv
- Line 11, unix : #         Data/figures_data/SIGACTS_event_classifications.csv
- Line 12, unix : #         Data/raw_data/geo_data/district_shp/district398.shp
- Line 13, unix : # Output: Output/Figures/sigacts_insurgent_violence_heatmap.png
- Line 14, unix : #         Output/Figures/sigacts_stateled_violence_heatmap.png
- Line 15, unix : #         Output/Figures/sigacts_other_insurgent_heatmap.png
- Line 16, unix : #         Output/Figures/sigacts_other_stateled_heatmap.png
- Line 17, unix : #         Output/Figures/legend.png  (standalone legend for LaTeX assembly)
- Line 52, unix : 'sigacts' = file.path(maindir, 'Data/figures_data/sigacts_afghanistan.csv'),
- Line 53, unix : 'sigacts_event_class' = file.path(maindir, 'Data/figures_data/SIGACTS_event_classifications.csv'),
- Line 55, unix : 'districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
- Line 57, unix : 'figOutput' = file.path(maindir,'Output/Figures')

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/Fig4.R**

- Line 7, unix : # Input:  Data/raw_data/geo_data/district_shp/district398.shp
- Line 8, unix : #         Data/figures_data/cdr_ethnicity_distlevel.csv
- Line 9, unix : # Output: Output/Figures/religiosity_by_districts_pashto.png
- Line 33, unix : 'shp_districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
- Line 35, unix : 'cdr_ethn_dist' = file.path(maindir, 'Data/figures_data/cdr_ethnicity_distlevel.csv'),
- Line 37, unix : 'outputdir' = file.path(maindir, 'Output/Figures')

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/FigA6.R**

- Line 8, unix : # Input:  Data/figures_data/rasterwithmask.nc   (grid geometry)
- Line 9, unix : #         Data/figures_data/spei_cellym.dta     (x, y, ym, speipm12_g, year)
- Line 11, unix : #         raw_data/climate/drought_gaussian_cellmonth_220322_temp.dta;
- Line 13, unix : # Output: Output/Figures/spei_by_district.pdf
- Line 37, unix : 'grid_raster' = file.path(maindir, 'Data/figures_data/rasterwithmask.nc'),
- Line 39, unix : 'spei_grid_data' = file.path(maindir, 'Data/figures_data/spei_cellym.dta'),
- Line 42, unix : 'outputdir' = file.path(maindir, 'Output/Figures')
- Line 65, unix : # Add district/province info by grid

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/Fig2.R**

- Line 5, unix : #   Panel A: Full heatmap (Jan 2015 – Dec 2016), with sunrise/sunset lines,
- Line 10, unix : # Input:  Data/figures_data/cdr_relativemins_day_1516_withsun.csv
- Line 11, unix : # Output: Output/Figures/heatmap_full_w_sunrise.png
- Line 12, unix : #         Output/Figures/heatmap_zoomed.png
- Line 34, unix : 'data' = file.path(rootdir, 'Data/figures_data/cdr_relativemins_day_1516_withsun.csv'),
- Line 35, unix : 'output_dir' = file.path(rootdir, 'Output/Figures')
- Line 41, unix : hh = floor(min/60)
- Line 78, windows : labs_fullfig = strftime(breaks_fullfig, format = "%b %d\n%Y")
- Line 122, windows : labs_zoomedfig = strftime(breaks_zoomedfig, format = "%b %d\n%a")

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/FigA3.R**

- Line 8, unix : # Input:  Data/figures_data/n_users_combined.csv
- Line 9, unix : # Output: Output/Figures/users_by_month.pdf
- Line 41, unix : 'calls' = file.path(maindir, 'Data/figures_data/n_users_combined.csv'),
- Line 43, unix : 'fig_output' = file.path(maindir, 'Output/Figures')
- Line 66, windows : scale_x_date(date_labels = "%b\n%Y",date_breaks = "3 months", limits = c(as.Date('2013-01-01'), max = as.Date('2020-11-01')),

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/FigA2.qmd**

- Line 9, unix : # Input:  Data/figures_data/country_shp/gadm36_AFG_0.shp
- Line 10, unix : #         Data/figures_data/district_shp/district398.shp
- Line 11, unix : #         Data/figures_data/synthetic/cell_lookup_antenna_synthetic.csv
- Line 12, unix : # Output: Output/Figures/FigA2_cell_towers_in_afg.pdf
- Line 37, unix : 'shp_cntry' = file.path(maindir, 'Data/figures_data/country_shp/gadm36_AFG_0.shp'),
- Line 38, unix : 'shp_districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
- Line 39, unix : 'tower_file' = file.path(maindir, 'Data/figures_data/synthetic/cell_lookup_antenna_synthetic.csv')
- Line 84, unix : ggsave(filename = file.path(maindir, 'Output/Figures/FigA2_cell_towers_in_afg.pdf'),

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/Fig3.R**

- Line 9, unix : # Input:  Data/figures_data/cdr_shortcode_relativemins_data.csv
- Line 10, unix : #         Data/figures_data/cdr_sms_relativemins_data.csv
- Line 11, unix : #         Data/figures_data/cdr_data_relativemins_data.csv
- Line 12, unix : # Output: Output/Figures/day_shortcodevol_zoomed.pdf
- Line 13, unix : #         Output/Figures/day_smsvol_zoomed.pdf
- Line 14, unix : #         Output/Figures/day_datavol_zoomed.pdf

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/All_Figures.R**

- Line 5, unix : # Produces all figures in Output/Figures/.

**/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/Code/Analysis/All_Tables.do**

- Line 8, unix : OUTPUTS (saved to Output/Tables/):
- Line 31, unix : Reproduced separately in Code/Analysis/TabA13.R

