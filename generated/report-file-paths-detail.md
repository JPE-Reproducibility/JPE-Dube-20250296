## Filepaths Analysis Details

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/Fig3.R**

- Line 9, unix : # Input:  Data/figures_data/cdr_shortcode_relativemins_data.csv
- Line 10, unix : #         Data/figures_data/cdr_sms_relativemins_data.csv
- Line 11, unix : #         Data/figures_data/cdr_data_relativemins_data.csv
- Line 12, unix : # Output: Output/Figures/day_shortcodevol_zoomed.pdf
- Line 13, unix : #         Output/Figures/day_smsvol_zoomed.pdf
- Line 14, unix : #         Output/Figures/day_datavol_zoomed.pdf

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/All_Figures.R**

- Line 5, unix : # Produces all figures in Output/Figures/.

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/TabA13.R**

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

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/08_02_gen_hash_districtmonth_continuity_ind.py**

- Line 8, unix : # same/different location flags. Aggregates these into strict and
- Line 37, unix : 'homelocations_districtmonth': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locations/district_month',
- Line 39, unix : 'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locations/district_month/continuity_tables'
- Line 53, unix : # Check how many missing months turn up within the prior 3/6 months
- Line 123, unix : # Counts - same/different home locations in the past 3/6 months
- Line 135, unix : # Get counts of missing months in prior months (in 3/6 period)
- Line 145, unix : (1) Strict Continuity - (3 or 6 months) - The hash is present (in any location) for the past 3/6 months.
- Line 146, unix : (2) Relaxed Continuity - (3 or 6 months) - The hash is present (in any location) for the past 2/3 or 4/6 months.
- Line 149, unix : (1) Same Locations - Strict (3 or 6 months) - The hash is present in the same home locations for the each of the past 3/6 months.
- Line 150, unix : (2) Same Locations - Relax (3 or 6 months) - The hash is present in the same home locations for at least 2/3 or 4/6 previous months.
- Line 154, unix : - Strict 3/6 - If the count of same locations is equal to the no. of non-missing data months in the 3/6 pre-period

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/Fig1.R**

- Line 10, unix : # Input:  Data/figures_data/cdr_relativemins_data.csv
- Line 11, unix : # Output: Output/Figures/day_callvol.pdf
- Line 12, unix : #         Output/Figures/day_callvol_zoomed.pdf
- Line 33, unix : 'calls_relativemins_data' = file.path(rootdir, 'Data/figures_data/cdr_relativemins_data.csv'),
- Line 34, unix : 'output_dir' = file.path(rootdir, 'Output/Figures')
- Line 42, unix : hh = floor(min/60)
- Line 129, unix : # lunch/noon
- Line 130, windows : annotate("text", x = -265, y = 10300, label = "Lunch/Noon\nPrayer", size = 6/.pt, colour = 'black') +
- Line 133, windows : annotate("text", x = -90, y = 10300, label = "End of Asr Prayer\nWindow", size = 6/.pt, colour = 'black') +

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/09_03_gen_hashqtr_panel.py**

- Line 31, unix : 'hash_qtr_panel':'/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/quarterly_panel/',
- Line 32, unix : 'hashqtr_droponlytech' : '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/quarterly_panel/only_drop_tech',
- Line 34, unix : 'sms_panel' : '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/sms_panel/quarterly_sms_panel.parquet',
- Line 35, unix : 'data_panel' : '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/data_panel/quarterly_data_panel.parquet',
- Line 37, unix : 'hash_initial_relig':'/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/init_hash_relig/',
- Line 38, unix : 'hash_init_relig_onlydroptech' : '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/init_hash_relig/only_drop_tech',
- Line 40, unix : 'grid_qtr_home_loc':'/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locations/grid_quarter',
- Line 42, unix : 'grid_qtr_spei':'/data/afg_anon/religiosity/panel_data/grid_quarter/230412_gridqtr_spei.csv',
- Line 44, unix : 'output' : '/data/afg_anon/religiosity/panel_data/grid_quarter/hash_grid_qtr_panel',
- Line 45, unix : 'output_droponlytech' : '/data/afg_anon/religiosity/panel_data/ind_qtr/droponlytech'

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/03_gen_compressed_panel.py**

- Line 19, unix : #   Voice calls : ~4.5–5 min/month  (~7.5 hours total)
- Line 20, unix : #   Shortcode   : ~10 s/month       (~15 minutes total)
- Line 21, unix : #   SMS         : ~2–3 min/month    (~3 h 45 min total)
- Line 22, unix : #   Data        : ~1–3 min/month    (~3 h 30 min total)
- Line 39, unix : 'raw_transaction_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_clean_data/',
- Line 41, unix : 'raw_shortcode_transaction_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_clean_data/shortcode_calls/',
- Line 43, unix : 'raw_sms_transaction_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_clean_data/sms_cdr/',
- Line 45, unix : 'raw_data_transaction_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_clean_data/data_cdr/',
- Line 48, unix : 'tower': '/data/afg_anon/religiosity/comp_cdr_pipeline/00_cluster_antenna/240118_antenna_clusters.csv',
- Line 50, unix : 'prayer_timings': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_relig_times/240319_towerday_prayer_and_sunset_time.csv',
- Line 53, unix : 'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_compressed/hash_yearmon_compress',
- Line 55, unix : 'output_dir_shortcode': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_compressed/hash_yearmon_compress_shortcode',
- Line 57, unix : 'output_dir_sms': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_compressed/hash_yearmon_compress_sms',
- Line 59, unix : 'output_dir_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_compressed/hash_yearmon_compress_data'

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/FigA5.R**

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

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/08_03_panel_gridmonth_or_districtmonth_restricted.py**

- Line 7, unix : # month level with the same VPM measures and outage/Ramadan sample
- Line 31, unix : 'hashtowerday_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_panel/',
- Line 33, unix : 'hashtowerday_shortcode_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_shortcode_panel/',
- Line 36, unix : 'tower_griddist': '/data/afg_anon/religiosity/comp_cdr_pipeline/00_cluster_antenna/240118_antenna_clusters_centroid.csv',
- Line 39, unix : 'continuity_indicators': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locations/district_month/continuity_tables',
- Line 42, unix : 'output': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panels'
- Line 45, unix : #'output_gridmonth': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/gridmonth_panel/',
- Line 47, unix : #'output_districtmonth': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmonth_panel/'
- Line 357, unix : test = pl.read_csv('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panels/distmon_timespacerbst_panels/no_diffloc_3mo/cdr_distmonth_no_diffloc_3mo_wo_outages_tomidnight_w_ramadan_panel_241014_mod.csv')
- Line 365, unix : test2 = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panels/distmon_timespacerbst_panels/no_diffloc_3mo/cdr_distmonth_no_diffloc_3mo_wo_outages_tomidnight_w_ramadan_panel_nodiffloc_mod.parquet')

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/12_240213_gen_widewheat_panel.do**

- Line 13, unix : irrigated/rainfed area and yield) is fully commented out. The name is a
- Line 88, unix : drop in 1/5
- Line 278, unix : foreach mes of numlist 1/12 {
- Line 281, unix : foreach mes of numlist 1/12{

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/09_01_gen_hash_level_relig.py**

- Line 51, unix : # Filtering Night and/or Tech Outages

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/FigA3.R**

- Line 8, unix : # Input:  Data/figures_data/n_users_combined.csv
- Line 9, unix : # Output: Output/Figures/users_by_month.pdf
- Line 46, unix : 'calls' = file.path(maindir, 'Data/figures_data/n_users_combined.csv'),
- Line 48, unix : 'fig_output' = file.path(maindir, 'Output/Figures')
- Line 71, windows : scale_x_date(date_labels = "%b\n%Y",date_breaks = "3 months", limits = c(as.Date('2013-01-01'), max = as.Date('2020-11-01')),

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/01_antenna_tower_griddist_mapping.R**

- Line 33, unix : 'shp_cntry' = file.path(maindir, 'Data/Districts/gadm36_AFG_0.shp'),
- Line 35, unix : 'shp_districts' = file.path(maindir, 'Data/Districts/district398.shp'),
- Line 37, unix : 'grid_raster' = file.path(maindir, 'Data/Drought/Grid/rasterwithmask.nc'),
- Line 40, unix : 'antenna_raw' = file.path(maindir, 'Data/CDR/antennas/raw/cell_lookup_combined_2020-04-01.csv'),
- Line 46, unix : 'outputdir' = file.path(maindir, 'Data/CDR/antennas')
- Line 91, unix : # Add district/province info by grid
- Line 110, unix : # Note: There are two grids for which we don't have the corresponding province/district because
- Line 202, unix : # Now add district/province info based on grid centroids
- Line 246, unix : # antenna clusters centroid file. Specifically, we added district/province for each grid as well as district/province
- Line 250, unix : # If you would still like to verify parity b/w the original files from 240118 and the files from Jan 23 (but overwritten), check

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/Fig4.R**

- Line 7, unix : # Input:  Data/raw_data/geo_data/district_shp/district398.shp
- Line 8, unix : #         Data/figures_data/cdr_ethnicity_distlevel.csv
- Line 9, unix : # Output: Output/Figures/religiosity_by_districts_pashto.png
- Line 33, unix : 'shp_districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
- Line 35, unix : 'cdr_ethn_dist' = file.path(maindir, 'Data/figures_data/cdr_ethnicity_distlevel.csv'),
- Line 37, unix : 'outputdir' = file.path(maindir, 'Output/Figures')

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/02_gen_tower_maghrib_and_sunset_time.py**

- Line 28, unix : 'towers': '/data/afg_anon/religiosity/comp_cdr_pipeline/00_cluster_antenna/240118_antenna_clusters_centroid.csv',
- Line 30, unix : 'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_relig_times/'

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/06_gen_hash_towerday_panel.py**

- Line 18, unix : #   Voice CDR  : ~3.5 min/month  (~5.5 hours total)
- Line 19, unix : #   Shortcode  : ~7 s/month      (~10–15 minutes total)
- Line 36, unix : 'compressed_data_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_compressed/hash_yearmon_compress',
- Line 38, unix : 'compressed_shortcode_data_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_compressed/hash_yearmon_compress_shortcode',
- Line 40, unix : 'towerday_indicators': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_panel/towerday_all_indicators.parquet',
- Line 42, unix : 'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_panel/',
- Line 44, unix : 'output_shortcode_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_shortcode_panel/'
- Line 197, unix : df = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_panel/2015/cdr_hash_towerday_2015-6.parquet')

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/FigA2.qmd**

- Line 9, unix : # Input:  Data/figures_data/country_shp/gadm36_AFG_0.shp
- Line 10, unix : #         Data/figures_data/district_shp/district398.shp
- Line 11, unix : #         Data/figures_data/synthetic/cell_lookup_antenna_synthetic.csv
- Line 12, unix : # Output: Output/Figures/FigA2_cell_towers_in_afg.pdf
- Line 37, unix : 'shp_cntry' = file.path(maindir, 'Data/figures_data/country_shp/gadm36_AFG_0.shp'),
- Line 38, unix : 'shp_districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
- Line 39, unix : 'tower_file' = file.path(maindir, 'Data/figures_data/synthetic/cell_lookup_antenna_synthetic.csv')
- Line 88, unix : ggsave(filename = file.path(maindir, 'Output/Figures/FigA2_cell_towers_in_afg.pdf'),

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/04_gen_outage_ind.py**

- Line 34, unix : 'compressed_towday' : '/data/afg_anon/religiosity/comp_cdr_pipeline/02_compressed/hash_yearmon_compress',
- Line 36, unix : 'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/04_outages/techoutage'

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/07_panel_gridmonth_or_districtmonth.py**

- Line 7, unix : # unique subscriber counts (nhash, nhash_robust), and total/average
- Line 38, unix : 'hashtowerday_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_panel/',
- Line 40, unix : 'hashtowerday_shortcode_data': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_shortcode_panel/',
- Line 43, unix : 'tower_griddist': '/data/afg_anon/religiosity/comp_cdr_pipeline/00_cluster_antenna/240118_antenna_clusters_centroid.csv',
- Line 46, unix : 'output_gridmonth': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/gridmonth_panel/',
- Line 48, unix : 'output_gridmonth_shortcode': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/gridmonth_shortcode_panel/',
- Line 50, unix : 'output_districtmonth': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmonth_panel/',
- Line 52, unix : 'output_districtmonth_shortcode': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmonth_shortcode_panel/'

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/05_gen_towerday_indicators_panel.py**

- Line 29, unix : 'towers': '/data/afg_anon/religiosity/comp_cdr_pipeline/00_cluster_antenna/240118_antenna_clusters_centroid.csv',
- Line 32, unix : 'ramadan_days': '/data/afg_anon/religiosity/comp_cdr_pipeline/04_outages/220315_ramadan.csv',
- Line 35, unix : 'nightoutage': '/data/afg_anon/religiosity/comp_cdr_pipeline/04_outages/nightoutage/cdr_nightoutage_panel.csv',
- Line 37, unix : 'techoutage': '/data/afg_anon/religiosity/comp_cdr_pipeline/04_outages/techoutage/cdr_techoutage_panel.parquet',
- Line 39, unix : 'districtday_techoutage': '/data/afg_anon/religiosity/comp_cdr_pipeline/04_outages/techoutage/cdr_districtday_techoutage_panel.parquet',
- Line 41, unix : 'tower_outage': '/data/afg_anon/religiosity/comp_cdr_pipeline/04_outages/techoutage/cdr_outage_panel.parquet',
- Line 44, unix : 'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_towerday_panel/'

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/FigA4.R**

- Line 8, unix : # Input:  Data/figures_data/survey_relig_aggregated_counts.csv
- Line 31, unix : 'survey' = file.path(maindir, 'Data/figures_data/survey_relig_aggregated_counts.csv'),
- Line 33, unix : 'fig_output' = file.path(maindir, 'Output/Figures')

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/All_Tables.do**

- Line 8, unix : OUTPUTS (saved to Output/Tables/):
- Line 31, unix : Reproduced separately in Code/Analysis/TabA13.R

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/08_01_gen_hash_homelocations.py**

- Line 35, unix : 'compressed_data_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/02_compressed/hash_yearmon_compress',
- Line 37, unix : 'tower_griddist': '/data/afg_anon/religiosity/comp_cdr_pipeline/00_cluster_antenna/240118_antenna_clusters_centroid.csv',
- Line 39, unix : 'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locations/'
- Line 72, unix : # Get Daily Modal Grid/District
- Line 119, unix : This function uses the daily modal location file (district/grid). The file can either be daily modal location for 1 month (monthly)
- Line 120, unix : or can be a combined file for 3 months in the quarter. It then finds the total calls per location (dist/grid) for the time level, and then finds the location (dist/grid) with the maximum call volume.
- Line 121, unix : Note: In case of multiple locations (dist/grid) having the same call volume, it picks the first one.
- Line 138, unix : # Get Modal Location (district/grid) for the time level (month/quarter)
- Line 281, unix : df_homeloc = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locations/grid_quarter/2018/home_locations_2018-Q1.parquet')
- Line 285, unix : df_homeloc_old = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/_archive_202307_hash_home_loc/grid_qtr_home_locs/2018/2018-Q1.parquet')
- Line 289, unix : df_homeloc_oldold = pl.read_csv('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/_archive_202307_hash_home_loc/grd_qtr_home_locs_bkp_202304/2018_quarterly_home_locs.csv')
- Line 293, unix : df_hashqtr_panel = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/quarterly_panel/2018_quarterly_panel.parquet')
- Line 299, unix : df_homeloc = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locations/grid_quarter/2013/home_locations_2013-Q2.parquet')
- Line 300, unix : print(df_homeloc.select('phonehash').n_unique()) # 4,312,500 # 4,170,936 (after dropping night/tech outages)
- Line 304, unix : df_hashqtr_panel = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/quarterly_panel/2013_quarterly_panel.parquet')

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/09_02_gen_init_hash_relig.py**

- Line 8, unix : # Maghrib), and assigns each subscriber to median/tercile/quartile

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/Fig2.R**

- Line 5, unix : #   Panel A: Full heatmap (Jan 2015 – Dec 2016), with sunrise/sunset lines,
- Line 10, unix : # Input:  Data/figures_data/cdr_relativemins_day_1516_withsun.csv
- Line 11, unix : # Output: Output/Figures/heatmap_full_w_sunrise.png
- Line 12, unix : #         Output/Figures/heatmap_zoomed.png
- Line 39, unix : 'data' = file.path(rootdir, 'Data/figures_data/cdr_relativemins_day_1516_withsun.csv'),
- Line 40, unix : 'output_dir' = file.path(rootdir, 'Output/Figures')
- Line 46, unix : hh = floor(min/60)
- Line 83, windows : labs_fullfig = strftime(breaks_fullfig, format = "%b %d\n%Y")
- Line 127, windows : labs_zoomedfig = strftime(breaks_zoomedfig, format = "%b %d\n%a")

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Analysis/FigA6.R**

- Line 8, unix : # Input:  Data/figures_data/rasterwithmask.nc   (grid geometry)
- Line 9, unix : #         Data/figures_data/spei_cellym.dta     (x, y, ym, speipm12_g, year)
- Line 11, unix : #         raw_data/climate/drought_gaussian_cellmonth_220322_temp.dta;
- Line 13, unix : # Output: Output/Figures/spei_by_district.pdf
- Line 37, unix : 'grid_raster' = file.path(maindir, 'Data/figures_data/rasterwithmask.nc'),
- Line 39, unix : 'spei_grid_data' = file.path(maindir, 'Data/figures_data/spei_cellym.dta'),
- Line 42, unix : 'outputdir' = file.path(maindir, 'Output/Figures')
- Line 65, unix : # Add district/province info by grid

**/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/Code/Cleaning/10_SIGACTS_merge_cdr.R**

- Line 7, unix : # and type (IED, direct fire, friendly/enemy), constructs cumulative
- Line 25, unix : 'sigacts'                      = '/data/afg_anon/networks/conflict/SIGACTS/sigacts_w_grid_dist_id.csv',
- Line 26, unix : 'sigacts_event_class'          = '/data/afg_anon/networks/conflict/SIGACTS/SIGACTS_event_classifications.csv',
- Line 27, unix : 'acsor'                        = '/data/afg_anon/networks/conflict/ACSOR/acsor_distmonth.csv',
- Line 28, unix : 'districtmonth'                = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmonth_panel/cdr_districtmonth_allsample_panel.csv',
- Line 29, unix : 'districtmonth_nodiffhome6mo'  = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panels/distmon_timespacerbst_panels/no_diffloc_6mo/cdr_distmonth_no_diffloc_6mo_wo_outages_tomidnight_w_ramadan_panel.csv',
- Line 30, unix : 'districtmonth_nodiffhome3mo'  = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panels/distmon_timespacerbst_panels/no_diffloc_3mo/cdr_distmonth_no_diffloc_3mo_wo_outages_tomidnight_w_ramadan_panel_241014_mod.csv',
- Line 31, unix : 'districtmonth_nodiffhome3mo_old' = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panels/distmon_timespacerbst_panels/no_diffloc_3mo/cdr_distmonth_no_diffloc_3mo_wo_outages_tomidnight_w_ramadan_panel_nodiffloc_mod.csv',
- Line 32, unix : 'districtmonth_timerbst3mo'    = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panels/distmon_timerbst_panels/is_strict_cont_3mo/cdr_distmonth_is_strict_cont_3mo_wo_outages_tomidnight_w_ramadan_panel_241014_mod.csv',
- Line 33, unix : 'districtmonth_shortcode'      = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmonth_shortcode_panel/cdr_districtmonth_shortcode_allsample_panel.csv',
- Line 34, unix : 'distrlvl_ethnicity_10km'      = '/data/afg_anon/networks/dyad_pipeline/03_panel/distr_mon_chars/ethnicity_10kmtower_districtlevel.csv',
- Line 35, unix : 'sigacts_cdr_df_output'        = '/data/afg_anon/networks/conflict/SIGACTS'

