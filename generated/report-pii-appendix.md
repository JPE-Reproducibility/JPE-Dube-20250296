## Appendix: Detailed PII Detection Results

*Generated on 2026-09-29 09:27:46*

This appendix lists all detected instances of potential personally identifiable information (PII) in the project files. Each entry shows the matched PII terms and, for data files, sample values to help verify whether the flagged content is indeed sensitive.

### Full Summary Table

| File Type | File | Variables/References | PII Categories |
|-----------|------|----------------------|----------------|
| Data | `CDR_data_usage_raw_synthetic.csv` | 1 | phone |
| Data | `CDR_phone_call_raw_synthetic.csv` | 1 | phone |
| Data | `CDR_shortcode_raw_synthetic.csv` | 1 | phone |
| Data | `CDR_sms_raw_synthetic.csv` | 2 | phone, url |
| Data | `cdr_and_climate_gm.csv` | 1 | district |
| Data | `cdr_and_climate_gm.dta` | 1 | district |
| Data | `cell_lookup_antenna_synthetic.csv` | 4 | lon, lat, district |
| Data | `dist_level.csv` | 1 | name |
| Data | `dist_level.dta` | 1 | name |
| Data | `gadm36_AFG_0.dbf` | 1 | name |
| Data | `grid_level.csv` | 3 | lat, loc |
| Data | `grid_level.dta` | 3 | lat, loc |
| Data | `hash_grid_qtr_panel_synthetic.csv` | 1 | phone |
| Data | `n_users_combined.csv` | 1 | phone |
| Data | `sigacts_afghanistan.csv` | 2 | lat, lon |
| Data | `smallsurvey_finalsample_synthetic.csv` | 1 | name |
| Data | `smallsurvey_finalsample_synthetic.dta` | 1 | name |
| Data | `survey_relig_aggregated_counts.csv` | 1 | name |
| Code | `01_antenna_tower_griddist_mapping.R` | 60 | degree, district, loc, country, name, coord, lat, lon, lname, location |
| Code | `02_gen_tower_maghrib_and_sunset_time.py` | 17 | lat, loc, lon, son, minute, name |
| Code | `03_gen_compressed_panel.py` | 70 | lat, minute, loc, location, fname, name, lname, phone, url |
| Code | `04_gen_outage_ind.py` | 25 | fname, name, lat, minute, lon |
| Code | `05_gen_towerday_indicators_panel.py` | 10 | district, name |
| Code | `06_gen_hash_towerday_panel.py` | 26 | lat, minute, name, phone, lon, lname, loc |
| Code | `07_panel_gridmonth_or_districtmonth.py` | 35 | district, minute, lat, phone, lon, name, loc, fname |
| Code | `08_01_gen_hash_homelocations.py` | 88 | loc, location, district, lat, phone, name |
| Code | `08_02_gen_hash_districtmonth_continuity_ind.py` | 90 | district, loc, location, minute, lat, name, phone, second |
| Code | `08_03_panel_gridmonth_or_districtmonth_restricted.py` | 36 | district, lat, loc, location, phone, lon, name, fname |
| Code | `09_01_gen_hash_level_relig.py` | 9 | lat, minute, phone, name |
| Code | `09_02_gen_init_hash_relig.py` | 19 | lat, minute, name, phone |
| Code | `09_03_gen_hashqtr_panel.py` | 49 | loc, location, phone, lat, name |
| Code | `10_SIGACTS_merge_cdr.R` | 28 | district, lat, city, network, loc, name |
| Code | `11_01_220805_create_master.do` | 19 | block, loc, location, coord, lat, lon, district, name |
| Code | `11_02_220824_create_master_shortcode.do` | 17 | loc, location, coord, lat, lon, district |
| Code | `11_03_250108_update_master_cdr.do` | 7 | loc, name, lat |
| Code | `12_240213_gen_widewheat_panel.do` | 39 | son, name, loc, lat |
| Code | `13_precleaning_alltables.do` | 103 | lat, district, son, phone, city, name, loc, lon |
| Code | `All_Figures.R` | 5 | lat, loc, location, district, coord |
| Code | `All_Tables.do` | 241 | loc, lat, district, son, name, city, location, phone, address, minute, village |
| Code | `Fig1.R` | 23 | minute, lat, loc, location, name, fname |
| Code | `Fig2.R` | 12 | lat, loc, location, name, minute, coord |
| Code | `Fig3.R` | 16 | minute, lat, loc, location, name |
| Code | `Fig4.R` | 20 | district, city, lat, loc, location, name |
| Code | `FigA2.qmd` | 23 | loc, location, coord, country, district, name, lon, lat |
| Code | `FigA3.R` | 8 | lat, loc, location, name, phone |
| Code | `FigA4.R` | 7 | lat, loc, location, name, fname |
| Code | `FigA5.R` | 30 | district, lat, lon, loc, location, name, coord |
| Code | `FigA6.R` | 15 | district, lat, loc, location, name, coord, lon |
| Code | `TabA13.R` | 46 | minute, phone, loc, location, lat, lname, name, block |

### Data Files

**/replication-package/replication package/Data/figures_data/country_shp/gadm36_AFG_0.dbf**

- Variable: `NAME_0`
  - Matched terms: name
  - Sample values: Afghanistan

**/replication-package/replication package/Data/figures_data/n_users_combined.csv**

- Variable: `phonehash`
  - Matched terms: phone
  - Sample values: 3534888, 3554833, 3530732

**/replication-package/replication package/Data/figures_data/sigacts_afghanistan.csv**

- Variable: `lat`
  - Matched terms: lat
  - Sample values: 35.83523N, 31.90011N, 34.83728N
- Variable: `lon`
  - Matched terms: lon
  - Sample values: 063.84149E, 065.88659E, 068.94531E

**/replication-package/replication package/Data/figures_data/survey_relig_aggregated_counts.csv**

- Variable: `category_name`
  - Matched terms: name
  - Sample values: Important, Moderately Important, Of Little Importance

**/replication-package/replication package/Data/figures_data/synthetic/cell_lookup_antenna_synthetic.csv**

- Variable: `district`
  - Matched terms: district
  - Sample values: Kandahar, Injil, Kabul
- Variable: `district_id`
  - Matched terms: district
  - Sample values: 2110, 1266, 111
- Variable: `latitude`
  - Matched terms: lat
  - Sample values: 33.5421, 32.5355, 33.1187
- Variable: `longitude`
  - Matched terms: lon
  - Sample values: 64.7377, 65.4352, 66.3325

**/replication-package/replication package/Data/raw_CDR/CDR_data_usage_raw_synthetic.csv**

- Variable: `phoneHash1`
  - Matched terms: phone
  - Sample values: R6Y2L7B2, X9Y2T6D1, D2J2F6E3

**/replication-package/replication package/Data/raw_CDR/CDR_phone_call_raw_synthetic.csv**

- Variable: `phoneHash1`
  - Matched terms: phone
  - Sample values: M6G9F3H2, Y1I6Q8C9, P3N9S3Z5

**/replication-package/replication package/Data/raw_CDR/CDR_shortcode_raw_synthetic.csv**

- Variable: `phoneHash1`
  - Matched terms: phone
  - Sample values: K6M6L8C2, B5X6Y7H4, U3U4D5G3

**/replication-package/replication package/Data/raw_CDR/CDR_sms_raw_synthetic.csv**

- Variable: `hourly_modal_antenna`
  - Matched terms: url
  - Sample values: 17261, 37713, 43761
- Variable: `phoneHash1`
  - Matched terms: phone
  - Sample values: L8C7Q3T7, B5E3W2X7, T2Q2B1A2

**/replication-package/replication package/Data/tables_data/cdr_and_climate_gm.csv**

- Variable: `district`
  - Matched terms: district
  - Sample values: 4, 5, 24

**/replication-package/replication package/Data/tables_data/cdr_and_climate_gm.dta**

- Variable: `district`
  - Matched terms: district
  - Sample values: 4.0, 5.0, 24.0

**/replication-package/replication package/Data/tables_data/dist_level.csv**

- Variable: `provname`
  - Matched terms: name
  - Sample values: Kabul, Kapisa, Parwan

**/replication-package/replication package/Data/tables_data/dist_level.dta**

- Variable: `provname`
  - Matched terms: name
  - Sample values: Kabul, Kapisa, Parwan

**/replication-package/replication package/Data/tables_data/grid_level.csv**

- Variable: `lat_str`
  - Matched terms: lat
  - Sample values: 34.3, 34.7, 34.8
- Variable: `n_balochi`
  - Matched terms: loc
  - Sample values: 0, 9, 8
- Variable: `share_balochi`
  - Matched terms: loc
  - Sample values: 0.0, 1.0, 0.75

**/replication-package/replication package/Data/tables_data/grid_level.dta**

- Variable: `lat_str`
  - Matched terms: lat
  - Sample values: 34.3, 34.7, 34.8
- Variable: `n_balochi`
  - Matched terms: loc
  - Sample values: 0.0, 9.0, 8.0
- Variable: `share_balochi`
  - Matched terms: loc
  - Sample values: 0.0, 1.0, 0.75

**/replication-package/replication package/Data/tables_data/synthetic/hash_grid_qtr_panel_synthetic.csv**

- Variable: `phonehash`
  - Matched terms: phone
  - Sample values: A1B2C3D4, X9Y8Z7W6, M3N4P5Q6

**/replication-package/replication package/Data/tables_data/synthetic/smallsurvey_finalsample_synthetic.csv**

- Variable: `distname`
  - Matched terms: name
  - Sample values: Kabul, Kandahar, Herat

**/replication-package/replication package/Data/tables_data/synthetic/smallsurvey_finalsample_synthetic.dta**

- Variable: `distname`
  - Matched terms: name
  - Sample values: Kabul, Kandahar, Herat

### Code Files

**/replication-package/replication package/Code/Analysis/All_Figures.R**

- Line 8: lat, loc, location
  ```
  #        automatically relative to this file's location via this.path.
  ```
- Line 16: district
  ```
  #   Fig4.R  -> religiosity_by_districts_pashto.png
  ```
- Line 17: coord
  ```
  #   FigA2.qmd -> FigA2_cell_towers_in_afg.pdf  (run independently — synthetic coords, not meaningf
  ```
- Line 25: district
  ```
  #   FigA6.R -> spei_by_district.pdf
  ```
- Line 45: loc
  ```
  source(file.path(script_dir, s), local = new.env())
  ```

**/replication-package/replication package/Code/Analysis/All_Tables.do**

- Line 70: loc
  ```
  // should modify the path below to point to the folder on your local machine.
  ```
- Line 76: lat
  ```
  * Latex Options
  ```
- Line 88: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 89: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 96: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 97: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 107: loc
  ```
  local ndist = r(N)
  ```
- Line 109: loc
  ```
  local nmon  = r(N)
  ```
- Line 111: district
  ```
  estadd scalar N_districts = `ndist'
  ```
- Line 148: district
  ```
  stats(N ymean N_districts N_months districtFE monthFE, ///
  ```
- Line 150: district
  ```
  labels("Observations" "Mean of Dependent Variable" "Number of Districts" "Number of Months" "Distric
  ```
- Line 177: loc
  ```
  local landcontrols12 "c.speipm12_g#c.other"
  ```
- Line 185: loc
  ```
  estadd local landtypectrls "Y"
  ```
- Line 190: loc
  ```
  local spring_landcontrols12 "c.spring_spei12#c.other"
  ```
- Line 193: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 194: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 198: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 199: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 200: loc
  ```
  estadd local landtypectrls "Y"
  ```
- Line 203: lat
  ```
  * latex table
  ```
- Line 216: son
  ```
  spring_spei12 "Growing Season SPEI" ///
  ```
- Line 217: son
  ```
  c.spring_spei12#c.rainfed   "Growing Season SPEI x Rainfed Cropland" ///
  ```
- Line 218: son
  ```
  c.spring_spei12#c.irrig_all "Growing Season SPEI x Irrigated Cropland" ///
  ```
- Line 219: son
  ```
  c.spring_spei12#c.rangeland "Growing Season SPEI x Rangeland") ///
  ```
- Line 230: son
  ```
  * Table 3 - Climate and Religious Adherence by Agricultural Season
  ```
- Line 239: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 240: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 243: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 244: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 245: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 248: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 249: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 250: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 254: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 255: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 256: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 259: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 260: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 261: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 262: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 265: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 266: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 267: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 268: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 272: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 273: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 274: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 275: loc
  ```
  estadd local dropRAM "Y"
  ```
- Line 278: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 279: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 280: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 281: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 282: loc
  ```
  estadd local dropRAM "Y"
  ```
- Line 285: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 286: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 287: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 288: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 289: loc
  ```
  estadd local dropRAM "Y"
  ```
- Line 296: son
  ```
  "Control for own season SPEI" "Control for Prev. Maghrib Dip" "Dropping Ramadan days")) ///
  ```
- Line 299: son
  ```
  varlabels(spring_spei12 "Growing Season SPEI") ///
  ```
- Line 300: son
  ```
  mtitles("\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Sea
  ```
- Line 301: son
  ```
  "\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Season}" //
  ```
- Line 302: son
  ```
  "\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Season}") /
  ```
- Line 306: son
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "Each column is a regression of the Maghrib dip du
  ```
- Line 319: son
  ```
  use "${datadir}/calls_shortcode_comparison_gm", clear
  ```
- Line 326: son
  ```
  use "${datadir}/calls_shortcode_comparison_dm", clear
  ```
- Line 331: loc
  ```
  estadd local distFE "Y"
  ```
- Line 332: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 336: district
  ```
  stats(N mean_value gridFE monthFE distFE, fmt(%9.0f %9.3f %9.0f %9.0f %9.0f) labels("Observations" "
  ```
- Line 339: district
  ```
  mgroups("Grid Cell" "District", pattern(0 1 1) ///
  ```
- Line 344: district
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "This table examines if the measured Maghrib dip d
  ```
- Line 363: loc
  ```
  local control_just_hazara hazara_ethn
  ```
- Line 364: loc
  ```
  local controls age hhmbr_male hhmbr_female hhmbr_kids hazara_ethn
  ```
- Line 366: name
  ```
  eststo A1: reghdfe vpm_diff_avg_denom mn_ix_imp_vimp_16, absorb(distname) vce(robust)
  ```
- Line 368: loc
  ```
  estadd local distFE "Y"
  ```
- Line 370: name
  ```
  eststo B1: reghdfe vpm_diff_avg_denom q12_16_e_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 372: loc
  ```
  estadd local distFE "Y"
  ```
- Line 374: name
  ```
  eststo C1: reghdfe vpm_diff_avg_denom q12_16_a_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 376: loc
  ```
  estadd local distFE "Y"
  ```
- Line 378: name
  ```
  eststo D1: reghdfe vpm_diff_avg_denom q12_16_d_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 380: loc
  ```
  estadd local distFE "Y"
  ```
- Line 382: name
  ```
  eststo E1: reghdfe vpm_diff_avg_denom q12_16_f_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 384: loc
  ```
  estadd local distFE "Y"
  ```
- Line 386: name
  ```
  eststo F1: reghdfe vpm_diff_avg_denom q12_16_b_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 388: loc
  ```
  estadd local distFE "Y"
  ```
- Line 390: name
  ```
  eststo G1: reghdfe vpm_diff_avg_denom q12_16_c_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 392: loc
  ```
  estadd local distFE "Y"
  ```
- Line 394: name
  ```
  eststo A2: reghdfe vpm_diff_avg_denom mn_ix_imp_vimp_16 `controls', absorb(distname) vce(robust)
  ```
- Line 396: loc
  ```
  estadd local distFE "Y"
  ```
- Line 397: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 399: name
  ```
  eststo B2: reghdfe vpm_diff_avg_denom q12_16_e_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 401: loc
  ```
  estadd local distFE "Y"
  ```
- Line 402: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 404: name
  ```
  eststo C2: reghdfe vpm_diff_avg_denom q12_16_a_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 406: loc
  ```
  estadd local distFE "Y"
  ```
- Line 407: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 409: name
  ```
  eststo D2: reghdfe vpm_diff_avg_denom q12_16_d_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 411: loc
  ```
  estadd local distFE "Y"
  ```
- Line 412: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 414: name
  ```
  eststo E2: reghdfe vpm_diff_avg_denom q12_16_f_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 416: loc
  ```
  estadd local distFE "Y"
  ```
- Line 417: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 419: name
  ```
  eststo F2: reghdfe vpm_diff_avg_denom q12_16_b_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 420: loc
  ```
  estadd local distFE "Y"
  ```
- Line 421: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 423: name
  ```
  eststo G2: reghdfe vpm_diff_avg_denom q12_16_c_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 425: loc
  ```
  estadd local distFE "Y"
  ```
- Line 426: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 429: loc, name
  ```
  local relig_table_name TabA2
  ```
- Line 477: district
  ```
  labels("Observations" "Mean of Dependent Variable" "District Fixed Effects" "Demographic Controls"))
  ```
- Line 501: name
  ```
  eststo M9: reghdfe vpm_diff_avg_denom age readwrite rural agri_land pashtun_ethn hazara_ethn, absorb
  ```
- Line 503: loc
  ```
  estadd local distFE "Y"
  ```
- Line 504: loc
  ```
  estadd local hazara "Y"
  ```
- Line 513: city, district
  ```
  scalars("N Observations" "ymean Mean of Dependent Variable" "distFE District Fixed Effects" "hazara 
  ```
- Line 530: city
  ```
  * Appendix Table A4: Ethnicity and the Maghrib Dip
  ```
- Line 537: loc
  ```
  estadd local provFE "Y"
  ```
- Line 538: loc
  ```
  estadd local hazaraFE "Y"
  ```
- Line 541: loc
  ```
  estadd local provFE "Y"
  ```
- Line 542: loc
  ```
  estadd local hazaraFE "Y"
  ```
- Line 548: loc
  ```
  estadd local provFE "Y"
  ```
- Line 549: loc
  ```
  estadd local hazaraFE "Y"
  ```
- Line 553: loc
  ```
  estadd local provFE "Y"
  ```
- Line 554: loc
  ```
  estadd local hazaraFE "Y"
  ```
- Line 561: district
  ```
  mgroups("District" "Grid Cell" "District" "Grid Cell", pattern(1 1 1 1) ///
  ```
- Line 582: loc
  ```
  local landtype_cellmonth rainfed irrig_all rangeland other builtup
  ```
- Line 583: loc
  ```
  local cellyr_vars logdifevi spring_spei12 spring_vpm harvest_vpm postharvest_vpm
  ```
- Line 586: district
  ```
  * -----------------     	  District month variables        ----------------- *
  ```
- Line 628: lat
  ```
  *** Latex Table
  ```
- Line 640: district
  ```
  refcat(maghrib_dip "\textbf{A. Variables at District-Month level}", nolabel) ///
  ```
- Line 654: son
  ```
  spring_spei12 "\hspace{2mm} Growing Season SPEI" ///
  ```
- Line 655: son
  ```
  spring_vpm "\hspace{2mm} Maghrib Dip in Growing Season" ///
  ```
- Line 656: son
  ```
  harvest_vpm "\hspace{2mm} Maghrib Dip in Harvest Season" ///
  ```
- Line 657: son
  ```
  postharvest_vpm "\hspace{2mm} Maghrib Dip in Post-harvest Season") ///
  ```
- Line 682: loc
  ```
  local main_individual mn_ix_imp_vimp_16 q12_16_e_imp_vimp q12_16_a_imp_vimp q12_16_d_imp_vimp ///
  ```
- Line 685: loc
  ```
  local addn_cellmonth vpm_diff_avg_denom_shortcode vpm_diff_avg_denom25 vpm_diff_avg_denom35 vpm_diff
  ```
- Line 688: district
  ```
  * District-Year Level - Poppy and ethn
  ```
- Line 689: loc
  ```
  local distyrlevel_vars opium_cult_ihs opium_interp_ihs
  ```
- Line 692: loc
  ```
  local conflict_vars cell_uppsala_0312 cell_uppsala_0320
  ```
- Line 699: loc
  ```
  local other_individual age rural readwrite agri_land pashtun_ethn
  ```
- Line 703: district
  ```
  * -----------------	            District Month       ------------------ *
  ```
- Line 721: city, district
  ```
  * -----------------     	  District Level - Ethnicity       ----------------- *
  ```
- Line 729: district
  ```
  * -----------------     	  District year Level - Poppy        ----------------- *
  ```
- Line 739: loc
  ```
  local distyrlevel_vars opium_cult_ihs opium_interp_ihs
  ```
- Line 740: district
  ```
  collapse (mean) `distyrlevel_vars', by(district year)
  ```
- Line 745: lat
  ```
  * -----------------     	  Latex Table        ----------------- *
  ```
- Line 748: lat
  ```
  *** Latex Table
  ```
- Line 783: loc, location
  ```
  maghrib_dip_nodiffhome3mo "\hspace{2mm} Maghrib Dip (Constant Home Location)" ///
  ```
- Line 793: district
  ```
  refcat(maghrib_dip_shortcode "\textbf{B. Variables at District-Month Level}", nolabel) ///
  ```
- Line 815: district
  ```
  taliban_fg "\hspace{2mm} District Experienced Any Taliban Control between 2015-2020 (PiX)") ///
  ```
- Line 816: district
  ```
  refcat(ethn_pashto_ind "\textbf{D. Variables at District Level}", nolabel) ///
  ```
- Line 822: phone
  ```
  * individual-quater level mobile phone data that cannot be publicly released
  ```
- Line 834: lat
  ```
  opium_interp_ihs "\hspace{2mm} Interpolated Poppy - IHS") ///
  ```
- Line 835: district
  ```
  refcat(opium_cult_ihs "\textbf{F. Variables at District-Year Level}", nolabel) ///
  ```
- Line 842: address
  ```
  * Appendix Table A7: Addressing Accounts of how Violence affects
  ```
- Line 848: loc
  ```
  local otherSIGACTSEvents num_other_insurg num_state_viol num_other_state
  ```
- Line 851: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 852: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 853: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 856: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 857: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 858: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 862: district
  ```
  stats(N districtFE monthFE controlsSIGACTS, fmt(%9.0f) ///
  ```
- Line 863: district
  ```
  labels("Observations" "District Fixed Effects" "Month Fixed Effects" "Controls for Other Insurgent A
  ```
- Line 890: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 891: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 892: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 893: loc
  ```
  estadd local space " "
  ```
- Line 896: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 897: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 898: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 899: loc
  ```
  estadd local space " "
  ```
- Line 902: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 903: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 904: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 905: loc
  ```
  estadd local space " "
  ```
- Line 908: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 909: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 910: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 911: loc
  ```
  estadd local space " "
  ```
- Line 914: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 915: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 916: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 917: loc
  ```
  estadd local space " "
  ```
- Line 921: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 922: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 923: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 924: loc
  ```
  estadd local space " "
  ```
- Line 927: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 928: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 929: loc
  ```
  estadd local callvolcntrl "Y"
  ```
- Line 930: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 931: loc
  ```
  estadd local space " "
  ```
- Line 935: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 936: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 937: loc
  ```
  estadd local callvolcntrl "Y"
  ```
- Line 938: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 943: district
  ```
  stats(N districtFE monthFE controlsSIGACTS space, fmt(%9.0f) labels("Observations" "District Fixed E
  ```
- Line 972: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 973: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 974: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 975: loc
  ```
  estadd local space " "
  ```
- Line 979: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 980: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 981: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 982: loc
  ```
  estadd local space " "
  ```
- Line 986: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 987: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 988: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 989: loc
  ```
  estadd local space " "
  ```
- Line 992: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 993: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 994: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 995: loc
  ```
  estadd local space " "
  ```
- Line 999: district
  ```
  stats(N districtFE monthFE controlsSIGACTS space, fmt(%9.0f) ///
  ```
- Line 1000: district
  ```
  labels("Observations" "District Fixed Effects" "Month Fixed Effects" "Controls for Other Insurgent" 
  ```
- Line 1006: district
  ```
  mgroups("\shortstack{Non-Ramadan\\Days}" "\shortstack{Non-Hazara\\Districts}" ///
  ```
- Line 1031: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1035: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1039: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1043: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1047: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1049: district
  ```
  eststo A8: reghdfe vpm_diff_avg_denom speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(
  ```
- Line 1051: district, loc
  ```
  estadd local clusteredOn "District"
  ```
- Line 1055: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1059: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1062: lat
  ```
  * latex table
  ```
- Line 1077: district, minute
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), the Maghrib dip is constructed by 
  ```
- Line 1125: district
  ```
  mgroups("\shortstack{Non-Hazara\\Districts}" "\shortstack{Non-Ramadan\\Days}" ///
  ```
- Line 1128: district
  ```
  "\shortstack{Non-Urban\\Areas}" "\shortstack{Non-Taliban\\Districts}", ///
  ```
- Line 1132: district, phone, village
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), we drop grids in which at least 5\
  ```
- Line 1140: address
  ```
  * Table A12: Climate and Religious Adherence: Addressing Alternate Accounts
  ```
- Line 1186: phone
  ```
  * level mobile phone data that cannot be publicly released due to privacy constraints.
  ```
- Line 1201: district
  ```
  eststo A1: reghdfe opium_cult_ihs speipm12_g if main_sample == 1 & cell_cdr == 1, absorb(trendval ce
  ```
- Line 1204: district
  ```
  eststo A2: reghdfe opium_interp_ihs speipm12_g if main_sample == 1 & cell_cdr == 1, absorb(trendval 
  ```
- Line 1207: district
  ```
  eststo A3: reghdfe vpm_diff_avg_denom speipm12_g opium_cult_wmiss_ihs opium_cult_miss_ind if cell_cd
  ```
- Line 1209: loc
  ```
  estadd local poppyctrl "Y"
  ```
- Line 1211: district
  ```
  eststo A4: reghdfe vpm_diff_avg_denom speipm12_g opium_interp_wmiss_ihs opium_interp_miss_ind if cel
  ```
- Line 1213: loc
  ```
  estadd local poppyintctrl "Y"
  ```
- Line 1215: lat
  ```
  * latex table
  ```
- Line 1223: lat
  ```
  mgroups("IHS(Poppy)" "IHS(Interpolated Poppy)" "Maghrib Dip" "Maghrib Dip", pattern(1 1 1 0) ///
  ```
- Line 1226: district, lat
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), the dependent variable is the IHS 
  ```

**/replication-package/replication package/Code/Analysis/Fig1.R**

- Line 5: minute
  ```
  #   Panel A: Full-day call volume (total calls per minute, daily average)
  ```
- Line 6: lat, minute
  ```
  #            across all minutes relative to Maghrib start.
  ```
- Line 7: minute
  ```
  #   Panel B: Zoomed view (±140 minutes around Maghrib) with 95% CI bands
  ```
- Line 10: lat
  ```
  # Input:  Data/figures_data/cdr_relativemins_data.csv
  ```
- Line 18: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 29: name
  ```
  rootdir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 33: lat
  ```
  'calls_relativemins_data' = file.path(rootdir, 'Data/figures_data/cdr_relativemins_data.csv'),
  ```
- Line 40: minute
  ```
  # Function to Convert minutes to HHMM
  ```
- Line 51: lat
  ```
  df_calls_per_relmin = fread(paths[['calls_relativemins_data']])
  ```
- Line 98: minute
  ```
  ylabs = "Total Calls per Minute (Daily Average)"
  ```
- Line 99: fname, name
  ```
  plot_output_fname = 'day_callvol.pdf'
  ```
- Line 100: name
  ```
  y_name = "call_vol_avg"
  ```
- Line 102: name
  ```
  names(df_calls_per_relmin)
  ```
- Line 105: name
  ```
  geom_line(aes(x = rel_min, y = !!sym(y_name)), linewidth = 0.5) +
  ```
- Line 107: lat, minute
  ```
  labs(x = "Minute Relative to Start of Maghrib",
  ```
- Line 117: name
  ```
  name = "Time of day (Ilustrative day with Maghrib at 6:00 PM)"
  ```
- Line 142: fname, name
  ```
  fpath = file.path(paths['output_dir'], plot_output_fname)
  ```
- Line 156: minute
  ```
  ylabs = "Total Calls per Minute (Daily Average)"
  ```
- Line 157: fname, name
  ```
  plot_output_fname = 'day_callvol_zoomed.pdf'
  ```
- Line 158: name
  ```
  y_name = "call_vol_avg"
  ```
- Line 166: name
  ```
  geom_line(aes(x = rel_min, y = !!sym(y_name)), linewidth = 0.5) +
  ```
- Line 170: lat, minute
  ```
  labs(x = "Minute Relative to Start of Maghrib",
  ```
- Line 187: fname, name
  ```
  fpath = file.path(paths['output_dir'], plot_output_fname)
  ```

**/replication-package/replication package/Code/Analysis/Fig2.R**

- Line 10: lat
  ```
  # Input:  Data/figures_data/cdr_relativemins_day_1516_withsun.csv
  ```
- Line 18: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 30: loc
  ```
  # Axis labels below use %b and %a, which are locale-dependent. Force the C
  ```
- Line 31: loc
  ```
  # locale so month and weekday abbreviations render in English regardless of
  ```
- Line 33: loc
  ```
  Sys.setlocale("LC_TIME", "C")
  ```
- Line 35: name
  ```
  rootdir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 39: lat
  ```
  'data' = file.path(rootdir, 'Data/figures_data/cdr_relativemins_day_1516_withsun.csv'),
  ```
- Line 44: minute
  ```
  # Function to Convert minutes to HHMM
  ```
- Line 109: minute
  ```
  fill = "Total Calls per Minute") +
  ```
- Line 113: coord
  ```
  coord_cartesian(ylim = c(60, 1400), xlim = c(as.Date('2015-01-01'), as.Date('2016-12-31')), clip = "
  ```
- Line 237: minute
  ```
  fill = "Total Calls per Minute") +
  ```
- Line 241: coord
  ```
  coord_cartesian(ylim = c(60, 1400), xlim = c(as.Date('2015-10-28') - 0.5, as.Date('2015-11-20') + 0.
  ```

**/replication-package/replication package/Code/Analysis/Fig3.R**

- Line 5: minute
  ```
  #   Panel A: Shortcode calls per minute
  ```
- Line 6: minute
  ```
  #   Panel B: SMS per minute
  ```
- Line 7: minute
  ```
  #   Panel C: Data packets per minute
  ```
- Line 9: lat
  ```
  # Input:  Data/figures_data/cdr_shortcode_relativemins_data.csv
  ```
- Line 10: lat
  ```
  #         Data/figures_data/cdr_sms_relativemins_data.csv
  ```
- Line 11: lat
  ```
  #         Data/figures_data/cdr_data_relativemins_data.csv
  ```
- Line 20: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 31: name
  ```
  rootdir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 34: lat
  ```
  shortcode = file.path(rootdir, "Data/figures_data/cdr_shortcode_relativemins_data.csv"),
  ```
- Line 35: lat
  ```
  sms       = file.path(rootdir, "Data/figures_data/cdr_sms_relativemins_data.csv"),
  ```
- Line 36: lat
  ```
  data      = file.path(rootdir, "Data/figures_data/cdr_data_relativemins_data.csv"),
  ```
- Line 67: minute
  ```
  ylabs   = "Total Shortcode Calls per Minute (Daily Average)",
  ```
- Line 73: minute
  ```
  ylabs   = "Total SMS per Minute (Daily Average)",
  ```
- Line 79: minute
  ```
  ylabs   = "Total Data Packets per Minute (Daily Average)",
  ```
- Line 85: name
  ```
  for (cdr_type in names(cfg)) {
  ```
- Line 100: lat, minute
  ```
  x = "Minute Relative to Start of Maghrib",
  ```

**/replication-package/replication package/Code/Analysis/Fig4.R**

- Line 4: district
  ```
  # Produces Figure 4: District-Level Map of Maghrib Dip (Z-Score), with
  ```
- Line 5: district
  ```
  #   Pashto-majority district boundaries overlaid.
  ```
- Line 7: district
  ```
  # Input:  Data/raw_data/geo_data/district_shp/district398.shp
  ```
- Line 8: city
  ```
  #         Data/figures_data/cdr_ethnicity_distlevel.csv
  ```
- Line 9: district
  ```
  # Output: Output/Figures/religiosity_by_districts_pashto.png
  ```
- Line 17: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 27: name
  ```
  maindir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 32: district
  ```
  # District shapefile
  ```
- Line 33: district
  ```
  'shp_districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
  ```
- Line 34: city, district
  ```
  # District Religiosity and Ethnicity
  ```
- Line 35: city
  ```
  'cdr_ethn_dist' = file.path(maindir, 'Data/figures_data/cdr_ethnicity_distlevel.csv'),
  ```
- Line 48: district
  ```
  #----------------------------   District Geometry    -------------------------#
  ```
- Line 52: district
  ```
  # Get Afghanistan districts
  ```
- Line 53: district
  ```
  geodf_districts = read_sf(paths[['shp_districts']]) |>
  ```
- Line 56: name
  ```
  rename(provinceName = PROV_34_NA,
  ```
- Line 57: district, name
  ```
  districtName = DIST_34_NA,
  ```
- Line 72: district
  ```
  dist_ethn <- geodf_districts |>
  ```
- Line 92: district
  ```
  geom_sf(data = geodf_districts, aes(fill = vpm_diff_30m_zscore), colour = NA) +
  ```
- Line 107: name
  ```
  scale_colour_manual(values = "yellow", labels = "Pashto", name = " ") +
  ```
- Line 151: district, name
  ```
  ggsave(filename = paste0(paths$outputdir, "/religiosity_by_districts_pashto.png"), width = 8.5, heig
  ```

**/replication-package/replication package/Code/Analysis/FigA2.qmd**

- Line 5: loc, location
  ```
  # Produces Appendix Figure A2: Cell Tower Locations in Afghanistan.
  ```
- Line 6: coord
  ```
  #   NOTE: Uses synthetic tower coordinates — output is not meaningfu
  ```
- Line 7: loc, location
  ```
  #   The confidential antenna geolocation file cannot be shared.
  ```
- Line 9: country
  ```
  # Input:  Data/figures_data/country_shp/gadm36_AFG_0.shp
  ```
- Line 10: district
  ```
  #         Data/figures_data/district_shp/district398.shp
  ```
- Line 17: loc
  ```
  # USAGE: Update maindir in the setup chunk to the root of your local copy
  ```
- Line 22: loc, location
  ```
  # Tower Locations {.unnumbered}
  ```
- Line 37: country
  ```
  'shp_cntry' = file.path(maindir, 'Data/figures_data/country_shp/gadm36_AFG_0.shp'),
  ```
- Line 38: district
  ```
  'shp_districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
  ```
- Line 49: country
  ```
  #-----------------------------  Country Boundary -----------------------------#
  ```
- Line 51: country
  ```
  # Get Afghanistan country boundary
  ```
- Line 55: district
  ```
  #----------------------------   District Geometry    -------------------------#
  ```
- Line 57: district
  ```
  # Get Afghanistan districts
  ```
- Line 58: district
  ```
  geodf_districts = read_sf(paths[['shp_districts']]) |>
  ```
- Line 61: name
  ```
  rename(provinceName = PROV_34_NA,
  ```
- Line 62: district, name
  ```
  districtName = DIST_34_NA,
  ```
- Line 73: lon, name
  ```
  rename(lng_tower = longitude,
  ```
- Line 74: lat
  ```
  lat_tower = latitude) |>
  ```
- Line 75: coord, lat
  ```
  st_as_sf(coords = c('lng_tower','lat_tower'), crs = crs_unproj, remove = F) |>
  ```
- Line 79: district
  ```
  # size is the correct aesthetic for the tower points, but for the district and
  ```
- Line 80: country
  ```
  # country polygons line width must be set with linewidth, not size: ggplot2
  ```
- Line 84: district
  ```
  geom_sf(data = geodf_districts, fill = NA, colour = 'gray80', linewidth = 0.2) +
  ```
- Line 88: name
  ```
  ggsave(filename = file.path(maindir, 'Output/Figures/FigA2_cell_towers_in_afg.pdf'),
  ```

**/replication-package/replication package/Code/Analysis/FigA3.R**

- Line 18: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 35: loc
  ```
  # Axis labels below use %b, which is locale-dependent. Force the C locale so
  ```
- Line 38: loc
  ```
  Sys.setlocale("LC_TIME", "C")
  ```
- Line 40: name
  ```
  maindir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 59: name
  ```
  users_by_month = rename(users_by_month, Date = date)
  ```
- Line 65: phone
  ```
  users_bymonth_plot = ggplot(data=users_by_month %>% filter(data_type != 'Shortcode'), aes(x=Date, y=
  ```
- Line 73: name
  ```
  scale_colour_manual(name = "Interactions",
  ```
- Line 76: name
  ```
  scale_shape_manual(name = "Interactions",
  ```

**/replication-package/replication package/Code/Analysis/FigA4.R**

- Line 15: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 27: name
  ```
  maindir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 51: name
  ```
  geom_col(aes(y = value, x = reorder(category_name, category_order)), fill = '#800020') +
  ```
- Line 52: name
  ```
  geom_text(aes(y = value, x = reorder(category_name, category_order), label = share, vjust = -1)) +
  ```
- Line 67: fname, name
  ```
  fname = unique(data$question) |> str_remove_all(" ") |> str_to_lower()
  ```
- Line 71: name
  ```
  filename = file.path(paths[['fig_output']],
  ```
- Line 72: fname, name
  ```
  paste0('survey_barplots_', fname, '.png')),
  ```

**/replication-package/replication package/Code/Analysis/FigA5.R**

- Line 12: district
  ```
  #         Data/raw_data/geo_data/district_shp/district398.shp
  ```
- Line 17: lat, lon
  ```
  #         Output/Figures/legend.png  (standalone legend for LaTeX assembly)
  ```
- Line 27: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 48: name
  ```
  maindir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 54: district
  ```
  # afg district shp file
  ```
- Line 55: district
  ```
  'districts' = file.path(maindir, 'Data/figures_data/district_shp/district398.shp'),
  ```
- Line 68: district
  ```
  districts = st_read(paths[['districts']]) %>%
  ```
- Line 76: lat
  ```
  sigacts = sigacts[, `:=` (lat = as.numeric(str_sub(lat, end = -2)),
  ```
- Line 77: lon
  ```
  lon = as.numeric(str_sub(lon, end = -2)),
  ```
- Line 82: loc
  ```
  , loc_within_25km := fifelse(geo_prec <= 2L, 1L, 0) ][
  ```
- Line 84: lat, loc, lon
  ```
  , .(event_id, event_type, event_category, lat, lon, date, year, data_set, geo_prec, loc_within_25km)
  ```
- Line 86: name
  ```
  setnames(sigacts, 'event_category', 'sub_event_type')
  ```
- Line 89: coord, lat, lon
  ```
  sigacts_sf <- st_as_sf(sigacts, coords = c("lon", "lat"),  crs = 4326)
  ```
- Line 92: district
  ```
  eventsWithinAfg <- function(conflicts, districts){
  ```
- Line 94: district
  ```
  y = districts,
  ```
- Line 99: district
  ```
  sigacts_within = eventsWithinAfg(sigacts_sf, districts)
  ```
- Line 101: loc
  ```
  filter(loc_within_25km == 1) %>%
  ```
- Line 132: name
  ```
  file_names <- c(
  ```
- Line 139: district
  ```
  grid <- st_make_grid(districts, cellsize = 0.05, square = TRUE)
  ```
- Line 141: district
  ```
  st_filter(districts, .predicate = st_intersects)
  ```
- Line 144: lat
  ```
  # ---------- STEP 1: calculate global max ----------
  ```
- Line 159: lon
  ```
  for (i in seq_along(violence_types)) {
  ```
- Line 162: name
  ```
  file_name <- paste0(paths[['figOutput']], "/", file_names[i])
  ```
- Line 170: lat
  ```
  # calculate heatmap counts
  ```
- Line 188: district
  ```
  geom_sf(data = districts, fill = NA, color = "black", linewidth = 0.2) +
  ```
- Line 194: name
  ```
  name = NULL,
  ```
- Line 223: name
  ```
  filename = file_name,
  ```
- Line 229: name
  ```
  message("Saved heatmap for ", vt, " as ", file_names[i])
  ```
- Line 232: lon
  ```
  # ---------- STEP 3: extract and save standalone legend ----------
  ```
- Line 235: name
  ```
  filename = file.path(paths[['figOutput']], "legend.png"),
  ```

**/replication-package/replication package/Code/Analysis/FigA6.R**

- Line 13: district
  ```
  # Output: Output/Figures/spei_by_district.pdf
  ```
- Line 21: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 31: name
  ```
  maindir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 62: coord
  ```
  st_coordinates() |>
  ```
- Line 65: district
  ```
  # Add district/province info by grid
  ```
- Line 66: coord
  ```
  st_as_sf(coords = c('X','Y'), crs = crs_unproj, remove = F) |>
  ```
- Line 73: lat
  ```
  grid_cent_lat = geodf_grid_centroids[,"Y"]) |>
  ```
- Line 74: lat
  ```
  mutate(gridid = paste0(round(grid_cent_lng, 1), "X", round(grid_cent_lat, 1)))
  ```
- Line 87: name
  ```
  .names = "{.col}_2018")) |>
  ```
- Line 103: lon
  ```
  geodf_grid_w_spei_long = geodf_grid_w_spei |>
  ```
- Line 104: lon
  ```
  pivot_longer(cols = c(speipm12_g, speipm12_g_2018),
  ```
- Line 105: name
  ```
  names_to = "spei_variable",
  ```
- Line 114: lon
  ```
  ggplot(data = geodf_grid_w_spei_long |>
  ```
- Line 120: name
  ```
  scale_fill_gradient(name = "SPEI", low = "red", high = "yellow") +
  ```
- Line 125: district, name
  ```
  ggsave(filename = paste0(paths$outputdir, "/spei_by_district.pdf"), width = 8.5, height = 5.3, plot 
  ```

**/replication-package/replication package/Code/Analysis/TabA13.R**

- Line 18: minute
  ```
  # Runtime on synthetic data: ~1 minute
  ```
- Line 84: phone
  ```
  'phonehash'                                    = 'Individual FE',
  ```
- Line 103: phone
  ```
  phonehash + gridID + yearQtrID,
  ```
- Line 119: phone
  ```
  phonehash + gridID + yearQtrID,
  ```
- Line 130: loc, location
  ```
  #            pre-2015 panel to absorb climate and location variation.
  ```
- Line 149: phone
  ```
  by = phonehash
  ```
- Line 160: phone
  ```
  df_panel_post2015 <- residuals_indiv[df_panel_post2015, on = "phonehash"]
  ```
- Line 161: phone
  ```
  df_panel          <- residuals_indiv[df_panel,          on = "phonehash"]
  ```
- Line 165: phone
  ```
  phonehash + gridID + yearQtrID,
  ```
- Line 176: phone
  ```
  phonehash + gridID + yearQtrID,
  ```
- Line 211: lat, loc
  ```
  # Pre-allocate coefficient matrices (rows accumulate across iterations)
  ```
- Line 213: lname, name
  ```
  colnames(boot_coeffs_reg1) <- c("speipm12_g", "I(speipm12_g*abv_med_baseline_residual)")
  ```
- Line 216: lname, name
  ```
  colnames(boot_coeffs_reg2) <- c("speipm12_g",
  ```
- Line 231: phone
  ```
  # Create a new individual ID that is unique within each boot_id x phonehash pair
  ```
- Line 233: phone
  ```
  boot_df[, phonehash_boot_id := .GRP, by = .(boot_id, phonehash)]
  ```
- Line 251: phone
  ```
  by = phonehash_boot_id
  ```
- Line 255: phone
  ```
  boot_df_post2015 <- residuals_indiv_boot[boot_df_post2015, on = 'phonehash_boot_id']
  ```
- Line 270: phone
  ```
  phonehash_boot_id + gridID + yearQtrID,
  ```
- Line 284: phone
  ```
  phonehash_boot_id + gridID + yearQtrID,
  ```
- Line 294: lat
  ```
  # Checkpoint: save accumulated coefficients to disk every chunk_size iterations
  ```
- Line 322: name
  ```
  # Helper: normalise coefficient names before matching
  ```
- Line 331: name
  ```
  align_by_sanitized <- function(source_vec, target_names) {
  ```
- Line 332: name
  ```
  if (is.null(names(source_vec))) stop("bootstrap output unnamed")
  ```
- Line 333: name
  ```
  idx <- match(sanitize(target_names), sanitize(names(source_vec)))
  ```
- Line 335: name
  ```
  paste(target_names[is.na(idx)], collapse = ", ")))
  ```
- Line 337: name
  ```
  names(out) <- target_names
  ```
- Line 344: name
  ```
  # Restore names if lost during matrix read-back
  ```
- Line 345: lname, name
  ```
  if (is.null(names(coef_boot_reg1)) && !is.null(colnames(boot_coeffs_reg1)))
  ```
- Line 346: lname, name
  ```
  names(coef_boot_reg1) <- colnames(boot_coeffs_reg1)
  ```
- Line 347: lname, name
  ```
  if (is.null(names(coef_boot_reg2)) && !is.null(colnames(boot_coeffs_reg2)))
  ```
- Line 348: lname, name
  ```
  names(coef_boot_reg2) <- colnames(boot_coeffs_reg2)
  ```
- Line 349: lname, name
  ```
  if (is.null(names(se_boot_reg1)) && !is.null(colnames(boot_coeffs_reg1)))
  ```
- Line 350: lname, name
  ```
  names(se_boot_reg1) <- colnames(boot_coeffs_reg1)
  ```
- Line 351: lname, name
  ```
  if (is.null(names(se_boot_reg2)) && !is.null(colnames(boot_coeffs_reg2)))
  ```
- Line 352: lname, name
  ```
  names(se_boot_reg2) <- colnames(boot_coeffs_reg2)
  ```
- Line 354: name
  ```
  se1_boot_aligned <- align_by_sanitized(se_boot_reg1, names(coef1_target))
  ```
- Line 355: name
  ```
  se2_boot_aligned <- align_by_sanitized(se_boot_reg2, names(coef2_target))
  ```
- Line 359: name
  ```
  dimnames(V_boot1) <- list(names(se1_boot_aligned), names(se1_boot_aligned))
  ```
- Line 361: name
  ```
  dimnames(V_boot2) <- list(names(se2_boot_aligned), names(se2_boot_aligned))
  ```
- Line 368: lat
  ```
  # PART 4: Build LaTeX table in paper format
  ```
- Line 370: lat
  ```
  # etable() produces a raw LaTeX character vector; post-processing converts
  ```
- Line 417: block, loc
  ```
  # 4. Reorder bottom block: Observations before FE rows; replace \midrule\midrule with \bottomrule
  ```
- Line 432: lat
  ```
  "between 2016 to 2020. SPEI is calculated for each quarter in each individual's home grid, ",
  ```
- Line 436: lat, minute
  ```
  "calculated by aggregating call volumes in the 30-minute windows before and after Maghrib, ",
  ```
- Line 438: lat
  ```
  "a two-stage approach to calculate baseline religiosity as the residual after accounting for ",
  ```
- Line 460: lat
  ```
  # Lookbehind ensures only cell-context negatives are replaced, not LaTeX commands
  ```

**/replication-package/replication package/Code/Cleaning/01_antenna_tower_griddist_mapping.R**

- Line 5: degree, district
  ```
  # Maps each raw antenna to its 0.1-degree grid cell and district.
  ```
- Line 6: loc
  ```
  # Clusters co-located antennas into towers (100m radius).
  ```
- Line 7: district
  ```
  # Produces the tower-grid-district crosswalk used by all downstream
  ```
- Line 32: country
  ```
  # Country shapefile
  ```
- Line 33: district
  ```
  'shp_cntry' = file.path(maindir, 'Data/Districts/gadm36_AFG_0.shp'),
  ```
- Line 34: district
  ```
  # District shapefile
  ```
- Line 35: district
  ```
  'shp_districts' = file.path(maindir, 'Data/Districts/district398.shp'),
  ```
- Line 41: district
  ```
  # Note: Instead of this pooled file, we can use the individual files (cell_lookup+district_2018-04-0
  ```
- Line 57: country
  ```
  #-----------------------------  Country Boundary -----------------------------#
  ```
- Line 59: country
  ```
  # Get Afghanistan country boundary
  ```
- Line 63: district
  ```
  #----------------------------   District Geometry    -------------------------#
  ```
- Line 65: district
  ```
  # Get Afghanistan districts
  ```
- Line 66: district
  ```
  geodf_districts = read_sf(paths[['shp_districts']]) |>
  ```
- Line 69: name
  ```
  rename(provinceName = PROV_34_NA,
  ```
- Line 70: district, name
  ```
  districtName = DIST_34_NA,
  ```
- Line 88: coord
  ```
  st_coordinates() |>
  ```
- Line 91: district
  ```
  # Add district/province info by grid
  ```
- Line 92: coord
  ```
  st_as_sf(coords = c('X','Y'), crs = crs_unproj, remove = F) |>
  ```
- Line 94: district
  ```
  st_join(geodf_districts, join = st_within) |>
  ```
- Line 95: name
  ```
  rename(grid_provinceName = provinceName,
  ```
- Line 96: district, name
  ```
  grid_districtName = districtName,
  ```
- Line 104: lat
  ```
  grid_cent_lat = geodf_grid_centroids[,"Y"]) |>
  ```
- Line 106: district, name
  ```
  dplyr::select(c(grid_provinceName, grid_districtName, grid_distid, grid_provid))) |>
  ```
- Line 108: lat
  ```
  mutate(gridid = paste0(round(grid_cent_lng, 1), "X", round(grid_cent_lat, 1)))
  ```
- Line 110: district
  ```
  # Note: There are two grids for which we don't have the corresponding province/district because
  ```
- Line 119: lat, lon
  ```
  # drop 3 antennas which don't have longitute and latitude information
  ```
- Line 120: lat, lon
  ```
  filter(!(is.na(longitude) | is.na(latitude))) |>
  ```
- Line 121: lon, name
  ```
  rename(longitude_raw = longitude,
  ```
- Line 122: lat
  ```
  latitude_raw = latitude) |>
  ```
- Line 124: lat, lon
  ```
  # the longitude and latitude is reversed for one site (site code masked for confidentiality)
  ```
- Line 125: lat, lon
  ```
  mutate(longitude = ifelse(siteCode == '[MASKED]' , latitude_raw, longitude_raw),
  ```
- Line 126: lat, lon
  ```
  latitude = ifelse(siteCode == '[MASKED]', longitude_raw, latitude_raw)) |>
  ```
- Line 127: lat, lon
  ```
  dplyr::select(-c(longitude_raw, latitude_raw)) |>
  ```
- Line 130: coord, lat, lon
  ```
  st_as_sf(coords = c('longitude','latitude'), crs = crs_unproj, remove = F) |>
  ```
- Line 136: name
  ```
  filter(!is.na(NAME_0)) |>
  ```
- Line 137: name
  ```
  dplyr::select(-c(GID_0, NAME_0))
  ```
- Line 142: coord
  ```
  # Make coordinate matrix
  ```
- Line 143: lat, lon
  ```
  antenna_matrix = cbind(geodf_antenna$longitude, geodf_antenna$latitude)
  ```
- Line 144: name
  ```
  rownames(antenna_matrix) = geodf_antenna$antennaId
  ```
- Line 145: lat, lname, lon, name
  ```
  colnames(antenna_matrix) = c('longitude', 'latitude')
  ```
- Line 160: district
  ```
  # remove already created district-province mapping as they are incorrect in couple of cases
  ```
- Line 161: coord
  ```
  # for example I reversed the coordinates for a tower site
  ```
- Line 162: district
  ```
  dplyr::select(-c(province, province_id, district, district_id)) |>
  ```
- Line 163: name
  ```
  # rename
  ```
- Line 164: name
  ```
  rename(antennaid = antennaId)
  ```
- Line 182: lat, lon
  ```
  group_by(clust_100m, longitude, latitude) |>
  ```
- Line 186: lon
  ```
  summarize(longitude = mean(longitude),
  ```
- Line 187: lat
  ```
  latitude = mean(latitude)) |>
  ```
- Line 191: district
  ```
  #---------------------    Add Grid and District Info    ----------------------#
  ```
- Line 194: coord, lat, lon
  ```
  st_as_sf(coords = c('longitude','latitude'), crs = crs_unproj, remove = F) |>
  ```
- Line 198: district
  ```
  # add district
  ```
- Line 199: district
  ```
  st_join(geodf_districts, join = st_within)
  ```
- Line 202: district
  ```
  # Now add district/province info based on grid centroids
  ```
- Line 214: district
  ```
  geom_sf(data = geodf_districts, size = 0.05, colour = 'black', fill = NA) +
  ```
- Line 225: district
  ```
  ### Missing District Diagnosis
  ```
- Line 228: district
  ```
  # all towers have been mapped to a district (i.e. no missing districts)
  ```
- Line 235: lat, loc
  ```
  relocate(gridid, .after = latitude)
  ```
- Line 239: district
  ```
  # Final number of towers with district mapping: 1739
  ```
- Line 246: district
  ```
  # antenna clusters centroid file. Specifically, we added district/province for each grid as well as 
  ```
- Line 247: loc, location
  ```
  # based on the tower geo-locations. Both the output files has been verified to be the same as the ex
  ```

**/replication-package/replication package/Code/Cleaning/02_gen_tower_maghrib_and_sunset_time.py**

- Line 6: lat
  ```
  # script 01. Maghrib times are calculated via the prayertime package
  ```
- Line 55: lat, loc
  ```
  lat = df_towers.loc[df_towers['clust_100m'] == clust]['latitude'].iloc[0]
  ```
- Line 56: loc, lon
  ```
  lon = df_towers.loc[df_towers['clust_100m'] == clust]['longitude'].iloc[0]
  ```
- Line 65: lon
  ```
  longitude = lon,
  ```
- Line 66: lat
  ```
  latitude = lat,
  ```
- Line 70: son
  ```
  season = 0
  ```
- Line 73: lat
  ```
  prayer.calculate()
  ```
- Line 105: lat, loc, lon
  ```
  df_tower_day = df_towers.loc[:,['clust_100m','longitude','latitude']]
  ```
- Line 110: lat, lon
  ```
  df_towerday_sunset = pd.DataFrame(get_times(df_tower_day['date'], df_tower_day['longitude'], df_towe
  ```
- Line 111: loc
  ```
  df_towerday_sunset = df_towerday_sunset.loc[:, ['sunrise','sunrise_end','sunset_start','sunset']]
  ```
- Line 117: loc
  ```
  # Convert timings to local Afghanistan (UTC +4:30) - add 270*60 = 16200s
  ```
- Line 118: minute
  ```
  df_towerday_sunset['sunrise'] = df_towerday_sunset['sunrise'] + timedelta(hours = 4, minutes = 30)
  ```
- Line 121: minute
  ```
  df_towerday_sunset['sunrise_end'] = df_towerday_sunset['sunrise_end'] + timedelta(hours = 4, minutes
  ```
- Line 124: minute
  ```
  df_towerday_sunset['sunset_start'] = df_towerday_sunset['sunset_start'] + timedelta(hours = 4, minut
  ```
- Line 127: minute
  ```
  df_towerday_sunset['sunset'] = df_towerday_sunset['sunset'] + timedelta(hours = 4, minutes = 30)
  ```
- Line 137: name
  ```
  if __name__ == "__main__":
  ```
- Line 154: loc
  ```
  df_towerday_output = df_towerday_output.loc[:, ['clust_100m','date','maghrib','isha','sunrise','sunr
  ```

**/replication-package/replication package/Code/Cleaning/03_gen_compressed_panel.py**

- Line 5: lat, minute
  ```
  # the hash-tower-day-relative-minute level. Supports four CDR types:
  ```
- Line 8: lat, minute
  ```
  # to compute each transaction's minute offset relative to Maghrib.
  ```
- Line 20: minute
  ```
  #   Shortcode   : ~10 s/month       (~15 minutes total)
  ```
- Line 73: loc, location
  ```
  # Get all home location files across all years (full paths)
  ```
- Line 75: lat
  ```
  # Flatten List (89 months)
  ```
- Line 77: fname, name
  ```
  fnames = [os.path.basename(f) for f in fpaths]
  ```
- Line 78: name
  ```
  year = [os.path.basename(os.path.dirname(f)) for f in fpaths]
  ```
- Line 81: fname, name
  ```
  df = pd.DataFrame({'fpath':fpaths, 'year':year, 'fname_raw':fnames})
  ```
- Line 83: fname, name
  ```
  df['month'] = df['fname_raw'].str.replace('anon_DATA_|_data|shortcode_|_clean.csv|anon_REC_|_rec|rec
  ```
- Line 86: fname, name
  ```
  # Get Corrected fnames for easy indexing
  ```
- Line 99: name
  ```
  # dataset with all the compressed data file paths and names
  ```
- Line 106: name
  ```
  # Index in the ordered file list (since there are some differences across column names after 2017-3)
  ```
- Line 107: lname, loc, name
  ```
  colname_change_index = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == '2017-2'].index.tolist()[0
  ```
- Line 108: loc
  ```
  file_ym_index = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == yearmonth].index.tolist()[0]
  ```
- Line 111: loc
  ```
  fpath = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == yearmonth, 'fpath'].tolist()[0]
  ```
- Line 113: lname, name
  ```
  if ((file_ym_index <= colname_change_index) | (year == '2019')):
  ```
- Line 122: phone
  ```
  .select(pl.col(['phoneHash1','ym','date','time','antenna_id']))
  ```
- Line 128: phone
  ```
  .select(pl.col(['phoneHash1', 'month', 'date', 'time', 'antenna_id']))
  ```
- Line 129: name
  ```
  .rename({'month':'ym'})
  ```
- Line 147: name
  ```
  # Index in the ordered file list (since there are some differences across column names after 2017-3)
  ```
- Line 148: lname, loc, name
  ```
  colname_change_index = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == '2017-2'].index.tolist()[0
  ```
- Line 149: loc
  ```
  file_ym_index = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == yearmonth].index.tolist()[0]
  ```
- Line 152: loc
  ```
  fpath = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == yearmonth, 'fpath'].tolist()[0]
  ```
- Line 154: lname, name
  ```
  if ((file_ym_index <= colname_change_index)):
  ```
- Line 156: lname, name, phone
  ```
  colnames = ['phoneHash1','numtype1','ctrycode1','phoneHash2','numtype2','ctrycode2','interaction','d
  ```
- Line 159: lname, name
  ```
  pl.scan_csv(fpath, has_header = False, new_columns = colnames, dtypes = {'callingcellid': str})
  ```
- Line 165: name
  ```
  .rename({'yearmonth':'ym', 'callingcellid':'antenna_id'})
  ```
- Line 166: phone
  ```
  .select(pl.col(['phoneHash1','ym','date','time','antenna_id']))
  ```
- Line 170: lname, name, phone
  ```
  colnames = ['phoneHash1','numtype1','ctrycode1','phoneHash2','numtype2','ctrycode2','interaction','y
  ```
- Line 173: lname, name
  ```
  pl.scan_csv(fpath, has_header = False, new_columns = colnames, dtypes = {'antenna_id': str})
  ```
- Line 174: phone
  ```
  .select(pl.col(['phoneHash1', 'month', 'date', 'time', 'antenna_id']))
  ```
- Line 175: name
  ```
  .rename({'month':'ym'})
  ```
- Line 192: loc
  ```
  fpath = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == yearmonth, 'fpath'].tolist()[0]
  ```
- Line 195: url
  ```
  pl.scan_csv(fpath, dtypes = {'hourly_modal_antenna':str, 'daily_modal_antenna':str, 'monthly_modal_a
  ```
- Line 197: url
  ```
  antenna_id = pl.when(pl.col('hourly_modal_antenna').is_not_null())
  ```
- Line 198: url
  ```
  .then(pl.col('hourly_modal_antenna'))
  ```
- Line 199: url
  ```
  .when((pl.col('hourly_modal_antenna').is_null()) & (pl.col('daily_modal_antenna').is_not_null()))
  ```
- Line 202: url
  ```
  antenna_mode = pl.when(pl.col('hourly_modal_antenna').is_not_null())
  ```
- Line 203: url
  ```
  .then(pl.lit('hourly'))
  ```
- Line 204: url
  ```
  .when((pl.col('hourly_modal_antenna').is_null()) & (pl.col('daily_modal_antenna').is_not_null()))
  ```
- Line 211: phone
  ```
  .select(pl.col(['phoneHash1','ym','date','time','antenna_id', 'antenna_mode']))
  ```
- Line 229: name
  ```
  # Index in the ordered file list (since there are some differences across column names after 2017-3)
  ```
- Line 230: lname, loc, name
  ```
  colname_change_index = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == '2017-3'].index.tolist()[0
  ```
- Line 231: loc
  ```
  file_ym_index = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == yearmonth].index.tolist()[0]
  ```
- Line 234: loc
  ```
  fpath = df_raw_data_fpaths.loc[df_raw_data_fpaths['ym'] == yearmonth, 'fpath'].tolist()[0]
  ```
- Line 236: lname, name
  ```
  if ((file_ym_index <= colname_change_index)):
  ```
- Line 245: phone
  ```
  .select(pl.col(['phoneHash1','ym','date','time','antenna_id','total_flux','total_charge_flux']))
  ```
- Line 256: name, phone
  ```
  .rename({'phoneHash':'phoneHash1'})
  ```
- Line 257: phone
  ```
  .select(pl.col(['phoneHash1', 'month', 'date', 'time', 'antenna_id','total_flux','total_charge_flux'
  ```
- Line 258: name
  ```
  .rename({'month':'ym'})
  ```
- Line 264: lat
  ```
  # Function to get the compressed panel (hash-tower-day-relativemin)
  ```
- Line 271: name
  ```
  vol_column_name = 'ncalls'
  ```
- Line 274: name
  ```
  vol_column_name = 'ncalls'
  ```
- Line 277: name
  ```
  vol_column_name = 'nsms'
  ```
- Line 280: name
  ```
  vol_column_name = 'ndatapackets'
  ```
- Line 287: lat, minute
  ```
  # Add Maghrib Relative Minutes
  ```
- Line 290: lat
  ```
  # Get Maghrib relative time
  ```
- Line 293: minute
  ```
  # Convert time to minutes
  ```
- Line 296: lat, minute
  ```
  # Add relative minutes
  ```
- Line 301: lat
  ```
  # Get to Hash-Tower-Day-Relative Min
  ```
- Line 303: phone
  ```
  df_hash_towerday_relmin = ldf_transaction.groupby(['phoneHash1','clust_100m','date','maghrib_time_mi
  ```
- Line 307: phone
  ```
  df_hash_towerday_relmin = ldf_transaction.groupby(['phoneHash1','clust_100m','date','maghrib_time_mi
  ```
- Line 314: name, phone
  ```
  df_hash_towerday_relmin = df_hash_towerday_relmin.rename({'phoneHash1':'phonehash', 'ncalls':vol_col
  ```
- Line 319: name, phone
  ```
  cols_order = ['ym','phonehash','clust_100m','date','maghrib_time_min','rel_min',vol_column_name]
  ```
- Line 321: name, phone
  ```
  cols_order = ['ym','phonehash','clust_100m','date','maghrib_time_min','rel_min',vol_column_name,'tot
  ```
- Line 369: loc
  ```
  yearmonths_to_run = df_files.loc[df_files['year'].isin(years_to_run), 'ym'].tolist()
  ```
- Line 373: name
  ```
  if __name__ == "__main__":
  ```
- Line 378: name
  ```
  .rename({'antennaid':'antenna_id'})
  ```
- Line 382: minute
  ```
  # Import Maghrib Prayer Times (convert time to minutes)
  ```
- Line 388: name
  ```
  .rename({'maghrib':'maghrib_time'})
  ```

**/replication-package/replication package/Code/Cleaning/04_gen_outage_ind.py**

- Line 43: fname, name
  ```
  fpaths = [os.path.join(yr_root, fname) for fname in fpaths if fname.endswith('.parquet')]
  ```
- Line 55: lat, minute
  ```
  # abs times to relative minutes
  ```
- Line 56: lon
  ```
  long_df = long_df.with_columns(
  ```
- Line 68: minute
  ```
  # make disjoint groups based on relminute i.e. 0 to 3 am, 3 am to window start, ...
  ```
- Line 69: lon
  ```
  long_df = long_df.with_columns(
  ```
- Line 78: minute
  ```
  .when(pl.col('rel_min') == window_after - 1).then(pl.lit('ncalls_last_window_minute'))
  ```
- Line 84: lon
  ```
  long_df = long_df.group_by(['clust_100m', 'date', 'relmin_group']).agg(relmin_group_ncalls = pl.col(
  ```
- Line 87: lon
  ```
  wide_df = long_df.pivot(index = ['clust_100m','date'], values = 'relmin_group_ncalls', columns = 're
  ```
- Line 95: lat
  ```
  # get relative mins in wide format
  ```
- Line 114: name
  ```
  .rename({'ncalls_bef3am':'ncalls_before_3am_next'})
  ```
- Line 133: minute
  ```
  df = calcCallsPerMinute(df)
  ```
- Line 135: lon
  ```
  # long to wide with buckets, just hardcoding the window for now
  ```
- Line 140: minute
  ```
  'ncalls_3pm_to4pm' ,'ncalls_4pm_towindow', 'ncalls_in_window_openright', 'ncalls_last_window_minute'
  ```
- Line 156: minute
  ```
  df = df.with_columns(outage_to10pm = (pl.col('ncalls_last_window_minute') + pl.col('ncalls_window_to
  ```
- Line 157: minute
  ```
  outage_tomidnight = (pl.col('ncalls_last_window_minute') + pl.col('ncalls_window_to10pm') + pl.col('
  ```
- Line 158: minute
  ```
  outage_to3am = (pl.col('ncalls_last_window_minute') + pl.col('ncalls_window_to10pm') + pl.col('ncall
  ```
- Line 181: minute
  ```
  outage_vol = outage_vol.with_columns(fourpm = ((pl.col('ncalls_4pm_towindow') + pl.col('ncalls_in_wi
  ```
- Line 182: minute
  ```
  magstart = ((pl.col('ncalls_in_window_openright') + pl.col('ncalls_last_window_minute') + pl.col('nc
  ```
- Line 183: minute
  ```
  magend = ((pl.col('ncalls_last_window_minute') + pl.col('ncalls_window_to10pm') == 0) & (pl.col('nca
  ```
- Line 184: minute
  ```
  threepm = ((pl.col('ncalls_3pm_to4pm') + pl.col('ncalls_4pm_towindow') + pl.col('ncalls_in_window_op
  ```
- Line 185: minute
  ```
  noon = ((pl.col('ncalls_noon_to3pm') + pl.col('ncalls_3pm_to4pm') + pl.col('ncalls_4pm_towindow') + 
  ```
- Line 186: minute
  ```
  nineam = ((pl.col('ncalls_9am_tonoon') + pl.col('ncalls_noon_to3pm') + pl.col('ncalls_3pm_to4pm') + 
  ```
- Line 188: minute
  ```
  outage_vol = outage_vol.with_columns(outage_m_window_to10pm = ((pl.col('ncalls_last_window_minute') 
  ```
- Line 189: minute
  ```
  outage_m_window_tomidnight = ((pl.col('ncalls_last_window_minute') + pl.col('ncalls_window_to10pm') 
  ```
- Line 190: minute
  ```
  outage_m_window_to3am = ((pl.col('ncalls_last_window_minute') + pl.col('ncalls_window_to10pm') + pl.
  ```

**/replication-package/replication package/Code/Cleaning/05_gen_towerday_indicators_panel.py**

- Line 6: district
  ```
  # district-day outage indicators onto a complete tower × date gri
  ```
- Line 38: district
  ```
  # District-Day Tech Outages (Superseded)
  ```
- Line 39: district
  ```
  'districtday_techoutage': '/data/afg_anon/religiosity/comp_cdr_pipeline/04_outages/techoutage/cdr_di
  ```
- Line 52: name
  ```
  df_ramadan = pl.read_csv(paths['ramadan_days']).rename({'ramadan_day':'ramadan'})
  ```
- Line 58: name
  ```
  .rename({'off_nightonly_0calls':'nightoutage'})
  ```
- Line 71: district
  ```
  # Tech Outage (District Day)
  ```
- Line 73: district
  ```
  pl.read_parquet(paths['districtday_techoutage'])
  ```
- Line 75: name
  ```
  .rename({
  ```
- Line 82: district
  ```
  # Convert the district-day techoutages to tower-day outages
  ```
- Line 122: district
  ```
  # District Day Techoutage
  ```

**/replication-package/replication package/Code/Cleaning/06_gen_hash_towerday_panel.py**

- Line 5: lat, minute
  ```
  # relative-minute) to a hash-tower-day-bucket level dataset.
  ```
- Line 7: lat, minute
  ```
  # relative-minute windows around Maghrib (e.g. [-60,-30], [-30,0],
  ```
- Line 19: minute
  ```
  #   Shortcode  : ~7 s/month      (~10–15 minutes tota
  ```
- Line 35: lat
  ```
  # Hash-Tower-Day-RelativeMin Level Data
  ```
- Line 37: lat
  ```
  # Hash-Tower-Day-RelativeMin Level Shortcode Data
  ```
- Line 49: lat, minute
  ```
  # Generate relative minute buckets (for buckets that are not mutually exclusive)
  ```
- Line 52: name
  ```
  bucket_name = f"{relMinStart}_{relMinEnd}"
  ```
- Line 56: name
  ```
  .with_columns(rel_min_bucket = pl.lit(bucket_name))
  ```
- Line 97: lat
  ```
  # Relative Min Buckets
  ```
- Line 98: lat
  ```
  relative_min_buckets = {
  ```
- Line 103: phone
  ```
  groupvars = ['phonehash','clust_100m','date','rel_min_bucket']
  ```
- Line 105: lat
  ```
  # Get data for each relative min bucket
  ```
- Line 110: lat
  ```
  relMinStart = relative_min_buckets['rel_min_start'][i],
  ```
- Line 111: lat
  ```
  relMinEnd = relative_min_buckets['rel_min_end'][i],
  ```
- Line 114: lat
  ```
  for i in range(len(relative_min_buckets['rel_min_start']))
  ```
- Line 120: phone
  ```
  .group_by(['phonehash','clust_100m','date'])
  ```
- Line 123: phone
  ```
  .select(['phonehash','clust_100m','date','rel_min_bucket','ncalls'])
  ```
- Line 127: lon
  ```
  df_hash_towerday_buckets_long = pl.concat(df_hash_towerday_buckets + [df_hash_towerday_nonmaghrib_bu
  ```
- Line 130: lname, lon, name
  ```
  colnames = df_hash_towerday_buckets_long.columns
  ```
- Line 131: lname, name
  ```
  colnames = ['ym'] + colnames
  ```
- Line 132: lname, lon, name
  ```
  df_hash_towerday_buckets_long = df_hash_towerday_buckets_long.with_columns(ym = pl.lit(yearmonth)).s
  ```
- Line 135: lon
  ```
  df_hash_towerday_buckets_long = add_indicators(
  ```
- Line 136: lon
  ```
  data = df_hash_towerday_buckets_long,
  ```
- Line 140: lon
  ```
  return df_hash_towerday_buckets_long
  ```
- Line 163: loc
  ```
  yearmonths_to_run = df_files.loc[df_files['year'].isin(years_to_run), 'ym'].tolist()
  ```
- Line 174: name
  ```
  if __name__ == "__main__":
  ```

**/replication-package/replication package/Code/Cleaning/07_panel_gridmonth_or_districtmonth.py**

- Line 2: district
  ```
  # 07_panel_gridmonth_or_districtmonth.py
  ```
- Line 5: district, minute
  ```
  # grid-month or district-month level. Computes VPM (calls per minute)
  ```
- Line 10: district
  ```
  # and both grid and district spatial levels.
  ```
- Line 21: district
  ```
  #            (1) spatial level ("grid"/"district"), (2) shortcode flag, and
  ```
- Line 37: lat
  ```
  # Hash-Tower-Day-RelativeMin Level Data
  ```
- Line 42: district
  ```
  # Tower-Grid-District data
  ```
- Line 49: district
  ```
  # Districtmonth - Output Directory
  ```
- Line 50: district
  ```
  'output_districtmonth': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmonth_panel/'
  ```
- Line 51: district
  ```
  # Districtmonth Shortcode - Output Directory
  ```
- Line 52: district
  ```
  'output_districtmonth_shortcode': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmon
  ```
- Line 75: district, lat
  ```
  # Add in Grid or District ID (we add only grid or dist ID here, then merge in the other info later -
  ```
- Line 80: district
  ```
  elif spatial_level == 'district':
  ```
- Line 119: phone
  ```
  df_spatialhashmonth = data.group_by(['ym',f"{spatialid}",'phonehash']).agg(
  ```
- Line 125: phone
  ```
  nhash = pl.col('phonehash').n_unique()
  ```
- Line 130: phone
  ```
  df_spatialhashmonth.with_columns(hash_ncalls = pl.col('ncalls').sum().over('phonehash'))
  ```
- Line 134: phone
  ```
  nhash_robust = pl.col('phonehash').n_unique()
  ```
- Line 148: lat
  ```
  # Aggregate data to grid-month-relativemin bucket level
  ```
- Line 149: lon
  ```
  df_spatialmonth_long = data.group_by(['ym',f"{spatialid}",'rel_min_bucket']).agg(
  ```
- Line 155: lon
  ```
  df_spatialmonth = df_spatialmonth_long.pivot(index = idcols, columns = 'rel_min_bucket', values = 'n
  ```
- Line 164: lat
  ```
  # Calculate number of CDR days for each grid
  ```
- Line 169: lat
  ```
  # Calculate average call volume
  ```
- Line 183: name
  ```
  print("Processing Sample {} at {}".format(sample_name, dt.now()))
  ```
- Line 188: district
  ```
  elif spatial_level == 'district':
  ```
- Line 203: name
  ```
  # Add Sample Name
  ```
- Line 204: name
  ```
  df_spatialmonth = df_spatialmonth.with_columns(sample = pl.lit(sample_name))
  ```
- Line 212: district, lat, name
  ```
  cols = ['gridid','grid_cent_lng','grid_cent_lat','grid_provinceName','grid_districtName','grid_disti
  ```
- Line 213: district
  ```
  elif spatial_level == 'district':
  ```
- Line 214: district, name
  ```
  cols = ['distid','provid','districtName','provinceName']
  ```
- Line 244: loc
  ```
  yearmonths_to_run = df_files.loc[df_files['year'].isin(years_to_run), 'ym'].tolist()
  ```
- Line 251: district
  ```
  # Indicate the spatial panel that needs to be processed (string - "grid" or "district")
  ```
- Line 252: district
  ```
  'process_spatial_level': "district",
  ```
- Line 262: name
  ```
  if __name__ == "__main__":
  ```
- Line 300: fname, name
  ```
  fname = f"cdr_{spatial_level}month_{sample}_panel"
  ```
- Line 303: fname, name
  ```
  fname = f"cdr_{spatial_level}month_shortcode_{sample}_panel"
  ```
- Line 305: fname, name
  ```
  fpath = os.path.join(fdir, fname + '.parquet')
  ```

**/replication-package/replication package/Code/Cleaning/08_01_gen_hash_homelocations.py**

- Line 2: loc, location
  ```
  # 08_01_gen_hash_homelocations.py
  ```
- Line 4: district, loc, location
  ```
  # Generates hash-level home locations at the district-month or
  ```
- Line 6: district
  ```
  # spatial unit (district or grid) by call volume, then aggregates
  ```
- Line 7: loc, location
  ```
  # to the month or quarter to assign the modal home location.
  ```
- Line 9: loc, location
  ```
  # Outages are not filtered — they are irrelevant for home locati
  ```
- Line 15: loc, location
  ```
  # IMPORTANT: Set homelocation_spatial_level and homelocation_time_level
  ```
- Line 16: district
  ```
  #            (~L214) before running ("district"/"grid", "month"/"quarter").
  ```
- Line 18: loc, location
  ```
  # Approximate runtime: ~2 hours for grid-quarter home locations.
  ```
- Line 34: lat
  ```
  # Hash-Tower-Day-RelativeMin Level Data
  ```
- Line 36: district
  ```
  # Tower-Grid-District data
  ```
- Line 39: loc, location
  ```
  'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locati
  ```
- Line 72: district
  ```
  # Get Daily Modal Grid/District
  ```
- Line 76: loc, location
  ```
  print("Processing Daily Modal Location {} at {}".format(yearmonth, dt.now()))
  ```
- Line 83: district
  ```
  # Add Grid-District
  ```
- Line 88: district
  ```
  # Get call volume per hash-day-[SPATIAL LEVEL] (district or grid)
  ```
- Line 89: phone
  ```
  grouping_cols = ['phonehash','ym','date', spatial_cols_dict[spatial_level]]
  ```
- Line 90: loc
  ```
  ldf_hash_day_loc_callvol = ldf_compressed.group_by(grouping_cols).agg(
  ```
- Line 94: loc, location
  ```
  # Get daily modal location
  ```
- Line 95: loc
  ```
  ldf_hash_day_loc_callvol = (
  ```
- Line 96: loc
  ```
  ldf_hash_day_loc_callvol
  ```
- Line 98: phone
  ```
  maxcalls = pl.col('ncalls').max().over(['phonehash','ym','date'])
  ```
- Line 100: loc, location
  ```
  # Keep only the modal location
  ```
- Line 102: district
  ```
  # Pick first grid / district per hash-day for the cases where there is a tie (i.e. multiple grids wi
  ```
- Line 104: phone
  ```
  .group_by(['phonehash','ym','date'])
  ```
- Line 111: loc
  ```
  return ldf_hash_day_loc_callvol
  ```
- Line 115: loc, location
  ```
  ### Get monthly or quarter modal location
  ```
- Line 120: loc, location
  ```
  or can be a combined file for 3 months in the quarter. It then finds the total calls per location (d
  ```
- Line 121: loc, location
  ```
  Note: In case of multiple locations (dist/grid) having the same call volume, it picks the first one.
  ```
- Line 125: loc, location
  ```
  df_daily_modal_location = df_daily_modal_location.join(df_month_quarter_mapping, how = 'left', on = 
  ```
- Line 128: phone
  ```
  cols_time_level = ['phonehash', time_cols_dist[time_level]]
  ```
- Line 132: district
  ```
  # Compress data to the monthly / quarter level (calls per district/grid per month/quarter)
  ```
- Line 133: loc, location
  ```
  df_hash_time_loc_callvol = df_daily_modal_location.group_by(grouping_cols).agg(
  ```
- Line 138: district, loc, location
  ```
  # Get Modal Location (district/grid) for the time level (month/quarter)
  ```
- Line 139: loc
  ```
  df_hash_time_loc = (
  ```
- Line 140: loc
  ```
  df_hash_time_loc_callvol
  ```
- Line 144: loc, location
  ```
  # Keep only the modal location
  ```
- Line 146: district
  ```
  # Pick first grid / district per hash-day for the cases where there is a tie (i.e. multiple grids wi
  ```
- Line 155: name
  ```
  # Rename Columns
  ```
- Line 156: name
  ```
  rename_cols_dict = {spatial_cols_dict[spatial_level]:f"home_{spatial_cols_dict[spatial_level]}"}
  ```
- Line 157: loc, name
  ```
  df_hash_time_loc = df_hash_time_loc.rename(rename_cols_dict)
  ```
- Line 159: loc
  ```
  return df_hash_time_loc
  ```
- Line 184: district
  ```
  # Spatial ID based on whether we are running the code for district or grid
  ```
- Line 185: district
  ```
  spatial_cols_dict = {'district':'distid', 'grid':'gridid'}
  ```
- Line 203: name
  ```
  if __name__ == "__main__":
  ```
- Line 212: district
  ```
  #df_tower_griddist['distid'].is_nan().sum()    # we dont have missing district-id
  ```
- Line 214: loc, location
  ```
  # Select Home Location Level
  ```
- Line 215: district, loc, location
  ```
  homelocation_spatial_level = 'district' # 'district' / 'grid'
  ```
- Line 216: loc, location
  ```
  homelocation_time_level = 'month' # 'month' / 'quarter'
  ```
- Line 217: loc, location
  ```
  homelocation_level = homelocation_spatial_level + "_" + homelocation_time_level
  ```
- Line 219: loc, location
  ```
  print("Processing Home Locations at the {} - {} Level".format(homelocation_spatial_level, homelocati
  ```
- Line 222: loc, location
  ```
  if homelocation_time_level == 'quarter':
  ```
- Line 228: loc
  ```
  yearmonthlist = df_files.loc[df_files['yq'] == yq, 'ym'].tolist()
  ```
- Line 230: loc, location
  ```
  # get daily modal home location for each month in the quarter
  ```
- Line 231: loc, location
  ```
  df_daily_modal_loc_all = [get_daily_modal_location(yearmonth = ym, ldf_tower_griddist = ldf_tower_gr
  ```
- Line 232: loc
  ```
  df_daily_modal_loc = pl.concat(df_daily_modal_loc_all)
  ```
- Line 234: loc, location
  ```
  # get modal location for the quarter
  ```
- Line 236: loc, location
  ```
  df_modal_loc = get_timeagg_modal_location(
  ```
- Line 237: loc, location
  ```
  df_daily_modal_location = df_daily_modal_loc,
  ```
- Line 239: loc, location
  ```
  spatial_level = homelocation_spatial_level,
  ```
- Line 240: loc, location
  ```
  time_level = homelocation_time_level
  ```
- Line 245: loc, location
  ```
  output_directory = os.path.join(paths['output_dir'], homelocation_level, year)
  ```
- Line 247: loc, location
  ```
  fpath = os.path.join(output_directory, f"home_locations_{yq}.parquet")
  ```
- Line 248: loc
  ```
  df_modal_loc.write_parquet(fpath)
  ```
- Line 252: loc, location
  ```
  if homelocation_time_level == 'month':
  ```
- Line 257: loc, location
  ```
  # get daily modal location for the month
  ```
- Line 258: loc, location
  ```
  df_daily_modal_loc = get_daily_modal_location(
  ```
- Line 261: loc, location
  ```
  spatial_level = homelocation_spatial_level
  ```
- Line 264: loc, location
  ```
  # get modal location for the month
  ```
- Line 265: loc, location
  ```
  df_modal_loc = get_timeagg_modal_location(
  ```
- Line 266: loc, location
  ```
  df_daily_modal_location = df_daily_modal_loc,
  ```
- Line 268: loc, location
  ```
  spatial_level = homelocation_spatial_level,
  ```
- Line 269: loc, location
  ```
  time_level = homelocation_time_level
  ```
- Line 274: loc, location
  ```
  fpath = os.path.join(paths['output_dir'], homelocation_level, year, f"home_locations_{ym}")
  ```
- Line 275: loc
  ```
  df_modal_loc.write_parquet(fpath + '.parquet')
  ```
- Line 280: loc, location
  ```
  # Import Home Locations
  ```
- Line 281: loc, location
  ```
  df_homeloc = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/h
  ```
- Line 282: loc, phone
  ```
  print(df_homeloc.select('phonehash').n_unique()) # 3,888,220
  ```
- Line 284: loc, location
  ```
  # Old Home Locations
  ```
- Line 285: loc
  ```
  df_homeloc_old = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_pan
  ```
- Line 286: loc, phone
  ```
  print(df_homeloc_old.select('phoneHash1').n_unique()) # 4,140,841
  ```
- Line 288: loc, location
  ```
  # Old Home Locations (Older - Currently in Use)
  ```
- Line 289: loc
  ```
  df_homeloc_oldold = pl.read_csv('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_pane
  ```
- Line 290: loc, phone
  ```
  print(df_homeloc_oldold.filter(pl.col('prd_col') == '2018-q1').select('phoneHash1').n_unique()) # 4,
  ```
- Line 294: phone
  ```
  print(df_hashqtr_panel.filter(pl.col('yr_prd') == '2018-q1').select('phonehash').n_unique()) # 3,891
  ```
- Line 298: loc, location
  ```
  # Import Home Locations
  ```
- Line 299: loc, location
  ```
  df_homeloc = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/h
  ```
- Line 300: loc, phone
  ```
  print(df_homeloc.select('phonehash').n_unique()) # 4,312,500 # 4,170,936 (after dropping night/tech 
  ```
- Line 305: phone
  ```
  print(df_hashqtr_panel.filter(pl.col('yr_prd') == '2013-q2').select('phonehash').n_unique()) # 4,175
  ```

**/replication-package/replication package/Code/Cleaning/08_02_gen_hash_districtmonth_continuity_ind.py**

- Line 2: district
  ```
  # 08_02_gen_hash_districtmonth_continuity_ind.py
  ```
- Line 7: district
  ```
  # home district against each prior month to produce presence and
  ```
- Line 8: loc, location
  ```
  # same/different location flags. Aggregates these into strict and
  ```
- Line 13: loc
  ```
  #   Time-space          — sameloc_[strict|relax]_[3|6]m
  ```
- Line 14: loc
  ```
  #                         no_diffloc_[3|6]mo
  ```
- Line 15: loc
  ```
  #   Time-space extended — no_diffloc_6mo_pres[7-9|7-12|7-any|..
  ```
- Line 21: minute
  ```
  # Approximate runtime: ~30 minutes.
  ```
- Line 36: district, loc, location
  ```
  # District-Month Home Locations
  ```
- Line 37: district, loc, location
  ```
  'homelocations_districtmonth': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel
  ```
- Line 39: district, loc, location
  ```
  'output_dir': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_locati
  ```
- Line 49: lat
  ```
  Calculates how many missing data months (2017-3, 2017-4) turn up in the previous
  ```
- Line 82: loc, location
  ```
  # Importing home locations
  ```
- Line 84: district, loc, location
  ```
  fpath = os.path.join(paths['homelocations_districtmonth'], year, f"home_locations_{reference_ym}.par
  ```
- Line 85: name, phone
  ```
  reference_df = pl.read_parquet(fpath).select(['phonehash','home_distid']).rename({'home_distid':'dis
  ```
- Line 87: loc, location
  ```
  # create home location df (we add other prior columns to it)
  ```
- Line 88: loc
  ```
  homeloc_df = reference_df
  ```
- Line 90: loc, location
  ```
  # compare previous months with reference month and create same-location and different-location
  ```
- Line 97: lat
  ```
  # Prior month id (relative to current month)
  ```
- Line 101: loc, location
  ```
  # create location columns
  ```
- Line 102: loc
  ```
  homeloc_df = homeloc_df.with_columns(
  ```
- Line 104: loc
  ```
  pl.lit(0).cast(pl.Int8).alias(f"sameloc{prior_month}mo"),
  ```
- Line 105: loc
  ```
  pl.lit(0).cast(pl.Int8).alias(f"diffloc{prior_month}mo")
  ```
- Line 109: district, loc, location
  ```
  fpath = os.path.join(paths['homelocations_districtmonth'], prior_year, f"home_locations_{prior_ym}.p
  ```
- Line 110: name, phone
  ```
  prior_df = pl.read_parquet(fpath).select(['phonehash','home_distid']).rename({'home_distid':'distid'
  ```
- Line 111: loc, phone
  ```
  homeloc_df = homeloc_df.join(prior_df, how = 'left', on = 'phonehash')
  ```
- Line 113: loc, location
  ```
  # create location columns
  ```
- Line 114: loc
  ```
  homeloc_df = homeloc_df.with_columns(
  ```
- Line 116: loc
  ```
  (pl.col('distid_ref') == pl.col('distid')).cast(pl.Int8).alias(f"sameloc{prior_month}mo"),
  ```
- Line 117: loc
  ```
  (pl.col('distid_ref') != pl.col('distid')).cast(pl.Int8).alias(f"diffloc{prior_month}mo")
  ```
- Line 120: loc
  ```
  homeloc_df = homeloc_df.drop('distid')
  ```
- Line 121: loc
  ```
  homeloc_df = homeloc_df.fill_null(0)
  ```
- Line 123: loc, location
  ```
  # Counts - same/different home locations in the past 3/6 months
  ```
- Line 124: loc
  ```
  homeloc_df = homeloc_df.with_columns(
  ```
- Line 127: loc, location
  ```
  # Counts for same home locations
  ```
- Line 128: loc
  ```
  n_sameloc_3months = pl.sum_horizontal([f"sameloc{i}mo" for i in range(1, min(4, df_files['ym'].tolis
  ```
- Line 129: loc
  ```
  n_sameloc_6months = pl.sum_horizontal([f"sameloc{i}mo" for i in range(1, min(7, df_files['ym'].tolis
  ```
- Line 130: loc, location
  ```
  # Counts for different home locations
  ```
- Line 131: loc
  ```
  n_diffloc_3months = pl.sum_horizontal([f"diffloc{i}mo" for i in range(1, min(4, df_files['ym'].tolis
  ```
- Line 132: loc
  ```
  n_diffloc_6months = pl.sum_horizontal([f"diffloc{i}mo" for i in range(1, min(7, df_files['ym'].tolis
  ```
- Line 142: lat
  ```
  # Calculate Continuity Indicators
  ```
- Line 145: loc, location
  ```
  (1) Strict Continuity - (3 or 6 months) - The hash is present (in any location) for the past 3/6 mon
  ```
- Line 146: loc, location
  ```
  (2) Relaxed Continuity - (3 or 6 months) - The hash is present (in any location) for the past 2/3 or
  ```
- Line 149: loc, location
  ```
  (1) Same Locations - Strict (3 or 6 months) - The hash is present in the same home locations for the
  ```
- Line 150: loc, location
  ```
  (2) Same Locations - Relax (3 or 6 months) - The hash is present in the same home locations for at l
  ```
- Line 151: loc, location
  ```
  (3) No Different Home Locations (3 or 6 months) - This is for the continuity measures where instead 
  ```
- Line 154: loc, location
  ```
  - Strict 3/6 - If the count of same locations is equal to the no. of non-missing data months in the 
  ```
- Line 155: loc, location
  ```
  - Relaxed 3 - If the count of same locations is at least 'x' of the 3 pre-period months. 'x' refers 
  ```
- Line 156: loc, location
  ```
  - Relaxed 6 - If the count of same locations is at least 4 of the 6 pre-period months
  ```
- Line 158: loc
  ```
  homeloc_df = homeloc_df.with_columns(
  ```
- Line 164: loc, location
  ```
  # Same home locations
  ```
- Line 165: loc
  ```
  sameloc_strict_3mo = (pl.col('n_sameloc_3months') == (3 - n_missing_months_in_prior_3months)).cast(p
  ```
- Line 166: loc
  ```
  sameloc_relax_3mo = (pl.col('n_sameloc_3months') >= min(2, 3-n_missing_months_in_prior_3months)).cas
  ```
- Line 167: loc
  ```
  sameloc_strict_6mo = (pl.col('n_sameloc_6months') == (6 - n_missing_months_in_prior_6months)).cast(p
  ```
- Line 168: loc
  ```
  sameloc_relax_6mo = (pl.col('n_sameloc_6months') >= 4).cast(pl.Int8),
  ```
- Line 169: loc, location
  ```
  # No different home locations
  ```
- Line 170: loc
  ```
  no_diffloc_3mo = (pl.col('n_diffloc_3months') == 0).cast(pl.Int8),
  ```
- Line 171: loc
  ```
  no_diffloc_6mo = (pl.col('n_diffloc_6months') == 0).cast(pl.Int8)
  ```
- Line 175: loc
  ```
  homeloc_df = homeloc_df.with_columns(ym = pl.lit(reference_ym))
  ```
- Line 176: loc, name
  ```
  homeloc_df = homeloc_df.rename({'distid_ref':'distid'})
  ```
- Line 180: lat, loc, location
  ```
  # Calculate no different home location modified definition
  ```
- Line 182: loc, location
  ```
  Here, for the sample without any different home location, we check if there are also present in the 
  ```
- Line 189: loc
  ```
  homeloc_df = homeloc_df.with_columns(
  ```
- Line 190: loc
  ```
  n_sameloc_7_9months = pl.sum_horizontal([f"sameloc{i}mo" for i in range(7,10)]),
  ```
- Line 191: loc
  ```
  n_sameloc_7_12months = pl.sum_horizontal([f"sameloc{i}mo" for i in range(7,13)]),
  ```
- Line 192: loc
  ```
  n_sameloc_7_any_months = pl.sum_horizontal([f"sameloc{i}mo" for i in range(7,reference_ym_index)]),
  ```
- Line 193: loc
  ```
  n_sameloc_8_any_months = pl.sum_horizontal([f"sameloc{i}mo" for i in range(8,reference_ym_index)]),
  ```
- Line 194: loc
  ```
  n_sameloc_12_any_months = pl.sum_horizontal([f"sameloc{i}mo" for i in range(12,reference_ym_index + 
  ```
- Line 196: loc
  ```
  no_diffloc_6mo_pres7_9mo = (
  ```
- Line 197: loc
  ```
  (pl.col('sameloc_strict_6mo') == 1) | ((pl.col('no_diffloc_6mo') == 1) & (pl.col('n_sameloc_7_9month
  ```
- Line 199: loc
  ```
  no_diffloc_6mo_pres7_12mo = (
  ```
- Line 200: loc
  ```
  (pl.col('sameloc_strict_6mo') == 1) | ((pl.col('no_diffloc_6mo') == 1) & (pl.col('n_sameloc_7_12mont
  ```
- Line 202: loc
  ```
  no_diffloc_6mo_pres7_any = (
  ```
- Line 203: loc
  ```
  (pl.col('sameloc_strict_6mo') == 1) | ((pl.col('no_diffloc_6mo') == 1) & (pl.col('n_sameloc_7_any_mo
  ```
- Line 205: loc
  ```
  no_diffloc_6mo_pres8_any = (
  ```
- Line 206: loc
  ```
  (pl.col('sameloc_strict_6mo') == 1) | ((pl.col('no_diffloc_6mo') == 1) & (pl.col('n_sameloc_8_any_mo
  ```
- Line 208: loc
  ```
  no_diffloc_6mo_pres12_any = (
  ```
- Line 209: loc
  ```
  (pl.col('sameloc_strict_6mo') == 1) | ((pl.col('no_diffloc_6mo') == 1) & (pl.col('n_sameloc_12_any_m
  ```
- Line 213: phone
  ```
  columnorder = ['ym','phonehash','distid',
  ```
- Line 215: loc
  ```
  'sameloc_relax_3mo','sameloc_strict_3mo','sameloc_relax_6mo','sameloc_strict_6mo',
  ```
- Line 216: loc
  ```
  'no_diffloc_3mo','no_diffloc_6mo',
  ```
- Line 217: loc
  ```
  'no_diffloc_6mo_pres7_9mo','no_diffloc_6mo_pres7_12mo','no_diffloc_6mo_pres7_any',
  ```
- Line 218: loc
  ```
  'no_diffloc_6mo_pres8_any','no_diffloc_6mo_pres12_any']
  ```
- Line 219: loc
  ```
  output_df = homeloc_df.select(columnorder)
  ```
- Line 222: phone
  ```
  columnorder = ['ym','phonehash','distid',
  ```
- Line 224: loc
  ```
  'sameloc_relax_3mo','sameloc_strict_3mo','sameloc_relax_6mo','sameloc_strict_6mo',
  ```
- Line 225: loc
  ```
  'no_diffloc_3mo','no_diffloc_6mo']
  ```
- Line 226: loc
  ```
  output_df = homeloc_df.select(columnorder)
  ```
- Line 229: phone
  ```
  output_check = output_df.drop(['phonehash','distid']).groupby('ym').agg(pl.all().sum()).melt(id_vars
  ```
- Line 270: loc, second
  ```
  # i've modified this to run for the second and third months which works for the no diff home loc stu
  ```
- Line 272: name
  ```
  if __name__ == "__main__":
  ```

**/replication-package/replication package/Code/Cleaning/08_03_panel_gridmonth_or_districtmonth_restricted.py**

- Line 2: district
  ```
  # 08_03_panel_gridmonth_or_districtmonth_restricted.py
  ```
- Line 30: lat
  ```
  # Hash-Tower-Day-RelativeMin Level Data
  ```
- Line 35: district
  ```
  # Tower-Grid-District data
  ```
- Line 39: district, loc, location
  ```
  'continuity_indicators': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_
  ```
- Line 46: district
  ```
  # Districtmonth - Output Directory
  ```
- Line 47: district
  ```
  #'output_districtmonth': '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmonth_panel/
  ```
- Line 66: phone
  ```
  cols_to_keep = ['phonehash', restriction_indicator]
  ```
- Line 70: phone
  ```
  ldf_hashtowerday = ldf_hashtowerday.join(ldf_continuity, how = 'left', on = 'phonehash')
  ```
- Line 73: district, lat
  ```
  # Add in Grid or District ID (we add only grid or dist ID here, then merge in the other info later -
  ```
- Line 117: phone
  ```
  df_spatialhashmonth = data.groupby(['ym',f"{spatialid}",'phonehash']).agg(
  ```
- Line 123: phone
  ```
  nhash = pl.col('phonehash').n_unique()
  ```
- Line 128: phone
  ```
  df_spatialhashmonth.with_columns(hash_ncalls = pl.col('ncalls').sum().over('phonehash'))
  ```
- Line 132: phone
  ```
  nhash_robust = pl.col('phonehash').n_unique()
  ```
- Line 146: lat
  ```
  # Aggregate data to grid-month-relativemin bucket level
  ```
- Line 147: lon
  ```
  df_spatialmonth_long = data.groupby(['ym',f"{spatialid}",'rel_min_bucket']).agg(
  ```
- Line 153: lon
  ```
  df_spatialmonth = df_spatialmonth_long.pivot(index = idcols, columns = 'rel_min_bucket', values = 'n
  ```
- Line 162: lat
  ```
  # Calculate number of CDR days for each grid
  ```
- Line 167: lat
  ```
  # Calculate average call volume
  ```
- Line 181: name
  ```
  print("Processing Sample {} at {}".format(sample_name, dt.now()))
  ```
- Line 201: name
  ```
  # Add Sample Name
  ```
- Line 202: name
  ```
  df_spatialmonth = df_spatialmonth.with_columns(sample = pl.lit(sample_name))
  ```
- Line 210: district, lat, name
  ```
  cols = ['gridid','grid_cent_lng','grid_cent_lat','grid_provinceName','grid_districtName','grid_disti
  ```
- Line 212: district, name
  ```
  cols = ['distid','provid','districtName','provinceName']
  ```
- Line 242: loc
  ```
  yearmonths_to_run = df_files.loc[df_files['year'].isin(years_to_run), 'ym'].tolist()
  ```
- Line 248: loc
  ```
  'timespace': ['sameloc_relax_3mo', 'sameloc_strict_3mo', 'sameloc_relax_6mo', 'sameloc_strict_6mo', 
  ```
- Line 249: loc
  ```
  'timespace_additional': ['no_diffloc_6mo_pres7_9mo','no_diffloc_6mo_pres7_12mo','no_diffloc_6mo_pres
  ```
- Line 252: loc
  ```
  #restriction_indicators_to_run = ['is_relax_cont_3mo', 'is_strict_cont_3mo', 'is_relax_cont_6mo', 'i
  ```
- Line 261: loc
  ```
  restriction_indicators_to_run = ['is_relax_cont_6mo', 'is_strict_cont_6mo'] + ['sameloc_strict_6mo',
  ```
- Line 262: loc
  ```
  restriction_indicators_to_run = ['is_strict_cont_3mo','no_diffloc_3mo']
  ```
- Line 268: name
  ```
  if __name__ == "__main__":
  ```
- Line 319: fname, name
  ```
  fname = f"cdr_{spatial_level}month_{restrInd}_{sample}_panel"
  ```
- Line 320: fname, name
  ```
  fpath = os.path.join(fdir, fname)
  ```
- Line 357: loc
  ```
  test = pl.read_csv('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panels/dis
  ```
- Line 360: loc
  ```
  # TODO: fix so that the 3mo nodiffhome loc mod goes to separate folder
  ```
- Line 362: loc
  ```
  df.write_parquet(fpath + '_nodiffloc_mod.parquet')
  ```
- Line 365: loc
  ```
  test2 = pl.read_parquet('/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restricted_panel
  ```

**/replication-package/replication package/Code/Cleaning/09_01_gen_hash_level_relig.py**

- Line 7: lat, minute
  ```
  # Maghrib relative-minute buckets to produce a yearly quarterly
  ```
- Line 45: phone
  ```
  return pl.LazyFrame(schema = [("phonehash",str),("rel_min_bucket",str), ("ncalls",int), ("yr_prd",st
  ```
- Line 58: phone
  ```
  df_agged = df_agged.group_by(["phonehash", "rel_min_bucket"]).agg(pl.col("ncalls").sum())
  ```
- Line 72: phone
  ```
  select_cols = ['ym','phonehash', 'clust_100m', 'date', 'rel_min_bucket', 'ncalls', 'ramadan', 'outag
  ```
- Line 97: phone
  ```
  mon_df = mon_df.pivot(values="ncalls", index=["phonehash", "yr_prd"], columns="rel_min_bucket", aggr
  ```
- Line 118: phone
  ```
  df = df.pivot(values="ncalls",index=["phonehash", "yr_prd"], columns="rel_min_bucket", aggregate_fun
  ```
- Line 123: phone
  ```
  df = pl.DataFrame(schema = [("phonehash",str),("yr_prd",str), ("not_around_maghrib",int), ("-60_-30"
  ```
- Line 125: phone
  ```
  df = df.select(['phonehash', 'yr_prd', 'not_around_maghrib', '-60_-30', '-30_0', '0_30', '30_60'])
  ```
- Line 159: name
  ```
  if __name__ == "__main__":
  ```

**/replication-package/replication package/Code/Cleaning/09_02_gen_init_hash_relig.py**

- Line 6: lat
  ```
  # across several baseline windows, calculates the Maghrib dip
  ```
- Line 7: minute
  ```
  # (% drop in calls per minute in the 30 min after vs. before
  ```
- Line 26: name
  ```
  if __name__ == "__main__":
  ```
- Line 33: phone
  ```
  cols_to_read = ['phonehash', 'yr_prd', 'not_around_maghrib', '-60_-30', '-30_0', '0_30', '30_60']
  ```
- Line 36: lat
  ```
  relg_13_16_relative_path_lst = ["2013_quarterly_panel.parquet", "2014_quarterly_panel.parquet",
  ```
- Line 39: lat
  ```
  for fpath in relg_13_16_relative_path_lst]
  ```
- Line 42: phone
  ```
  relg_13_16_df = relg_13_16_df.group_by("phonehash").sum()
  ```
- Line 47: phone
  ```
  relg_13_15_df = relg_13_15_df.group_by("phonehash").sum()
  ```
- Line 61: lat
  ```
  relg_13_14_relative_path_lst = ["2013_quarterly_panel.parquet", "2014_quarterly_panel.parquet"]
  ```
- Line 63: lat
  ```
  for fpath in relg_13_14_relative_path_lst]
  ```
- Line 66: phone
  ```
  relg_13_14_df = relg_13_14_df.group_by("phonehash").sum()
  ```
- Line 73: lat
  ```
  relg_13_relative_path_lst = ["2013_quarterly_panel.parquet"]
  ```
- Line 75: lat
  ```
  for fpath in relg_13_relative_path_lst]
  ```
- Line 80: phone
  ```
  relg_13q2_df = relg_13q2_df.group_by("phonehash").sum().drop("yr_prd")
  ```
- Line 86: phone
  ```
  relg_13q3_df = relg_13q3_df.group_by("phonehash").sum().drop("yr_prd")
  ```
- Line 92: phone
  ```
  relg_13q2q3_df = relg_13q2q3_df.group_by("phonehash").sum().drop("yr_prd")
  ```
- Line 102: phone
  ```
  unique_q2 = set(relg_13q2_df.select(pl.col("phonehash").unique()).to_series().to_list())
  ```
- Line 104: phone
  ```
  unique_q3 = set(relg_13q3_df.select(pl.col("phonehash").unique()).to_series().to_list())
  ```
- Line 106: phone
  ```
  unique_q2q3 = set(relg_13q2q3_df.select(pl.col("phonehash").unique()).to_series().to_list())
  ```

**/replication-package/replication package/Code/Cleaning/09_03_gen_hashqtr_panel.py**

- Line 6: loc, location
  ```
  # home locations (script 08_01), initial religiosity bins across
  ```
- Line 39: loc, location
  ```
  # Grid-Quarter Home Locations
  ```
- Line 40: loc, location
  ```
  'grid_qtr_home_loc':'/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_lvl_panel/hash_home_
  ```
- Line 48: loc, location
  ```
  # Function to process and append all home locations for all years
  ```
- Line 51: loc
  ```
  home_loc_panel = pl.DataFrame()
  ```
- Line 62: loc, location
  ```
  #### Import Hash-Quarter Home Locations (Grids)
  ```
- Line 63: loc, location
  ```
  home_loc_filepath = [path.join(paths['grid_qtr_home_loc'], "{}/home_locations_{}-{}.parquet".format(
  ```
- Line 64: loc
  ```
  home_loc_list = [pl.read_parquet(path) for path in home_loc_filepath]
  ```
- Line 65: loc
  ```
  home_loc = pl.concat(home_loc_list)
  ```
- Line 68: loc
  ```
  home_loc = home_loc.with_columns(pl.all().fill_null(strategy=("zero")))
  ```
- Line 71: loc
  ```
  home_loc = home_loc.with_columns(yq = pl.col("yq").str.to_lowercase())
  ```
- Line 74: loc, phone
  ```
  home_loc = home_loc[['phonehash','yq','home_gridid']]
  ```
- Line 75: loc, phone
  ```
  home_loc.columns = ['phonehash','yearQtr','home_gridid']
  ```
- Line 78: loc
  ```
  home_loc_panel = pl.concat([home_loc_panel, home_loc])
  ```
- Line 80: loc
  ```
  return home_loc_panel
  ```
- Line 96: phone
  ```
  hash_mgrb = hash_mgrb.with_columns(totalCallVol = pl.sum_horizontal(pl.exclude("phonehash","yr_prd")
  ```
- Line 100: lat
  ```
  # Calculate Maghrib Dip
  ```
- Line 109: phone
  ```
  hash_mgrb = hash_mgrb.select(['phonehash','yr_prd','vpm_diff_30min_avg_denom', 'vpm_diff_30min_bef_d
  ```
- Line 110: phone
  ```
  hash_mgrb.columns = ['phonehash','yearQtr','vpm_diff_30min_avg_denom', 'vpm_diff_30min_bef_denom', '
  ```
- Line 115: name
  ```
  .otherwise(pl.col("vpm_diff_30min_avg_denom")).keep_name())
  ```
- Line 119: name
  ```
  .otherwise(pl.col("vpm_diff_30min_avg_denom")).keep_name())
  ```
- Line 137: name
  ```
  .otherwise(pl.col("vpm_diff_30min_bef_denom")).keep_name())
  ```
- Line 141: name
  ```
  .otherwise(pl.col("vpm_diff_30min_bef_denom")).keep_name())
  ```
- Line 154: name
  ```
  .otherwise(pl.col("vpm_diff_bef_denom_laplace")).keep_name())
  ```
- Line 167: lat
  ```
  # Calculate Maghrib Dip
  ```
- Line 180: phone
  ```
  hash_initial_relig = hash_initial_relig[['phonehash','vpm_diff_30min_avg_denom','vpm_diff_30min_bef_
  ```
- Line 181: phone
  ```
  hash_initial_relig.columns = ['phonehash','vpm_diff_30m_init_avg_denom','vpm_diff_30m_init_bef_denom
  ```
- Line 188: name
  ```
  .keep_name())
  ```
- Line 206: name
  ```
  .keep_name())
  ```
- Line 214: name
  ```
  .keep_name())
  ```
- Line 233: name
  ```
  .keep_name())
  ```
- Line 241: loc, location
  ```
  # Get Hash-Quarter-HomeLocations Panel
  ```
- Line 242: loc
  ```
  home_loc_panel = fns_home_loc_panel(years_list = years)
  ```
- Line 243: loc
  ```
  home_loc_panel.select('home_gridid').tail(20) # the rounding is not great
  ```
- Line 255: name
  ```
  hash_initial_relig_to16 = hash_initial_relig_to16.rename({"vpm_diff_30m_init_avg_denom":"vpm_diff_30
  ```
- Line 264: name
  ```
  hash_initial_relig_to15 = hash_initial_relig_to15.rename({"vpm_diff_30m_init_avg_denom":"vpm_diff_30
  ```
- Line 288: loc
  ```
  home_loc_panel.describe()
  ```
- Line 291: name
  ```
  sms_panel = pl.read_parquet(paths['sms_panel']).rename({'yr_prd' : 'yearQtr'})
  ```
- Line 292: name, phone
  ```
  data_panel = pl.read_parquet(paths['data_panel']).rename({'yr_prd' : 'yearQtr'}).select(['phonehash'
  ```
- Line 296: phone
  ```
  hash_mgrb_panel = hash_mgrb_panel.join(sms_panel, on = ['phonehash','yearQtr'], how = 'left').with_c
  ```
- Line 300: phone
  ```
  hash_mgrb_panel = hash_mgrb_panel.join(data_panel, on = ['phonehash','yearQtr'], how = 'left').with_
  ```
- Line 304: loc, location, phone
  ```
  # add grid location for each phone Hash
  ```
- Line 305: loc, phone
  ```
  hash_grid_mgrb = hash_mgrb_panel.join(home_loc_panel, on = ['phonehash','yearQtr'], how = 'left')
  ```
- Line 306: phone
  ```
  len(hash_grid_mgrb.select('phonehash').unique()) # 10962314
  ```
- Line 309: phone
  ```
  hash_grid_mgrb = hash_grid_mgrb.join(hash_initial_relig_to16, on = ['phonehash'], how='left')
  ```
- Line 310: phone
  ```
  hash_grid_mgrb = hash_grid_mgrb.join(hash_initial_relig_to15, on = ['phonehash'], how='left')
  ```
- Line 311: phone
  ```
  len(hash_grid_mgrb.select('phonehash').unique()) # 10962314
  ```
- Line 315: phone
  ```
  len(hash_grid_mgrb.select('phonehash').unique()) # 10962314
  ```
- Line 326: loc, location
  ```
  hash_grid_mgrb.select(pl.col(['home_gridid', "speipm9_g"])).describe() # 133781 nulls, meaning 13378
  ```

**/replication-package/replication package/Code/Cleaning/10_SIGACTS_merge_cdr.R**

- Line 4: district
  ```
  # Merges the district-month CDR panel (script 07) and resident-
  ```
- Line 7: lat
  ```
  # and type (IED, direct fire, friendly/enemy), constructs cumulative
  ```
- Line 8: city, district
  ```
  # 3-month violence exposure lags, and merges district-level ethnicity
  ```
- Line 25: network
  ```
  'sigacts'                      = '/data/afg_anon/networks/conflict/SIGACTS/sigacts_w_grid_dist_id.cs
  ```
- Line 26: network
  ```
  'sigacts_event_class'          = '/data/afg_anon/networks/conflict/SIGACTS/SIGACTS_event_classificat
  ```
- Line 27: network
  ```
  'acsor'                        = '/data/afg_anon/networks/conflict/ACSOR/acsor_distmonth.csv',
  ```
- Line 28: district
  ```
  'districtmonth'                = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmont
  ```
- Line 29: district, loc
  ```
  'districtmonth_nodiffhome6mo'  = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restric
  ```
- Line 30: district, loc
  ```
  'districtmonth_nodiffhome3mo'  = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restric
  ```
- Line 31: district, loc
  ```
  'districtmonth_nodiffhome3mo_old' = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_rest
  ```
- Line 32: district
  ```
  'districtmonth_timerbst3mo'    = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/hash_restric
  ```
- Line 33: district
  ```
  'districtmonth_shortcode'      = '/data/afg_anon/religiosity/comp_cdr_pipeline/03_panel/districtmont
  ```
- Line 34: city, district, network
  ```
  'distrlvl_ethnicity_10km'      = '/data/afg_anon/networks/dyad_pipeline/03_panel/distr_mon_chars/eth
  ```
- Line 35: network
  ```
  'sigacts_cdr_df_output'        = '/data/afg_anon/networks/conflict/SIGACTS'
  ```
- Line 72: name
  ```
  sigacts_spat_agg_month = setnames(sigacts_spat_agg_month, classification_string, 'classification_to_
  ```
- Line 120: name
  ```
  setnames(sigacts_spat_agg_month, spatial_agg, spatial_agg_lower)
  ```
- Line 218: district
  ```
  # Read district-month CDR panels
  ```
- Line 219: district
  ```
  distmonth = fread(paths[['districtmonth']]) %>%
  ```
- Line 223: district
  ```
  distmonth_nodiffhome6mo = fread(paths[['districtmonth_nodiffhome6mo']]) %>%
  ```
- Line 226: district
  ```
  distmonth_nodiffhome3mo = fread(paths[['districtmonth_nodiffhome3mo']]) %>%
  ```
- Line 229: district
  ```
  distmonth_timerbst3mo = fread(paths[['districtmonth_timerbst3mo']]) %>%
  ```
- Line 232: district
  ```
  distmonth_nodiffhome3mo_old = fread(paths[['districtmonth_nodiffhome3mo_old']]) %>%
  ```
- Line 235: district
  ```
  distmonth_shortcode = fread(paths[['districtmonth_shortcode']]) %>%
  ```
- Line 238: district
  ```
  # Merge restricted panels onto main district-month panel
  ```
- Line 265: city
  ```
  # Merge ethnicity controls
  ```
- Line 266: city
  ```
  dist_ethn = fread(paths$distrlvl_ethnicity_10km)
  ```
- Line 277: name
  ```
  # - _cum_3months_decay cols (exceed Stata's 32-char variable name limit and unused in paper)
  ```
- Line 279: name
  ```
  names(cdr_and_conflict_dm),
  ```

**/replication-package/replication package/Code/Cleaning/11_01_220805_create_master.do**

- Line 14: block, loc
  ```
  BLOCK 0 (lines 54–82) is wrapped in "if 1==0{}" and NEVER execute
  ```
- Line 42: loc
  ```
  local date_df = "220805"
  ```
- Line 44: loc, location
  ```
  *Set directory in location of current do-file:
  ```
- Line 49: coord
  ```
  0. Transform csv into dta (round coords) (could do tempfiles instead)
  ```
- Line 55: coord
  ```
  0. Transform csv into dta (round coords) (could do tempfiles instead)
  ```
- Line 60: coord, lat, lon
  ```
  foreach coord in x y{							//latitude and longitude
  ```
- Line 61: coord
  ```
  cap replace `coord' = "" if `coord' == "NA"	//gen missings to be able to destring
  ```
- Line 63: coord
  ```
  cap replace `coord' = round(`coord',0.1)	//round to be able to merge
  ```
- Line 67: coord, district
  ```
  foreach csv in cellcoords_districts cellnums_clust100m clust100m_cellcoords uppsala_cells{
  ```
- Line 69: coord
  ```
  foreach coord in x y{
  ```
- Line 70: coord
  ```
  cap replace `coord' = "" if `coord' == "NA"
  ```
- Line 72: coord
  ```
  cap replace `coord' = round(`coord',0.1)
  ```
- Line 78: coord
  ```
  foreach coord in grd_x grd_y{
  ```
- Line 79: coord
  ```
  cap replace `coord' = "" if `coord' == "NA"
  ```
- Line 81: coord
  ```
  cap replace `coord' = round(`coord', 0.1)
  ```
- Line 92: name
  ```
  rename speipm5 speipm5_r
  ```
- Line 102: district
  ```
  *Open all 6274 cells of Afghanistan with their provinces and districts
  ```
- Line 103: coord, district
  ```
  use "$crosswalks/cellcoords_districts_cw", clear  // district-gridcell matching
  ```
- Line 252: district
  ```
  *Merge with poppy production at district-year level
  ```

**/replication-package/replication package/Code/Cleaning/11_02_220824_create_master_shortcode.do**

- Line 40: loc
  ```
  local date_df = "220824"
  ```
- Line 42: loc, location
  ```
  *Set directory in location of current do-file:
  ```
- Line 47: coord
  ```
  0. Transform csv into dta (round coords) (could do tempfiles instead)
  ```
- Line 53: coord
  ```
  0. Transform csv into dta (round coords) (could do tempfiles instead)
  ```
- Line 58: coord, lat, lon
  ```
  foreach coord in x y{							//latitude and longitude
  ```
- Line 59: coord
  ```
  cap replace `coord' = "" if `coord' == "NA"	//gen missings to be able to destring
  ```
- Line 61: coord
  ```
  cap replace `coord' = round(`coord',0.1)	//round to be able to merge
  ```
- Line 65: coord, district
  ```
  foreach csv in cellcoords_districts cellnums_clust100m clust100m_cellcoords uppsala_cells{
  ```
- Line 67: coord
  ```
  foreach coord in x y{
  ```
- Line 68: coord
  ```
  cap replace `coord' = "" if `coord' == "NA"
  ```
- Line 70: coord
  ```
  cap replace `coord' = round(`coord',0.1)
  ```
- Line 76: coord
  ```
  foreach coord in grd_x grd_y{
  ```
- Line 77: coord
  ```
  cap replace `coord' = "" if `coord' == "NA"
  ```
- Line 79: coord
  ```
  cap replace `coord' = round(`coord', 0.1)
  ```
- Line 89: district
  ```
  *Open all 6274 cells of Afghanistan with their provinces and districts
  ```
- Line 90: coord, district
  ```
  use "$crosswalks/cellcoords_districts_cw", clear
  ```
- Line 237: district
  ```
  *Merge with poppy production at district-year level
  ```

**/replication-package/replication package/Code/Cleaning/11_03_250108_update_master_cdr.do**

- Line 38: loc
  ```
  local date_df = "250108"
  ```
- Line 82: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 85: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 102: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 105: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 120: lat
  ```
  gen lat_str = string(round(y, 0.1))
  ```
- Line 138: lat
  ```
  gen lat_str = string(round(y, 0.1))
  ```

**/replication-package/replication package/Code/Cleaning/12_240213_gen_widewheat_panel.do**

- Line 6: son
  ```
  Builds the cell-year wide panel used for Table 3 (seasonal analysis).
  ```
- Line 9: son
  ```
  and constructs seasonal averages of the Maghrib dip and SPEI across the
  ```
- Line 12: name
  ```
  Despite the "widewheat" name, all wheat production data (province-level
  ```
- Line 13: name
  ```
  irrigated/rainfed area and yield) is fully commented out. The name is a
  ```
- Line 20: name
  ```
  in the output filename. Must be run TWICE to generate both files needed
  ```
- Line 23: loc
  ```
  local yvar      avg_denom | before_denom | keepinf  (line 259, currently avg_denom)
  ```
- Line 86: name
  ```
  keep A B U V W X // provid provname 2012(irrigarea irrigprod rainfedarea rainfedprod)
  ```
- Line 92: name
  ```
  ren (A B U V W X) (provid provname irrigarea12 irrigprod12 rainfedarea12 rainfedprod12)
  ```
- Line 96: name
  ```
  *See very quickly if provnames will match exactly
  ```
- Line 97: name
  ```
  *br provname // paste this in an excel
  ```
- Line 101: name
  ```
  collapse (mean) ones, by(provname)
  ```
- Line 102: name
  ```
  *br provname // paste this in the same excel and see which names will need slight changes
  ```
- Line 106: name
  ```
  replace provname = "Jawzjan" 		if provname == "Juzjan"
  ```
- Line 107: name
  ```
  replace provname = "Kunar"			if provname == "Kuner"
  ```
- Line 108: name
  ```
  replace provname = "Logar"			if provname == "Loger"
  ```
- Line 109: name
  ```
  replace provname = "Maydan Wardak"	if provname == "Maidan"
  ```
- Line 110: name
  ```
  replace provname = "Nangarhar"		if provname == "Nangerhar"
  ```
- Line 111: name
  ```
  replace provname = "Nuristan"		if provname == "Noristan"
  ```
- Line 112: name
  ```
  replace provname = "Panjsher"		if provname == "Panjshir"
  ```
- Line 113: name
  ```
  replace provname = "Parwan"			if provname == "Pervan"
  ```
- Line 114: name
  ```
  replace provname = "Sari Pul"		if provname == "Seripol"*/
  ```
- Line 131: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 134: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 152: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 155: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 167: name
  ```
  rename (speipm5 speipm3 speipm2 x y) (speipm5_r speipm3_r speipm2_r x_new y_new)
  ```
- Line 194: lat
  ```
  gen lat_str = string(round(y, 0.1))
  ```
- Line 213: name
  ```
  collapse (count) cell_id, by(provname)
  ```
- Line 263: loc
  ```
  local yvar avg_denom
  ```
- Line 274: name
  ```
  keep cell_id-y year month speipm1_g speipm2_g speipm3_g speipm5_g speipm6_g speipm9_g speipm12_g spe
  ```
- Line 276: name
  ```
  reshape wide obs_uppsala vpm_pctchange_30min_w speipm1_g speipm2_g speipm3_g speipm5_g speipm6_g spe
  ```
- Line 333: son
  ```
  *Seasonal VPM for 211013 tables: 6,3,1 months of vpm previous to current season (almost like "spring
  ```
- Line 381: son
  ```
  *Seasonal SPEI for 211013 tables: like version "e"
  ```
- Line 388: name
  ```
  rename speipm5_r5 spring_spei_rect
  ```
- Line 396: name
  ```
  rename speipm3_r8 harvest_spei_rect
  ```
- Line 404: name
  ```
  rename speipm2_r10 postharvest_spei_rect
  ```
- Line 411: loc
  ```
  local today : display %tdYND date(c(current_date), "DMY")
  ```
- Line 414: loc
  ```
  local ramadan_str ""
  ```
- Line 417: loc
  ```
  local ramadan_str "noramadan_"
  ```

**/replication-package/replication package/Code/Cleaning/13_precleaning_alltables.do**

- Line 9: lat
  ```
  data manipulation.
  ```
- Line 13: district
  ```
  cdr_and_conflict_dm.dta       District-month: CDR + ISAF violence
  ```
- Line 17: son
  ```
  cdr_and_climate_gy.dta        Grid-cell-year: CDR seasonal + EVI + seasonal SPEI
  ```
- Line 19: district, phone, son
  ```
  calls_shortcode_comparison_dm.dta  District-month stacked: phone vs. shortcode CDR
  ```
- Line 20: district
  ```
  → Table A1 (district pane
  ```
- Line 21: phone, son
  ```
  calls_shortcode_comparison_gm.dta  Grid-month stacked: phone vs. shortcode CDR
  ```
- Line 23: city, district
  ```
  dist_level.dta                District cross-section: time-averaged Maghrib dip + ethnicity
  ```
- Line 24: district
  ```
  → Table A4 (district leve
  ```
- Line 25: city
  ```
  grid_level.dta                Grid cross-section: time-averaged Maghrib dip + ethnicity
  ```
- Line 55: lat
  ```
  * Latex Options
  ```
- Line 69: name
  ```
  rename (faolc_irrig_intense faolc_irrig_all faolc_rainfed faolc_7) (irrig_intns irrig_all rainfed ra
  ```
- Line 70: name
  ```
  rename faolc_3b irrig_marginal
  ```
- Line 168: district
  ```
  * -----  District-month Violence and Relig: Table 1, Table A7, A8, A9   ----- *
  ```
- Line 209: name
  ```
  rename (nhash nhash_robust) (numhashes numhashes_rbst)
  ```
- Line 221: name
  ```
  rename (numhashes_qtile vol_qtile) (numhashes_qtile_pre2015 vol_qtile_pre2015)
  ```
- Line 226: district
  ```
  **** Hazara Districts for Table A9 Column (2)
  ```
- Line 228: city
  ```
  //use "${maindir}/Code/Ethnicity/crossSectionData/cdr_dist_ethnicity", clear
  ```
- Line 243: name
  ```
  rename maghrib_dip maghrib_dip_noram
  ```
- Line 254: name
  ```
  rename num_deadly_enemy         num_insurg_viol
  ```
- Line 255: name
  ```
  rename num_deadly_friendly      num_state_viol
  ```
- Line 256: name
  ```
  rename num_other_enemy          num_other_insurg
  ```
- Line 257: name
  ```
  rename num_other_friendly       num_other_state
  ```
- Line 258: name
  ```
  rename num_deadly_enemy_lead1   num_insurg_viol_lead1
  ```
- Line 259: name
  ```
  rename num_deadly_enemy_lead2   num_insurg_viol_lead2
  ```
- Line 260: name
  ```
  rename num_deadly_enemy_lag1    num_insurg_viol_lag1
  ```
- Line 261: name
  ```
  rename num_deadly_enemy_lag2    num_insurg_viol_lag2
  ```
- Line 297: name
  ```
  * Rename 30 min Variables
  ```
- Line 298: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 305: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom_shortcode
  ```
- Line 306: lat
  ```
  keep year_num month_num lng_str lat_str vpm_diff_avg_denom_shortcode
  ```
- Line 311: phone
  ```
  **** Phone Call:
  ```
- Line 333: name
  ```
  * Rename 30 min Variables
  ```
- Line 334: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 341: phone
  ```
  save `temp_main_panel', replace    // phone call + shortcode
  ```
- Line 354: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 357: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 361: name
  ```
  rename vpm_diff_avg_denom30 vpm_diff_avg_denom_noramadan
  ```
- Line 363: lat
  ```
  keep lng_str lat_str year_num month_num  vpm_diff_avg_denom_noramadan
  ```
- Line 373: district
  ```
  collapse (max) taliban_fg, by(district)
  ```
- Line 374: district, name
  ```
  rename district distid
  ```
- Line 385: name
  ```
  rename (nhash nhash_robust) (numhashes numhashes_rbst)
  ```
- Line 396: name
  ```
  rename (numhashes_qtile vol_qtile) (numhashes_qtile_allyears vol_qtile_allyears)
  ```
- Line 437: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 440: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 455: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 458: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom_continu
  ```
- Line 472: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 475: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 479: loc
  ```
  tempfile temp_nodiffhomeloc
  ```
- Line 480: loc
  ```
  save `temp_nodiffhomeloc', replace
  ```
- Line 490: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 493: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom_nonmove
  ```
- Line 510: district
  ```
  keep cell_id x y district year ym year_str month_num trendval cell_cdr speipm12_g   ///
  ```
- Line 522: district
  ```
  order cell_id x y district year ym year_str month_num trendval cell_cdr speipm12_g   ///
  ```
- Line 553: name
  ```
  rename (vpm_after_30min_yr vpm_before_30min_yr) (vpm_after_30min vpm_before_30min)
  ```
- Line 573: son
  ```
  * Spring (Growing Season SPEI)
  ```
- Line 577: name
  ```
  rename speipm5_r5 spring_spei_rect
  ```
- Line 582: name
  ```
  * Rename 30 min Variables
  ```
- Line 583: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 593: name
  ```
  rename year_num year
  ```
- Line 615: name
  ```
  rename spring_vpm spring_vpm_noram
  ```
- Line 616: name
  ```
  rename harvest_vpm harvest_vpm_noram
  ```
- Line 617: name
  ```
  rename postharvest_vpm postharvest_vpm_noram
  ```
- Line 618: name
  ```
  rename spring_vpm_prev12 spring_vpm_prev12_noram
  ```
- Line 619: name
  ```
  rename harvest_vpm_prev12 harvest_vpm_prev12_noram
  ```
- Line 620: name
  ```
  rename postharvest_vpm_prev12 postharvest_vpm_prev12_noram
  ```
- Line 621: name
  ```
  rename reg_sample reg_sample3
  ```
- Line 649: district, phone
  ```
  * District-month (phone call + shortcode stacked vertically): Table A1
  ```
- Line 669: name
  ```
  rename maghrib_dip maghrib_dip0
  ```
- Line 670: name
  ```
  rename maghrib_dip_shortcode maghrib_dip1
  ```
- Line 671: lon
  ```
  reshape long maghrib_dip, i(ym distid) j(type)
  ```
- Line 678: name
  ```
  rename maghrib_dip value
  ```
- Line 681: son
  ```
  save "${outputdir}/calls_shortcode_comparison_dm.dta", replace
  ```
- Line 683: son
  ```
  *use "${datadir}/CDR/transaction_type/calls_transaction_dip_comparison_panel_dm", clear  // 42108 (2
  ```
- Line 688: phone
  ```
  * Gridcell-month (phone call + shortcode stacked vertically): Table A1
  ```
- Line 694: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom0
  ```
- Line 695: name
  ```
  rename vpm_diff_avg_denom_shortcode vpm_diff_avg_denom1
  ```
- Line 696: lon
  ```
  reshape long vpm_diff_avg_denom, i(cell_id trendval) j(type)
  ```
- Line 707: name
  ```
  rename vpm_diff_avg_denom value
  ```
- Line 710: son
  ```
  save "${outputdir}/calls_shortcode_comparison_gm.dta", replace
  ```
- Line 712: son
  ```
  * use "${datadir}/CDR/transaction_type/calls_transaction_dip_comparison_panel_gm", clear // 74954
  ```
- Line 717: district
  ```
  *---- District level and gridcell level: Table A4 ----
  ```
- Line 728: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 746: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 758: city
  ```
  *** Ethnicity Data
  ```
- Line 762: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 769: name
  ```
  keep distid provid provname maj_ethn maj_ethn_share
  ```
- Line 771: district
  ```
  tempfile temp_districtethn
  ```
- Line 772: district
  ```
  save `temp_districtethn'
  ```
- Line 779: lat
  ```
  collapse vpm_before_30min vpm_after_30min cell_uppsala_0312 cell_uppsala_0320, by(cell_id lng_str la
  ```
- Line 782: name
  ```
  * Rename 30 min Variables
  ```
- Line 783: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 790: city
  ```
  * add ethnicity
  ```
- Line 811: lat
  ```
  collapse vpm_before_30min vpm_after_30min cell_uppsala_0312 cell_uppsala_0320, by(cell_id lng_str la
  ```
- Line 814: name
  ```
  * Rename 30 min Variables
  ```
- Line 815: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 818: city
  ```
  * add ethnicity
  ```
- Line 846: city
  ```
  * add ethnicity
  ```
- Line 874: city
  ```
  * add ethnicity
  ```
- Line 905: district
  ```
  tempfile temp_ethn_district
  ```
- Line 906: district
  ```
  save `temp_ethn_district', replace  // merge this just for sum stats
  ```
- Line 910: name
  ```
  rename maghrib_dip maghrib_dip_sc
  ```
- Line 923: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom_sc
  ```

