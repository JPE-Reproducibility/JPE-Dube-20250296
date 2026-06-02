## Appendix: Detailed PII Detection Results

*Generated on 2026-06-02 13:56:27*

This appendix lists all detected instances of potential personally identifiable information (PII) in the project files. Each entry shows the matched PII terms and, for data files, sample values to help verify whether the flagged content is indeed sensitive.

### Data Files

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
- Line 75: lat
  ```
  * Latex Options
  ```
- Line 87: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 88: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 95: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 96: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 106: loc
  ```
  local ndist = r(N)
  ```
- Line 108: loc
  ```
  local nmon  = r(N)
  ```
- Line 110: district
  ```
  estadd scalar N_districts = `ndist'
  ```
- Line 147: district
  ```
  stats(N ymean N_districts N_months districtFE monthFE, ///
  ```
- Line 149: district
  ```
  labels("Observations" "Mean of Dependent Variable" "Number of Districts" "Number of Months" "Distric
  ```
- Line 176: loc
  ```
  local landcontrols12 "c.speipm12_g#c.other"
  ```
- Line 184: loc
  ```
  estadd local landtypectrls "Y"
  ```
- Line 189: loc
  ```
  local spring_landcontrols12 "c.spring_spei12#c.other"
  ```
- Line 192: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 193: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 197: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 198: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 199: loc
  ```
  estadd local landtypectrls "Y"
  ```
- Line 202: lat
  ```
  * latex table
  ```
- Line 215: son
  ```
  spring_spei12 "Growing Season SPEI" ///
  ```
- Line 216: son
  ```
  c.spring_spei12#c.rainfed   "Growing Season SPEI x Rainfed Cropland" ///
  ```
- Line 217: son
  ```
  c.spring_spei12#c.irrig_all "Growing Season SPEI x Irrigated Cropland" ///
  ```
- Line 218: son
  ```
  c.spring_spei12#c.rangeland "Growing Season SPEI x Rangeland") ///
  ```
- Line 229: son
  ```
  * Table 3 - Climate and Religious Adherence by Agricultural Season
  ```
- Line 238: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 239: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 242: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 243: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 244: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 247: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 248: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 249: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 253: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 254: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 255: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 258: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 259: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 260: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 261: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 264: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 265: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 266: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 267: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 271: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 272: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 273: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 274: loc
  ```
  estadd local dropRAM "Y"
  ```
- Line 277: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 278: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 279: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 280: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 281: loc
  ```
  estadd local dropRAM "Y"
  ```
- Line 284: loc
  ```
  estadd local gridFE "Y"
  ```
- Line 285: loc
  ```
  estadd local yearFE "Y"
  ```
- Line 286: loc
  ```
  estadd local cntrlownSPEI "Y"
  ```
- Line 287: loc
  ```
  estadd local MDprev "Y"
  ```
- Line 288: loc
  ```
  estadd local dropRAM "Y"
  ```
- Line 295: son
  ```
  "Control for own season SPEI" "Control for Prev. Maghrib Dip" "Dropping Ramadan days")) ///
  ```
- Line 298: son
  ```
  varlabels(spring_spei12 "Growing Season SPEI") ///
  ```
- Line 299: son
  ```
  mtitles("\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Sea
  ```
- Line 300: son
  ```
  "\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Season}" //
  ```
- Line 301: son
  ```
  "\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Season}") /
  ```
- Line 305: son
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "Each column is a regression of the Maghrib dip du
  ```
- Line 318: son
  ```
  use "${datadir}/calls_shortcode_comparison_gm", clear
  ```
- Line 325: son
  ```
  use "${datadir}/calls_shortcode_comparison_dm", clear
  ```
- Line 330: loc
  ```
  estadd local distFE "Y"
  ```
- Line 331: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 335: district
  ```
  stats(N mean_value gridFE monthFE distFE, fmt(%9.0f %9.3f %9.0f %9.0f %9.0f) labels("Observations" "
  ```
- Line 338: district
  ```
  mgroups("Grid Cell" "District", pattern(0 1 1) ///
  ```
- Line 343: district
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "This table examines if the measured Maghrib dip d
  ```
- Line 362: loc
  ```
  local control_just_hazara hazara_ethn
  ```
- Line 363: loc
  ```
  local controls age hhmbr_male hhmbr_female hhmbr_kids hazara_ethn
  ```
- Line 365: name
  ```
  eststo A1: reghdfe vpm_diff_avg_denom mn_ix_imp_vimp_16, absorb(distname) vce(robust)
  ```
- Line 367: loc
  ```
  estadd local distFE "Y"
  ```
- Line 369: name
  ```
  eststo B1: reghdfe vpm_diff_avg_denom q12_16_e_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 371: loc
  ```
  estadd local distFE "Y"
  ```
- Line 373: name
  ```
  eststo C1: reghdfe vpm_diff_avg_denom q12_16_a_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 375: loc
  ```
  estadd local distFE "Y"
  ```
- Line 377: name
  ```
  eststo D1: reghdfe vpm_diff_avg_denom q12_16_d_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 379: loc
  ```
  estadd local distFE "Y"
  ```
- Line 381: name
  ```
  eststo E1: reghdfe vpm_diff_avg_denom q12_16_f_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 383: loc
  ```
  estadd local distFE "Y"
  ```
- Line 385: name
  ```
  eststo F1: reghdfe vpm_diff_avg_denom q12_16_b_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 387: loc
  ```
  estadd local distFE "Y"
  ```
- Line 389: name
  ```
  eststo G1: reghdfe vpm_diff_avg_denom q12_16_c_imp_vimp_zsc, absorb(distname) vce(robust)
  ```
- Line 391: loc
  ```
  estadd local distFE "Y"
  ```
- Line 393: name
  ```
  eststo A2: reghdfe vpm_diff_avg_denom mn_ix_imp_vimp_16 `controls', absorb(distname) vce(robust)
  ```
- Line 395: loc
  ```
  estadd local distFE "Y"
  ```
- Line 396: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 398: name
  ```
  eststo B2: reghdfe vpm_diff_avg_denom q12_16_e_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 400: loc
  ```
  estadd local distFE "Y"
  ```
- Line 401: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 403: name
  ```
  eststo C2: reghdfe vpm_diff_avg_denom q12_16_a_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 405: loc
  ```
  estadd local distFE "Y"
  ```
- Line 406: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 408: name
  ```
  eststo D2: reghdfe vpm_diff_avg_denom q12_16_d_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 410: loc
  ```
  estadd local distFE "Y"
  ```
- Line 411: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 413: name
  ```
  eststo E2: reghdfe vpm_diff_avg_denom q12_16_f_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 415: loc
  ```
  estadd local distFE "Y"
  ```
- Line 416: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 418: name
  ```
  eststo F2: reghdfe vpm_diff_avg_denom q12_16_b_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 419: loc
  ```
  estadd local distFE "Y"
  ```
- Line 420: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 422: name
  ```
  eststo G2: reghdfe vpm_diff_avg_denom q12_16_c_imp_vimp_zsc `controls', absorb(distname) vce(robust)
  ```
- Line 424: loc
  ```
  estadd local distFE "Y"
  ```
- Line 425: loc
  ```
  estadd local demoControls "Y"
  ```
- Line 428: loc, name
  ```
  local relig_table_name TabA2
  ```
- Line 476: district
  ```
  labels("Observations" "Mean of Dependent Variable" "District Fixed Effects" "Demographic Controls"))
  ```
- Line 500: name
  ```
  eststo M9: reghdfe vpm_diff_avg_denom age readwrite rural agri_land pashtun_ethn hazara_ethn, absorb
  ```
- Line 502: loc
  ```
  estadd local distFE "Y"
  ```
- Line 503: loc
  ```
  estadd local hazara "Y"
  ```
- Line 512: city, district
  ```
  scalars("N Observations" "ymean Mean of Dependent Variable" "distFE District Fixed Effects" "hazara 
  ```
- Line 529: city
  ```
  * Appendix Table A4: Ethnicity and the Maghrib Dip
  ```
- Line 536: loc
  ```
  estadd local provFE "Y"
  ```
- Line 537: loc
  ```
  estadd local hazaraFE "Y"
  ```
- Line 540: loc
  ```
  estadd local provFE "Y"
  ```
- Line 541: loc
  ```
  estadd local hazaraFE "Y"
  ```
- Line 547: loc
  ```
  estadd local provFE "Y"
  ```
- Line 548: loc
  ```
  estadd local hazaraFE "Y"
  ```
- Line 552: loc
  ```
  estadd local provFE "Y"
  ```
- Line 553: loc
  ```
  estadd local hazaraFE "Y"
  ```
- Line 560: district
  ```
  mgroups("District" "Grid Cell" "District" "Grid Cell", pattern(1 1 1 1) ///
  ```
- Line 581: loc
  ```
  local landtype_cellmonth rainfed irrig_all rangeland other builtup
  ```
- Line 582: loc
  ```
  local cellyr_vars logdifevi spring_spei12 spring_vpm harvest_vpm postharvest_vpm
  ```
- Line 585: district
  ```
  * -----------------     	  District month variables        ----------------- *
  ```
- Line 627: lat
  ```
  *** Latex Table
  ```
- Line 639: district
  ```
  refcat(maghrib_dip "\textbf{A. Variables at District-Month level}", nolabel) ///
  ```
- Line 653: son
  ```
  spring_spei12 "\hspace{2mm} Growing Season SPEI" ///
  ```
- Line 654: son
  ```
  spring_vpm "\hspace{2mm} Maghrib Dip in Growing Season" ///
  ```
- Line 655: son
  ```
  harvest_vpm "\hspace{2mm} Maghrib Dip in Harvest Season" ///
  ```
- Line 656: son
  ```
  postharvest_vpm "\hspace{2mm} Maghrib Dip in Post-harvest Season") ///
  ```
- Line 681: loc
  ```
  local main_individual mn_ix_imp_vimp_16 q12_16_e_imp_vimp q12_16_a_imp_vimp q12_16_d_imp_vimp ///
  ```
- Line 684: loc
  ```
  local addn_cellmonth vpm_diff_avg_denom_shortcode vpm_diff_avg_denom25 vpm_diff_avg_denom35 vpm_diff
  ```
- Line 687: district
  ```
  * District-Year Level - Poppy and ethn
  ```
- Line 688: loc
  ```
  local distyrlevel_vars opium_cult_ihs opium_interp_ihs
  ```
- Line 691: loc
  ```
  local conflict_vars cell_uppsala_0312 cell_uppsala_0320
  ```
- Line 698: loc
  ```
  local other_individual age rural readwrite agri_land pashtun_ethn
  ```
- Line 702: district
  ```
  * -----------------	            District Month       ------------------ *
  ```
- Line 720: city, district
  ```
  * -----------------     	  District Level - Ethnicity       ----------------- *
  ```
- Line 728: district
  ```
  * -----------------     	  District year Level - Poppy        ----------------- *
  ```
- Line 738: loc
  ```
  local distyrlevel_vars opium_cult_ihs opium_interp_ihs
  ```
- Line 739: district
  ```
  collapse (mean) `distyrlevel_vars', by(district year)
  ```
- Line 744: lat
  ```
  * -----------------     	  Latex Table        ----------------- *
  ```
- Line 747: lat
  ```
  *** Latex Table
  ```
- Line 782: loc, location
  ```
  maghrib_dip_nodiffhome3mo "\hspace{2mm} Maghrib Dip (Constant Home Location)" ///
  ```
- Line 792: district
  ```
  refcat(maghrib_dip_shortcode "\textbf{B. Variables at District-Month Level}", nolabel) ///
  ```
- Line 814: district
  ```
  taliban_fg "\hspace{2mm} District Experienced Any Taliban Control between 2015-2020 (PiX)") ///
  ```
- Line 815: district
  ```
  refcat(ethn_pashto_ind "\textbf{D. Variables at District Level}", nolabel) ///
  ```
- Line 821: phone
  ```
  * individual-quater level mobile phone data that cannot be publicly released
  ```
- Line 833: lat
  ```
  opium_interp_ihs "\hspace{2mm} Interpolated Poppy - IHS") ///
  ```
- Line 834: district
  ```
  refcat(opium_cult_ihs "\textbf{F. Variables at District-Year Level}", nolabel) ///
  ```
- Line 841: address
  ```
  * Appendix Table A7: Addressing Accounts of how Violence affects
  ```
- Line 847: loc
  ```
  local otherSIGACTSEvents num_other_insurg num_state_viol num_other_state
  ```
- Line 850: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 851: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 852: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 855: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 856: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 857: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 861: district
  ```
  stats(N districtFE monthFE controlsSIGACTS, fmt(%9.0f) ///
  ```
- Line 862: district
  ```
  labels("Observations" "District Fixed Effects" "Month Fixed Effects" "Controls for Other Insurgent A
  ```
- Line 889: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 890: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 891: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 892: loc
  ```
  estadd local space " "
  ```
- Line 895: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 896: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 897: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 898: loc
  ```
  estadd local space " "
  ```
- Line 901: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 902: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 903: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 904: loc
  ```
  estadd local space " "
  ```
- Line 907: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 908: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 909: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 910: loc
  ```
  estadd local space " "
  ```
- Line 913: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 914: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 915: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 916: loc
  ```
  estadd local space " "
  ```
- Line 920: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 921: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 922: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 923: loc
  ```
  estadd local space " "
  ```
- Line 926: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 927: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 928: loc
  ```
  estadd local callvolcntrl "Y"
  ```
- Line 929: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 930: loc
  ```
  estadd local space " "
  ```
- Line 934: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 935: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 936: loc
  ```
  estadd local callvolcntrl "Y"
  ```
- Line 937: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 942: district
  ```
  stats(N districtFE monthFE controlsSIGACTS space, fmt(%9.0f) labels("Observations" "District Fixed E
  ```
- Line 971: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 972: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 973: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 974: loc
  ```
  estadd local space " "
  ```
- Line 978: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 979: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 980: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 981: loc
  ```
  estadd local space " "
  ```
- Line 985: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 986: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 987: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 988: loc
  ```
  estadd local space " "
  ```
- Line 991: district, loc
  ```
  estadd local districtFE "Y"
  ```
- Line 992: loc
  ```
  estadd local monthFE "Y"
  ```
- Line 993: loc
  ```
  estadd local controlsSIGACTS "Y"
  ```
- Line 994: loc
  ```
  estadd local space " "
  ```
- Line 998: district
  ```
  stats(N districtFE monthFE controlsSIGACTS space, fmt(%9.0f) ///
  ```
- Line 999: district
  ```
  labels("Observations" "District Fixed Effects" "Month Fixed Effects" "Controls for Other Insurgent" 
  ```
- Line 1005: district
  ```
  mgroups("\shortstack{Non-Ramadan\\Days}" "\shortstack{Non-Hazara\\Districts}" ///
  ```
- Line 1030: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1034: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1038: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1042: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1046: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1048: district
  ```
  eststo A8: reghdfe vpm_diff_avg_denom speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(
  ```
- Line 1050: district, loc
  ```
  estadd local clusteredOn "District"
  ```
- Line 1054: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1058: loc
  ```
  estadd local clusteredOn "Grid Cell"
  ```
- Line 1061: lat
  ```
  * latex table
  ```
- Line 1076: district, minute
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), the Maghrib dip is constructed by 
  ```
- Line 1124: district
  ```
  mgroups("\shortstack{Non-Hazara\\Districts}" "\shortstack{Non-Ramadan\\Days}" ///
  ```
- Line 1127: district
  ```
  "\shortstack{Non-Urban\\Areas}" "\shortstack{Non-Taliban\\Districts}", ///
  ```
- Line 1131: district, phone, village
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), we drop grids in which at least 5\
  ```
- Line 1139: address
  ```
  * Table A12: Climate and Religious Adherence: Addressing Alternate Accounts
  ```
- Line 1185: phone
  ```
  * level mobile phone data that cannot be publicly released due to privacy constraints.
  ```
- Line 1200: district
  ```
  eststo A1: reghdfe opium_cult_ihs speipm12_g if main_sample == 1 & cell_cdr == 1, absorb(trendval ce
  ```
- Line 1203: district
  ```
  eststo A2: reghdfe opium_interp_ihs speipm12_g if main_sample == 1 & cell_cdr == 1, absorb(trendval 
  ```
- Line 1206: district
  ```
  eststo A3: reghdfe vpm_diff_avg_denom speipm12_g opium_cult_wmiss_ihs opium_cult_miss_ind if cell_cd
  ```
- Line 1208: loc
  ```
  estadd local poppyctrl "Y"
  ```
- Line 1210: district
  ```
  eststo A4: reghdfe vpm_diff_avg_denom speipm12_g opium_interp_wmiss_ihs opium_interp_miss_ind if cel
  ```
- Line 1212: loc
  ```
  estadd local poppyintctrl "Y"
  ```
- Line 1214: lat
  ```
  * latex table
  ```
- Line 1222: lat
  ```
  mgroups("IHS(Poppy)" "IHS(Interpolated Poppy)" "Maghrib Dip" "Maghrib Dip", pattern(1 1 1 0) ///
  ```
- Line 1225: district, lat
  ```
  \vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), the dependent variable is the IHS 
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
- Line 30: name
  ```
  rootdir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 34: lat
  ```
  'data' = file.path(rootdir, 'Data/figures_data/cdr_relativemins_day_1516_withsun.csv'),
  ```
- Line 39: minute
  ```
  # Function to Convert minutes to HHMM
  ```
- Line 104: minute
  ```
  fill = "Total Calls per Minute") +
  ```
- Line 108: coord
  ```
  coord_cartesian(ylim = c(60, 1400), xlim = c(as.Date('2015-01-01'), as.Date('2016-12-31')), clip = "
  ```
- Line 232: minute
  ```
  fill = "Total Calls per Minute") +
  ```
- Line 236: coord
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
- Line 150: district, name
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
- Line 80: district
  ```
  geom_sf(data = geodf_districts, fill = NA, colour = 'gray80', size = 0.2) +
  ```
- Line 84: name
  ```
  ggsave(filename = file.path(maindir, 'Output/Figures/FigA2_cell_towers_in_afg.pdf'),
  ```

**/replication-package/replication package/Code/Analysis/FigA3.R**

- Line 18: lat, loc, location
  ```
  #        automatically relative to this script's location via this.path.
  ```
- Line 35: name
  ```
  maindir <- dirname(dirname(this.path::this.dir()))
  ```
- Line 54: name
  ```
  users_by_month = rename(users_by_month, Date = date)
  ```
- Line 60: phone
  ```
  users_bymonth_plot = ggplot(data=users_by_month %>% filter(data_type != 'Shortcode'), aes(x=Date, y=
  ```
- Line 68: name
  ```
  scale_colour_manual(name = "Interactions",
  ```
- Line 71: name
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
- Line 185: district
  ```
  geom_sf(data = districts, fill = NA, color = "black", size = 0.02) +
  ```
- Line 191: name
  ```
  name = NULL,
  ```
- Line 220: name
  ```
  filename = file_name,
  ```
- Line 226: name
  ```
  message("Saved heatmap for ", vt, " as ", file_names[i])
  ```
- Line 229: lon
  ```
  # ---------- STEP 3: extract and save standalone legend ----------
  ```
- Line 232: name
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
- Line 51: lat
  ```
  * Latex Options
  ```
- Line 65: name
  ```
  rename (faolc_irrig_intense faolc_irrig_all faolc_rainfed faolc_7) (irrig_intns irrig_all rainfed ra
  ```
- Line 66: name
  ```
  rename faolc_3b irrig_marginal
  ```
- Line 164: district
  ```
  * -----  District-month Violence and Relig: Table 1, Table A7, A8, A9   ----- *
  ```
- Line 205: name
  ```
  rename (nhash nhash_robust) (numhashes numhashes_rbst)
  ```
- Line 217: name
  ```
  rename (numhashes_qtile vol_qtile) (numhashes_qtile_pre2015 vol_qtile_pre2015)
  ```
- Line 222: district
  ```
  **** Hazara Districts for Table A9 Column (2)
  ```
- Line 224: city
  ```
  //use "${maindir}/Code/Ethnicity/crossSectionData/cdr_dist_ethnicity", clear
  ```
- Line 239: name
  ```
  rename maghrib_dip maghrib_dip_noram
  ```
- Line 250: name
  ```
  rename num_deadly_enemy         num_insurg_viol
  ```
- Line 251: name
  ```
  rename num_deadly_friendly      num_state_viol
  ```
- Line 252: name
  ```
  rename num_other_enemy          num_other_insurg
  ```
- Line 253: name
  ```
  rename num_other_friendly       num_other_state
  ```
- Line 254: name
  ```
  rename num_deadly_enemy_lead1   num_insurg_viol_lead1
  ```
- Line 255: name
  ```
  rename num_deadly_enemy_lead2   num_insurg_viol_lead2
  ```
- Line 256: name
  ```
  rename num_deadly_enemy_lag1    num_insurg_viol_lag1
  ```
- Line 257: name
  ```
  rename num_deadly_enemy_lag2    num_insurg_viol_lag2
  ```
- Line 293: name
  ```
  * Rename 30 min Variables
  ```
- Line 294: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 301: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom_shortcode
  ```
- Line 302: lat
  ```
  keep year_num month_num lng_str lat_str vpm_diff_avg_denom_shortcode
  ```
- Line 307: phone
  ```
  **** Phone Call:
  ```
- Line 329: name
  ```
  * Rename 30 min Variables
  ```
- Line 330: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 337: phone
  ```
  save `temp_main_panel', replace    // phone call + shortcode
  ```
- Line 350: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 353: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 357: name
  ```
  rename vpm_diff_avg_denom30 vpm_diff_avg_denom_noramadan
  ```
- Line 359: lat
  ```
  keep lng_str lat_str year_num month_num  vpm_diff_avg_denom_noramadan
  ```
- Line 369: district
  ```
  collapse (max) taliban_fg, by(district)
  ```
- Line 370: district, name
  ```
  rename district distid
  ```
- Line 381: name
  ```
  rename (nhash nhash_robust) (numhashes numhashes_rbst)
  ```
- Line 392: name
  ```
  rename (numhashes_qtile vol_qtile) (numhashes_qtile_allyears vol_qtile_allyears)
  ```
- Line 433: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 436: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 451: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 454: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom_continu
  ```
- Line 468: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 471: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 475: loc
  ```
  tempfile temp_nodiffhomeloc
  ```
- Line 476: loc
  ```
  save `temp_nodiffhomeloc', replace
  ```
- Line 486: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 489: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom_nonmove
  ```
- Line 506: district
  ```
  keep cell_id x y district year ym year_str month_num trendval cell_cdr speipm12_g   ///
  ```
- Line 518: district
  ```
  order cell_id x y district year ym year_str month_num trendval cell_cdr speipm12_g   ///
  ```
- Line 549: name
  ```
  rename (vpm_after_30min_yr vpm_before_30min_yr) (vpm_after_30min vpm_before_30min)
  ```
- Line 569: son
  ```
  * Spring (Growing Season SPEI)
  ```
- Line 573: name
  ```
  rename speipm5_r5 spring_spei_rect
  ```
- Line 578: name
  ```
  * Rename 30 min Variables
  ```
- Line 579: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 589: name
  ```
  rename year_num year
  ```
- Line 611: name
  ```
  rename spring_vpm spring_vpm_noram
  ```
- Line 612: name
  ```
  rename harvest_vpm harvest_vpm_noram
  ```
- Line 613: name
  ```
  rename postharvest_vpm postharvest_vpm_noram
  ```
- Line 614: name
  ```
  rename spring_vpm_prev12 spring_vpm_prev12_noram
  ```
- Line 615: name
  ```
  rename harvest_vpm_prev12 harvest_vpm_prev12_noram
  ```
- Line 616: name
  ```
  rename postharvest_vpm_prev12 postharvest_vpm_prev12_noram
  ```
- Line 617: name
  ```
  rename reg_sample reg_sample3
  ```
- Line 645: district, phone
  ```
  * District-month (phone call + shortcode stacked vertically): Table A1
  ```
- Line 665: name
  ```
  rename maghrib_dip maghrib_dip0
  ```
- Line 666: name
  ```
  rename maghrib_dip_shortcode maghrib_dip1
  ```
- Line 667: lon
  ```
  reshape long maghrib_dip, i(ym distid) j(type)
  ```
- Line 674: name
  ```
  rename maghrib_dip value
  ```
- Line 677: son
  ```
  save "${outputdir}/calls_shortcode_comparison_dm.dta", replace
  ```
- Line 679: son
  ```
  *use "${datadir}/CDR/transaction_type/calls_transaction_dip_comparison_panel_dm", clear  // 42108 (2
  ```
- Line 684: phone
  ```
  * Gridcell-month (phone call + shortcode stacked vertically): Table A1
  ```
- Line 690: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom0
  ```
- Line 691: name
  ```
  rename vpm_diff_avg_denom_shortcode vpm_diff_avg_denom1
  ```
- Line 692: lon
  ```
  reshape long vpm_diff_avg_denom, i(cell_id trendval) j(type)
  ```
- Line 703: name
  ```
  rename vpm_diff_avg_denom value
  ```
- Line 706: son
  ```
  save "${outputdir}/calls_shortcode_comparison_gm.dta", replace
  ```
- Line 708: son
  ```
  * use "${datadir}/CDR/transaction_type/calls_transaction_dip_comparison_panel_gm", clear // 74954
  ```
- Line 713: district
  ```
  *---- District level and gridcell level: Table A4 ----
  ```
- Line 724: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 742: name
  ```
  rename (year month) (year_num month_num)
  ```
- Line 754: city
  ```
  *** Ethnicity Data
  ```
- Line 758: lat, name
  ```
  rename (gridid1 gridid2) (lng_str lat_str)
  ```
- Line 765: name
  ```
  keep distid provid provname maj_ethn maj_ethn_share
  ```
- Line 767: district
  ```
  tempfile temp_districtethn
  ```
- Line 768: district
  ```
  save `temp_districtethn'
  ```
- Line 775: lat
  ```
  collapse vpm_before_30min vpm_after_30min cell_uppsala_0312 cell_uppsala_0320, by(cell_id lng_str la
  ```
- Line 778: name
  ```
  * Rename 30 min Variables
  ```
- Line 779: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 786: city
  ```
  * add ethnicity
  ```
- Line 807: lat
  ```
  collapse vpm_before_30min vpm_after_30min cell_uppsala_0312 cell_uppsala_0320, by(cell_id lng_str la
  ```
- Line 810: name
  ```
  * Rename 30 min Variables
  ```
- Line 811: name
  ```
  rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
  ```
- Line 814: city
  ```
  * add ethnicity
  ```
- Line 842: city
  ```
  * add ethnicity
  ```
- Line 870: city
  ```
  * add ethnicity
  ```
- Line 901: district
  ```
  tempfile temp_ethn_district
  ```
- Line 902: district
  ```
  save `temp_ethn_district', replace  // merge this just for sum stats
  ```
- Line 906: name
  ```
  rename maghrib_dip maghrib_dip_sc
  ```
- Line 919: name
  ```
  rename vpm_diff_avg_denom vpm_diff_avg_denom_sc
  ```

