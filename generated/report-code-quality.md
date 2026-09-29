## Code Quality

### Python

[ADVISORY] `.query(` or `.loc[` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (02_gen_tower_maghrib_and_sunset_time.py, line 55)
  → lat = df_towers.loc[df_towers['clust_100m'] == clust]['latitude'].iloc[0]

[ADVISORY] `.query(` or `.loc[` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (02_gen_tower_maghrib_and_sunset_time.py, line 56)
  → lon = df_towers.loc[df_towers['clust_100m'] == clust]['longitude'].iloc[0]

[ADVISORY] `pd.merge()` or `.merge()` called without explicit `how=` argument — defaults to inner join, which may silently drop rows. (02_gen_tower_maghrib_and_sunset_time.py, line 107)
  → df_tower_day = pd.merge(df_tower_day, df_days, on = 'mergeID')

[ADVISORY] `pd.merge()` or `.merge()` called without explicit `how=` argument — defaults to inner join, which may silently drop rows. (02_gen_tower_maghrib_and_sunset_time.py, line 153)
  → df_towerday_output = pd.merge(df_tower_day_prayertime, df_tower_day_sunsettime, on = ['clust_100m','date'])

### R

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (Fig1.R, line 164)
  → filter(rel_min >= -140, rel_min <= 140)

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (Fig2.R, line 132)
  → filter(date %in% filter_zoomedfig) %>%

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (Fig3.R, line 93)
  → filter(rel_min >= -140, rel_min <= 140)

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (Fig4.R, line 73)
  → filter(!is.na(vpm_diff_30m_zscore)) |>

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (Fig4.R, line 82)
  → filter(maj_ethn == "pashto") |>

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (FigA4.R, line 48)
  → filter(question == x)

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (FigA5.R, line 96)
  → filter(!is.na(DISTID)) %>%

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (FigA5.R, line 101)
  → filter(loc_within_25km == 1) %>%

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (FigA6.R, line 83)
  → filter(year == 2018) |>

[ADVISORY] `filter(` call not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (FigA6.R, line 107)
  → filter(spei_variable %in% c('speipm12_g', 'speipm12_g_2018'))

### Stata

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (All_Tables.do, line 737)
  → keep if main_sample == 1

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (11_03_250108_update_master_cdr.do, line 97)
  → keep if sample == "wo_outages_tomidnight_w_ramadan"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (12_240213_gen_widewheat_panel.do, line 94)
  → keep if provid < 35 //34 provinces, #35 is "total"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 173)
  → keep if sample == "wo_outages_tomidnight_w_ramadan"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 205)
  → keep if sample == "wo_outages_tomidnight_w_ramadan"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 231)
  → drop if distid == .

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 241)
  → keep if sample == "wo_outages_tomidnight_wo_ramadan"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 349)
  → keep if sample == "wo_outages_tomidnight_wo_ramadan"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 506)
  → keep if sample == "wo_outages_tomidnight_w_ramadan"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 551)
  → keep if cell_cdr == 1

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 629)
  → keep if _merge == 3

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 653)
  → keep if sample == "wo_outages_tomidnight_w_ramadan"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 661)
  → keep if sample == "wo_outages_tomidnight_w_ramadan"

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 672)
  → drop if maghrib_dip == .

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 675)
  → drop if n_in_group == 1      // 41986

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 700)
  → drop if n_in_group == 1

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 801)
  → keep if !missing(vpm_diff_avg_denom)

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 896)
  → drop if maj_ethn == ""

[ADVISORY] Sample drop (`drop if` / `keep if`) not preceded by a comment within 2 lines — consider adding a comment explaining the criterion. (13_precleaning_alltables.do, line 921)
  → keep if !missing(vpm_diff_avg_denom)

