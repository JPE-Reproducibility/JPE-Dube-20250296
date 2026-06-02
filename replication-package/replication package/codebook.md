# Codebook

This codebook documents all data files in the replication package. Files are organized by subdirectory. Synthetic files (fabricated placeholders for confidential data) are marked **[SYNTHETIC]**.

---

## 1. Data/tables_data/ — Analysis-Ready Datasets



### 1.1 `cdr_and_conflict_dm.dta/.csv`

**Unit of observation:** District × month (2013–2014)  

| Variable | Description |
|----------|-------------|
| `distid` | District identifier |
| `year` | Calendar year |
| `month` | Calendar month (1–12) |
| `ym` | Year-month string (e.g., "2013-4") |
| `trendval` | Month fixed-effect identifier |
| `total_vol` | Total call volume in district-month |
| `total_vol_ihs` | IHS of total call volume |
| `maghrib_dip` | Maghrib dip |
| `maghrib_dip_ihs` | IHS transform of Maghrib dip |
| `maghrib_dip_before_denom` | Maghrib dip scaled by call volume in the 30 minutes before Maghrib |
| `maghrib_dip_25min` | Maghrib dip using 25-minute windows |
| `maghrib_dip_35min` | Maghrib dip using 35-minute windows |
| `maghrib_dip_40min` | Maghrib dip using 40-minute windows |
| `maghrib_dip_shortcode` | Maghrib dip restricted to shortcode calls only |
| `maghrib_dip_nodiffhome3mo` | Maghrib dip restricted to subscribers with stable home location (no change in past 3 months) |
| `maghrib_dip_lag` | Maghrib dip lagged one month |
| `maghrib_dip_noram` | Maghrib dip excluding Ramadan days |
| `num_insurg_viol` | Number of insurgent violence events |
| `num_insurg_viol_lead1` | Insurgent violence events one month ahead |
| `num_insurg_viol_lead2` | Insurgent violence events two months ahead |
| `num_insurg_viol_lag1` | Insurgent violence events one month prior |
| `num_insurg_viol_lag2` | Insurgent violence events two months prior |
| `num_state_viol` | Number of state-led violence events |
| `num_other_insurg` | Number of other insurgent activity events (SIGACTS) |
| `num_other_state` | Number of other state-led activity events |
| `access_num` | ACSOR district accessibility score |
| `access_dum45` | ACSOR accessibility indicator |
| `access_dum45_nonmiss` | Non-missing indicator for `access_dum45` |
| `access_num_missing` | Missing indicator for `access_num` |
| `share_hazaragi` | Share of Hazaragi-speaking villages in district |
| `hazara1` | Indicator: district is Hazara-majority |
| `numhashes_qtile_pre2015` | Percentile rank of district by number of active subscribers (pre-2015) |
| `vol_qtile_pre2015` | Percentile rank of district by call volume (pre-2015) |

---

### 1.2 `cdr_and_climate_gm.dta/.csv`

**Unit of observation:** Grid cell × month (2013–2020)  

| Variable | Description |
|----------|-------------|
| `cell_id` | Grid cell identifier |
| `x` | Longitude of grid cell center |
| `y` | Latitude of grid cell center |
| `district` | District ID the grid cell falls within |
| `year` | Calendar year |
| `ym` | Year-month string |
| `year_str` | Year as string |
| `month_num` | Month number (1–12) |
| `trendval` | Month fixed-effect identifier |
| `cell_cdr` | Indicator: grid cell has CDR coverage (cell tower present) |
| `speipm12_g` | 12-month SPEI |
| `vpm_diff_avg_denom` | Maghrib dip  |
| `vpm_diff_avg_denom25` | Maghrib dip using 25-minute windows |
| `vpm_diff_avg_denom35` | Maghrib dip using 35-minute windows |
| `vpm_diff_avg_denom40` | Maghrib dip using 40-minute windows |
| `vpm_diff_before_denom` | Maghrib dip scaled by before-period volume |
| `vpm_diff_avg_denom_ihs` | IHS transform of Maghrib dip |
| `vpm_diff_avg_denom_lag` | Maghrib dip lagged one month |
| `vpm_diff_avg_denom_noramadan` | Maghrib dip excluding Ramadan days |
| `vpm_diff_avg_denom_shortcode` | Maghrib dip using shortcode calls only |
| `vpm_diff_avg_denom_continu` | Maghrib dip restricted to subscribers observed in all of past 3 months |
| `vpm_diff_avg_denom_nonmove` | Maghrib dip restricted to non-movers (stable home grid) |
| `total_vol_ihs` | IHS of total call volume in the grid cell-month |
| `call_vol_ihs` | IHS of average daily call volume in the month |
| `rainfed` | Fraction of grid cell that is rainfed cropland |
| `irrig_all` | Fraction of grid cell that is irrigated cropland |
| `rangeland` | Fraction of grid cell that is rangeland |
| `other` | Fraction of grid cell classified as other land type |
| `builtup` | Fraction of grid cell that is built-up area |
| `builtup5` | Indicator: built-up fraction > 5% |
| `hazara1` | Indicator: plurality Hazara-speaking grid cell |
| `taliban_fg` | Indicator: district under Taliban control (PIX) |
| `numhashes_qtile_allyears` | Percentile rank of grid cell by number of subscribers |
| `vol_qtile_allyears` | Percentile rank of grid cell by call volume (all years) |
| `opium_cult_ihs` | IHS of poppy cultivation area (UNODC) |
| `opium_interp_ihs` | IHS of linearly interpolated poppy cultivation |
| `opium_cult_wmiss_ihs` | IHS of poppy cultivation with missing values set to zero |
| `opium_interp_wmiss_ihs` | IHS of interpolated poppy cultivation with missing set to zero |
| `opium_cult_miss_ind` | Indicator: poppy cultivation value is missing |
| `opium_interp_miss_ind` | Indicator: interpolated poppy value is missing |

---

### 1.3 `cdr_and_climate_gy.dta/.csv`

**Unit of observation:** Grid cell × year (2013–2020)  

| Variable | Description |
|----------|-------------|
| `cell_id` | Grid cell identifier |
| `year` | Calendar year |
| `cell_cdr` | Indicator: grid cell has CDR coverage |
| `logdifevi` | Log difference in EVI (Enhanced Vegetation Index) — agricultural growth proxy |
| `spring_spei12` | 12-month SPEI averaged over the growing season (spring) |
| `harvest_spei12` | 12-month SPEI averaged over the harvest season |
| `postharvest_spei12` | 12-month SPEI averaged over the post-harvest season |
| `rainfed` | Fraction rainfed cropland |
| `irrig_all` | Fraction irrigated cropland |
| `rangeland` | Fraction rangeland |
| `other` | Fraction other land type |
| `spring_vpm` | Maghrib dip averaged over growing season |
| `harvest_vpm` | Maghrib dip averaged over harvest season |
| `postharvest_vpm` | Maghrib dip averaged over post-harvest season |
| `spring_vpm_prev12` | Growing season Maghrib dip in prior year |
| `harvest_vpm_prev12` | Harvest season Maghrib dip in prior year |
| `postharvest_vpm_prev12` | Post-harvest Maghrib dip in prior year |
| `spring_vpm_noram` | Growing season Maghrib dip excluding Ramadan |
| `harvest_vpm_noram` | Harvest season Maghrib dip excluding Ramadan |
| `postharvest_vpm_noram` | Post-harvest Maghrib dip excluding Ramadan |
| `spring_vpm_prev12_noram` | Prior year growing season Maghrib dip excluding Ramadan |
| `harvest_vpm_prev12_noram` | Prior year harvest season Maghrib dip excluding Ramadan |
| `postharvest_vpm_prev12_noram` | Prior year post-harvest Maghrib dip excluding Ramadan |


---

### 1.4 `calls_shortcode_comparison_dm.dta/.csv`

**Unit of observation:** District × month × transaction type (2013–2020)  

| Variable | Description |
|----------|-------------|
| `ym` | Year-month string |
| `distid` | District identifier |
| `variable_maghrib_dip_shortcode` | Transaction type indicator (0 = non-shortcode calls; 1 = shortcode calls) |
| `value` | Maghrib dip value for this district-month-type group |


---

### 1.5 `calls_shortcode_comparison_gm.dta/.csv`

**Unit of observation:** Grid cell × month × transaction type (2013–2020)  

| Variable | Description |
|----------|-------------|
| `variable_maghrib_dip_shortcode` | Transaction type indicator (0 = non-shortcode; 1 = shortcode) |
| `value` | Maghrib dip value |
| `gridid` | Grid cell string identifier |
| `ym` | Year-month string |

---

### 1.6 `dist_level.dta/.csv`

**Unit of observation:** District (time-averaged, for heterogeneity analysis)  

| Variable | Description |
|----------|-------------|
| `distid` | District identifier |
| `provid` | Province identifier |
| `provname` | Province name |
| `vpm_before_30min` | Average call volume in the 30 minutes before Maghrib |
| `vpm_after_30min` | Average call volume in the 30 minutes after Maghrib |
| `maghrib_dip` | Average Maghrib dip over sample period |
| `maghrib_dip_sc` | Average Maghrib dip (shortcode calls) |
| `maj_ethn` | Plurality language spoken in district (ethnicity proxy) |
| `maj_ethn_share` | Share of villages speaking the plurality language |
| `plur_pashto` | Indicator: plurality Pashto-speaking |
| `plur_hazara` | Indicator: plurality Hazaragi-speaking |
| `ethn_dari_ind` | Indicator: plurality Dari-speaking |
| `ethn_pashto_ind` | Indicator: plurality Pashto-speaking |
| `ethn_other_ind` | Indicator: plurality other language |
| `taliban_fg` | Indicator: district experienced Taliban control (PIX, 2015–2020) |

---

### 1.7 `grid_level.dta/.csv`

**Unit of observation:** Grid cell (time-averaged, for heterogeneity analysis)  

| Variable | Description |
|----------|-------------|
| `cell_id` | Grid cell identifier |
| `gridid` | Grid cell string identifier |
| `lng_str` | Longitude of cell center |
| `lat_str` | Latitude of cell center |
| `grid_provid` | Province ID |
| `vpm_before_30min` | Average call volume in 30 min before Maghrib |
| `vpm_after_30min` | Average call volume in 30 min after Maghrib |
| `vpm_diff_avg_denom` | Average Maghrib dip over sample period |
| `vpm_diff_avg_denom_zsc` | Z-score of Maghrib dip (standardized across districts) |
| `vpm_diff_avg_denom_sc` | Average Maghrib dip (shortcode calls) |
| `vpm_diff_before_denom` | Average Maghrib dip (before-denom scaling) |
| `vpm_diff_keepinf` | Average Maghrib dip (retaining infinite values) |
| `total_settlements` | Total number of settlements in the grid cell |
| `maj_ethn` | Plurality language in grid cell |
| `maj_ethn_share` | Share of villages speaking the plurality language |
| `n_pashto` | Number of Pashto-speaking villages in grid cell |
| `n_dari` | Number of Dari-speaking villages |
| `n_turkmen` | Number of Turkmen-speaking villages |
| `n_balochi` | Number of Balochi-speaking villages |
| `n_uzbek` | Number of Uzbek-speaking villages |
| `n_hazaragi` | Number of Hazaragi-speaking villages |
| `n_pashai` | Number of Pashai-speaking villages |
| `n_nuristani` | Number of Nuristani-speaking villages |
| `n_other` | Number of villages speaking other languages |
| `share_pashto` | Share of villages speaking Pashto |
| `share_dari` | Share of villages speaking Dari |
| `share_turkmen` | Share of villages speaking Turkmen |
| `share_balochi` | Share of villages speaking Balochi |
| `share_uzbek` | Share of villages speaking Uzbek |
| `share_hazaragi` | Share of villages speaking Hazaragi |
| `share_pashai` | Share of villages speaking Pashai |
| `share_nuristani` | Share of villages speaking Nuristani |
| `share_other` | Share of villages speaking other languages |
| `plur_pashto` | Indicator: plurality Pashto-speaking |
| `plur_hazara` | Indicator: plurality Hazaragi-speaking |


---

## 2. Data/tables_data/synthetic/ — Synthetic Placeholders **[SYNTHETIC]**

These files substitute for confidential data. All values are fabricated; estimates produced from them are meaningless.

---

### 2.1 `hash_grid_qtr_panel_synthetic.csv` **[SYNTHETIC]**

**Unit of observation:** Individual subscriber × quarter (fabricated; replaces 78M-observation CDR panel)  

| Variable | Description |
|----------|-------------|
| `phonehash` | Anonymized subscriber identifier (fabricated) |
| `gridID` | Grid cell identifier (fabricated) |
| `yearQtrID` | Quarter identifier (fabricated) |
| `yearQtr` | Quarter label (e.g., "2013Q2") |
| `vpm_diff_30min_avg_denom` | Individual-level Maghrib dip (fabricated) |
| `speipm12_g` | 12-month SPEI for subscriber's home grid cell (fabricated) |
| `medianInitRelig_avg_denom_to15` | Baseline religiosity of home grid (above/below median, 2013–2015, fabricated) |
| `tercileInitRelig_avg_denom_to15` | Tercile of baseline religiosity of home grid (2013–2015, fabricated) |

---

### 2.2 `smallsurvey_finalsample_synthetic.dta/.csv` **[SYNTHETIC]**

**Unit of observation:** Survey respondent (fabricated; replaces 1,092-respondent survey)  

| Variable | Description |
|----------|-------------|
| `uuid` | Respondent identifier (fabricated) |
| `distname` | District name |
| `vpm_diff_avg_denom` | Respondent's Maghrib dip computed from CDR (2015–2016, fabricated) |
| `mn_ix_imp_vimp_16` | Survey religiosity index (average of standardized components below, fabricated) |
| `q12_16_a_imp_vimp_zsc` | Standardized indicator: Fasting during Ramadan is "Very Important" or "Important" (fabricated) |
| `q12_16_b_imp_vimp_zsc` | Standardized indicator: Giving Zakat is "Very Important" or "Important" (fabricated) |
| `q12_16_c_imp_vimp_zsc` | Standardized indicator: Namaz 5 Times per Day is "Very Important" or "Important" (fabricated) |
| `q12_16_d_imp_vimp_zsc` | Standardized indicator: No Alcohol is "Very Important" or "Important" (fabricated) |
| `q12_16_e_imp_vimp_zsc` | Standardized indicator: No Music is "Very Important" or "Important" (fabricated) |
| `q12_16_f_imp_vimp_zsc` | Standardized indicator: Reading the Quran Daily is "Very Important" or "Important" (fabricated) |
| `age` | Respondent age in years (fabricated) |
| `hhmbr_male` | Number of male household members (fabricated) |
| `hhmbr_female` | Number of female household members (fabricated) |
| `hhmbr_kids` | Number of children in household (fabricated) |
| `hazara_ethn` | Indicator: respondent is Hazara (fabricated) |
| `pashtun_ethn` | Indicator: respondent is Pashtun (fabricated) |
| `rural` | Indicator: respondent lives in rural area (fabricated) |
| `readwrite` | Indicator: respondent can read and write (fabricated) |
| `agri_land` | Indicator: respondent owns agricultural land (fabricated) |

---

## 3. Data/raw_CDR/ — Synthetic Raw CDR Files **[SYNTHETIC]**

Four 5-observation fabricated files illustrating the column structure of the raw CDR inputs. All subscriber hashes and tower IDs are fabricated. These cannot be used to run the cleaning pipeline.

Each file has the same three columns:

| Variable | Description |
|----------|-------------|
| `phoneHash1` | Anonymized subscriber identifier (hashed; fabricated) |
| `datetime` | Timestamp of the transaction (fabricated) |
| `antenna_id` | ID of the cell tower that handled the transaction (fabricated) |

Files: `CDR_phone_call_raw_synthetic.csv`, `CDR_sms_raw_synthetic.csv`, `CDR_shortcode_raw_synthetic.csv`, `CDR_data_usage_raw_synthetic.csv`

---

## 4. Data/figures_data/ — Aggregated Data for Figures

---

### 4.1 `cdr_relativemins_data.csv`

**Used by:** Figure 1 (`Fig1.R`)  
**Description:** Average call volume by minute relative to Maghrib, aggregated over all days and grid cells.

| Variable | Description |
|----------|-------------|
| `rel_min` | Minute relative to Maghrib call time (e.g., −30 = 30 min before) |
| `call_vol_avg` | Average call volume at this relative minute |
| `ci_lower` | Lower bound of 95% confidence interval |
| `ci_upper` | Upper bound of 95% confidence interval |

---

### 4.2 `cdr_relativemins_day_1516_withsun.csv`

**Used by:** Figure 2 (`Fig2.R`)  
**Description:** Daily call volumes and solar times for the 2015–2016 period, used to produce the heatmap.

| Variable | Description |
|----------|-------------|
| `ncalls` | Number of calls at this minute on this date |
| `date` | Calendar date |
| `sunset_min` | Time of sunset in minutes since midnight |
| `sunrise_min` | Time of sunrise in minutes since midnight |
| `abs_min` | Absolute minute of day |

---

### 4.3 `cdr_shortcode_relativemins_data.csv`

**Used by:** Figure 3 (`Fig3.R`)  
**Description:** Average shortcode call volume by minute relative to Maghrib.

| Variable | Description |
|----------|-------------|
| `rel_min` | Minute relative to Maghrib |
| `vol_avg` | Average shortcode call volume |
| `ci_lower` | Lower bound of 95% confidence interval |
| `ci_upper` | Upper bound of 95% confidence interval |

---

### 4.4 `cdr_sms_relativemins_data.csv`

**Used by:** Figure 3 (`Fig3.R`)  
**Description:** Average SMS volume by minute relative to Maghrib.

| Variable | Description |
|----------|-------------|
| `rel_min` | Minute relative to Maghrib |
| `vol_avg` | Average SMS volume |
| `ci_lower` | Lower bound of 95% confidence interval |
| `ci_upper` | Upper bound of 95% confidence interval |

---

### 4.5 `cdr_data_relativemins_data.csv`

**Used by:** Figure 3 (`Fig3.R`)  
**Description:** Average mobile data usage volume by minute relative to Maghrib.

| Variable | Description |
|----------|-------------|
| `rel_min` | Minute relative to Maghrib |
| `vol_avg` | Average data usage volume |
| `ci_lower` | Lower bound of 95% confidence interval |
| `ci_upper` | Upper bound of 95% confidence interval |

---

### 4.6 `cdr_ethnicity_distlevel.csv`

**Used by:** Figure 4 (`Fig4.R`)  
**Description:** District-level Maghrib dip and ethnicity, used for the religiosity map.

| Variable | Description |
|----------|-------------|
| `distid` | District identifier |
| `maj_ethn` | Plurality language in district (ethnicity proxy) |
| `vpm_diff_30m` | Average Maghrib dip  |
| `vpm_diff_30m_zscore` | Z-score of Maghrib dip |

---

### 4.7 `n_users_combined.csv`

**Used by:** Figure A3 (`FigA3.R`)  
**Description:** Monthly count of active subscribers by interaction type.

| Variable | Description |
|----------|-------------|
| `phonehash` | Count of unique active subscribers in this month |
| `ym` | Year-month (numeric format, e.g., "2013-4") |
| `data_type` | Interaction type ("Calls", "SMS", "Data") |
| `ym2` | Year-month formatted string (e.g., "2013-04") |

---

### 4.8 `sigacts_afghanistan.csv`

**Used by:** Figure A5 (`FigA5.R`)  
**Description:** ISAF SIGACTS incident records for Afghanistan (2013–2014).

| Variable | Description |
|----------|-------------|
| `time` | Timestamp of the incident  |
| `event_type` | Broad event category  |
| `event_category` | Subcategory  |
| `lat` | Latitude of incident  |
| `lon` | Longitude of incident  |

---

### 4.9 `SIGACTS_event_classifications.csv`

**Used by:** Figure A5 (`FigA5.R`)  
**Description:** Crosswalk mapping SIGACTS event types to the four classification categories used in the paper.

| Variable | Description |
|----------|-------------|
| `event_type` | Broad SIGACTS event type |
| `sub_event_type` | SIGACTS sub-event type |
| `classification` | Paper classification code (1 = insurgent violence, 2 = other insurgent activity, 3 = state-led violence, 4 = other state-led activity) |
| `friendly` | Indicator: event involves friendly (ISAF/Afghan) forces (1) vs. enemy (0) |

---

### 4.10 `survey_relig_aggregated_counts.csv`

**Used by:** Figure A4 (`FigA4.R`)  
**Description:** Aggregated response counts for the six religiosity survey questions.

| Variable | Description |
|----------|-------------|
| `section` | Survey section identifier |
| `question` | Survey question label (e.g., "Reading Quran Daily") |
| `category` | Response category (e.g., "important", "unimportant") |
| `value` | Count of respondents choosing this category |
| `category_order` | Sort order for categories (1–5) |
| `category_name` | Display name for category (e.g., "Important") |
| `share` | Percentage share of respondents in this category |

---

### 4.11 `spei_cellym.dta/.csv`

**Used by:** Figure A6 (`FigA6.R`)  
**Description:** Monthly SPEI at the grid-cell level over the full sample period (2013–2020).

| Variable | Description |
|----------|-------------|
| `x` | Longitude of grid cell center |
| `y` | Latitude of grid cell center |
| `ym` | Year-month string (e.g., "Apr 2013") |
| `year` | Calendar year |
| `speipm12_g` | 12-month SPEI at this grid cell-month |


---

## 5. Data/figures_data/synthetic/ — Synthetic Antenna File **[SYNTHETIC]**

### 5.1 `cell_lookup_antenna_synthetic.csv` **[SYNTHETIC]**

**Used by:** Figure A2 (`FigA2.R`)  
**Description:** Five fabricated cell tower locations substituting for the confidential antenna geolocation file. Output map is a meaningless placeholder.

| Variable | Description |
|----------|-------------|
| `antennaId` | Cell tower identifier (fabricated) |
| `siteCode` | Site code string (fabricated) |
| `longitude` | Tower longitude (fabricated) |
| `latitude` | Tower latitude (fabricated) |
| `province` | Province name  |
| `province_id` | Province identifier (fabricated) |
| `district` | District name  |
| `district_id` | District identifier (fabricated) |

