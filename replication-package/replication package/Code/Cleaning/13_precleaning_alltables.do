/*===============================================================================
  13_precleaning_alltables.do

  PURPOSE
  -------
  Final preprocessing step before All_Tables.do. Reads all data
  sources and produces analysis-ready datasets, one per analytical unit
  and table group. All_Tables.do loads these directly without any further
  data manipulation.

  OUTPUTS 
  -------
  cdr_and_conflict_dm.dta       District-month: CDR + ISAF violence
                                    → Tables 1, A7, A8, A9
  cdr_and_climate_gm.dta        Grid-cell-month: CDR + Gaussian SPEI + controls
                                    → Table 2 cols (1)(2), Tables A10, A11, A12, A14
  cdr_and_climate_gy.dta        Grid-cell-year: CDR seasonal + EVI + seasonal SPEI
                                    → Table 2 cols (3)(4), Table 3
  calls_shortcode_comparison_dm.dta  District-month stacked: phone vs. shortcode CDR
                                    → Table A1 (district panel)
  calls_shortcode_comparison_gm.dta  Grid-month stacked: phone vs. shortcode CDR
                                    → Table A1 (grid panel)
  dist_level.dta                District cross-section: time-averaged Maghrib dip + ethnicity
                                    → Table A4 (district level)
  grid_level.dta                Grid cross-section: time-averaged Maghrib dip + ethnicity
                                    → Table A4 (grid level)

  SOFTWARE: Stata; packages: winsor2, egenmore, reghdfe, estout
===============================================================================*/

clear all
set more off
pause off
set matsize 11000
cap log close 

global maindir "~/Dube_UC Dropbox/Fengzhe Liu/Afghanistan Climate Conflict"
cd "$maindir"
global datadir "${maindir}/Data"


* Output Directory
global outputdir "Data/Panels/_final_cleaned/replication_data"


* ===================================================================== *
* -----------------     	  	 Programs             ----------------- *
* ===================================================================== *


* Latex Options
program define x100
	syntax, variables(varlist)

	foreach v of varlist `variables'{
		replace `v' = 100*`v'
	}	
end

program define timeseries
	xtset cell_id trendval
end

program define interactions
	rename (faolc_irrig_intense faolc_irrig_all faolc_rainfed faolc_7) (irrig_intns irrig_all rainfed rangeland)
	rename faolc_3b irrig_marginal
	
	* orchards and vineyards
	gen fruit = faolc_2a + faolc_2b 
	gen builtup = faolc_1a + faolc_1b

	gen forest = faolc_6a + faolc_6b + faolc_6b1 + faolc_6c
	gen barren = faolc_8a + faolc_8b + faolc_8c
	gen water = faolc_10a + faolc_10b + faolc_11 + faolc_12 + faolc_13
	gen marsh = faolc_9a + faolc_9b

	gen cropland = irrig_all + rainfed
	gen croprange = cropland + rangeland
	gen cropfruit = cropland + fruit
	gen cropfruitrange = cropland + fruit + rangeland
	
	gen uninhabitable = barren + forest + marsh + water
	gen other = barren + forest + marsh + water + fruit
end

program define winsorperc
	syntax, windows(numlist) cutleft(numlist) cutright(numlist)
	
	foreach time of numlist `windows'{
		gen vpm_pctchange_`time'min = vpm_after_`time'min / vpm_before_`time'min - 1
		winsor2 vpm_pctchange_`time'min, cuts(`cutleft' `cutright')
	}
end


program define flipsign
	syntax, variables(varlist)

	foreach v of varlist `variables'{
		replace `v' = -1*`v'
	}	
end


program define poppy

	gen opium_cult_ihs = asinh(opium_cult)
	gen opium_cult_log = ln(opium_cult)

	gen opium_cult_wmiss = opium_cult
	gen opium_cult_miss_ind = 0
	replace opium_cult_miss_ind = 1 if opium_cult == .
	replace opium_cult_wmiss = 999 if opium_cult == .
	gen opium_cult_wmiss_ihs = asinh(opium_cult_wmiss)
	gen opium_cult_wmiss_log = ln(opium_cult_wmiss)
	
	gen opium_interp_ihs = asinh(opium_cult_interp)
	gen opium_interp_log = ln(opium_cult_interp)
	
	gen opium_interp_wmiss = opium_cult_interp
	gen opium_interp_miss_ind = 0
	replace opium_interp_miss_ind = 1 if opium_cult_interp == .
	replace opium_interp_wmiss = 999 if opium_cult_interp == .
	gen opium_interp_wmiss_ihs = asinh(opium_interp_wmiss)
	gen opium_interp_wmiss_log = ln(opium_interp_wmiss)

end

program define gen_maghrib_measures 
	syntax, time(numlist)

	*** Before as Denominator 
	gen 	vpm_diff_before_denom`time' = 1 - (vpm_after_`time'min / vpm_before_`time'min) 
	replace vpm_diff_before_denom`time' = vpm_diff_before_denom`time' * 100
	* This is the winsorization step
	replace vpm_diff_before_denom`time' = -100 if vpm_diff_before_denom`time' <= -100
	* Fix 0-0 Cases (This changes nothing as we don't have 0-0 cases at the grid-month level)
	replace vpm_diff_before_denom`time' = 0 if vpm_before_`time'min == 0 & vpm_after_`time'min == 0

	*** Keep Infinity
	gen 	vpm_diff_keepinf`time' = 1 - (vpm_after_`time'min / vpm_before_`time'min) 
	replace vpm_diff_keepinf`time' = vpm_diff_keepinf`time' * 100
	* Winsorization step
	replace vpm_diff_keepinf`time' = -100 if vpm_diff_before_denom`time' <= -100
	* modifying -inf observations
	replace vpm_diff_keepinf`time' = -100 if vpm_before_`time'min == 0 & vpm_after_`time'min > 0
	* Fix 0-0 Cases (This changes nothing as we don't have 0-0 cases at the grid-month level)
	replace vpm_diff_keepinf`time' = 0 if vpm_before_`time'min == 0 & vpm_after_`time'min == 0

	*** Average as Denominator
	gen 	vpm_diff_avg_denom`time' = (vpm_before_`time'min - vpm_after_`time'min) / ((vpm_before_`time'min + vpm_after_`time'min)/2)
	replace vpm_diff_avg_denom`time' = vpm_diff_avg_denom`time' * 100
	* Fix 0-0 Cases (This changes nothing as we don't have 0-0 cases at the grid-month level)
	replace vpm_diff_avg_denom`time' = 0 if vpm_before_`time'min == 0 & vpm_after_`time'min == 0

end






* =========================================================================== *
* -----  District-month Violence and Relig: Table 1, Table A7, A8, A9   ----- *
* =========================================================================== *


use "${datadir}/SIGACTS/cdr_and_conflict_dm_allsample", clear
keep if sample == "wo_outages_tomidnight_w_ramadan"

keep distid ym year month trendval maghrib_dip   ///
     maghrib_dip_25min maghrib_dip_35min maghrib_dip_40min ///
	 maghrib_dip_shortcode maghrib_dip_nodiffhome3mo ///
	 maghrib_dip_before_denom maghrib_dip_ihs total_vol ///
	 num_deadly_enemy num_other_enemy num_deadly_friendly num_other_friendly ///
	 access_dum45 access_num 

xtset distid trendval
gen num_deadly_enemy_lead1 = F.num_deadly_enemy
gen num_deadly_enemy_lead2 = F2.num_deadly_enemy
gen num_deadly_enemy_lag1 = L.num_deadly_enemy
gen num_deadly_enemy_lag2 = L2.num_deadly_enemy

* for Table A8: 
bysort distid (year month): gen maghrib_dip_lag = maghrib_dip[_n-1]

gen total_vol_ihs = asinh(total_vol)

gen access_dum45_nonmiss = access_dum45 
replace access_dum45_nonmiss = 0 if missing(access_dum45_nonmiss)
gen access_num_missing = missing(access_num) 


preserve 

	****  Get Call Volume Metric for Table A9 Column (3) (4) 

	*import delimited using "${datadir}/Panels/District-month/240318_cdr_districtmonth_allsample_panel.csv", bindquote(strict) clear
	import delimited using "${datadir}/Panels/District-month/260116_cdr_districtmonth_allsample_panel.csv", bindquote(strict) clear
	
	keep if sample == "wo_outages_tomidnight_w_ramadan"

	gen year = substr(ym, 1, 4)
	destring year, replace
	rename (nhash nhash_robust) (numhashes numhashes_rbst)

	* robust users per cell in the year (avg of all months of the year)
	keep if year < 2015
	collapse (mean) total_vol numhashes numhashes_rbst, by(distid)

	*ssc install egenmore
	egen numhashes_qtile = xtile(numhashes_rbst), n(100)
	egen vol_qtile 		 = xtile(total_vol), n(100)

	* keep required columns and save data
	keep distid numhashes_qtile vol_qtile
	rename (numhashes_qtile vol_qtile) (numhashes_qtile_pre2015 vol_qtile_pre2015)

	tempfile temp_call_vol_pre2015
	save `temp_call_vol_pre2015', replace	

	**** Hazara Districts for Table A9 Column (2) 

	//use "${maindir}/Code/Ethnicity/crossSectionData/cdr_dist_ethnicity", clear
	import delimited using "${datadir}/Ethnicity/ethnicity_districtlevel.csv", bindquote(strict) clear

	drop if distid == .
	keep distid share_hazaragi
	gen hazara1 = (share_hazaragi >= 0.05 & share_hazaragi != .)

	tempfile temp_ethn
	save `temp_ethn', replace

	**** Dropping Ramadan Days for Table A9 Column (1)

	use "${datadir}/SIGACTS/cdr_and_conflict_dm_allsample", clear
	keep if sample == "wo_outages_tomidnight_wo_ramadan"
	keep distid trendval maghrib_dip 
	rename maghrib_dip maghrib_dip_noram
	
	tempfile noram
	save `noram', replace

restore 

merge m:1 distid using `temp_ethn', keep(master match) nogen
merge m:1 distid using `temp_call_vol_pre2015', nogen
merge 1:1 distid trendval using `noram', nogen 

rename num_deadly_enemy         num_insurg_viol
rename num_deadly_friendly      num_state_viol 
rename num_other_enemy          num_other_insurg
rename num_other_friendly       num_other_state
rename num_deadly_enemy_lead1   num_insurg_viol_lead1
rename num_deadly_enemy_lead2   num_insurg_viol_lead2
rename num_deadly_enemy_lag1    num_insurg_viol_lag1
rename num_deadly_enemy_lag2    num_insurg_viol_lag2

order distid year month ym trendval total_vol maghrib_dip maghrib_dip_*  ///
      total_vol total_vol_ihs num_insurg_viol num_insurg_viol_lead1 ///
	  num_insurg_viol_lead2 num_insurg_viol_lag1 num_insurg_viol_lag2  ///
	  num_state_viol num_other_insurg num_other_state   ///
	  access_num access_dum45 access_dum45_nonmiss access_num_missing ///
	  share_hazaragi hazara1 numhashes_qtile_pre2015 vol_qtile_pre2015 

save  "$outputdir/cdr_and_conflict_dm.dta", replace 



* =========================================================================== *
* -  Grid-month SPEI and Relig: Table 2 Col(1)(2), Table A10, A11, A12, A14 - *
* =========================================================================== *

**** Shortcode 

use "${datadir}/Panels/250108_afg_master_cellym_shortcode", clear

* Modify Old Cell CDR Variable
bysort cell_id: egen total_vol_cell = total(total_vol)
drop cell_cdr
gen cell_cdr = 1 if total_vol_cell != 0

timeseries
interactions
winsorperc, windows(30) cutleft(0) cutright(99.9)
x100, variables(*_w obs_uppsala)
flipsign, variables(*_w)
poppy

* Create Maghrib Measures
gen_maghrib_measures, time(30)

* Rename 30 min Variables
rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
	(vpm_diff_before_denom vpm_diff_keepinf vpm_diff_avg_denom)

compress
tempfile temp_shortcode_panel
save `temp_shortcode_panel', replace

rename vpm_diff_avg_denom vpm_diff_avg_denom_shortcode
keep year_num month_num lng_str lat_str vpm_diff_avg_denom_shortcode
tempfile temp_shortcode_for_merge
save `temp_shortcode_for_merge'


**** Phone Call: 

use "${datadir}/Panels/250108_afg_master_cellym", clear

* Modify Old Cell CDR Variable
bysort cell_id: egen total_vol_cell = total(total_vol)
drop cell_cdr
gen cell_cdr = 1 if total_vol_cell != 0

timeseries
interactions
winsorperc, windows(30) cutleft(0) cutright(99.9)
x100, variables(*_w obs_uppsala)
flipsign, variables(*_w)
poppy

* Create Maghrib Measures
gen_maghrib_measures, time(25)
gen_maghrib_measures, time(30)
gen_maghrib_measures, time(35)
gen_maghrib_measures, time(40)

* Rename 30 min Variables
rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
	(vpm_diff_before_denom vpm_diff_keepinf vpm_diff_avg_denom)

merge 1:1 year_num month_num lng_str lat_str using `temp_shortcode_for_merge', nogen

compress 
tempfile temp_main_panel 
save `temp_main_panel', replace    // phone call + shortcode 



**** No Ramadan 

import delimited using "${datadir}/Panels/Cell-month/260116_cdr_gridmonth_allsample_panel.csv", bindquote(strict) clear

keep if sample == "wo_outages_tomidnight_wo_ramadan"

gen year = substr(ym, 1, 4)
gen month = substr(ym, 6, 2)
destring year month, replace
rename (year month) (year_num month_num)

split gridid, parse("X") 
rename (gridid1 gridid2) (lng_str lat_str)

gen_maghrib_measures, time(30)

rename vpm_diff_avg_denom30 vpm_diff_avg_denom_noramadan

keep lng_str lat_str year_num month_num  vpm_diff_avg_denom_noramadan

tempfile temp_noramadan
save `temp_noramadan', replace


**** PIX Taliban: 

use "${datadir}/PIX/pix_cdr_panels/pix_cdr_full_procmonth", clear

collapse (max) taliban_fg, by(district)
rename district distid

tempfile temp_taliban
save `temp_taliban', replace



**** For Table A11 Col(3)(4)

use `temp_main_panel', clear

rename (nhash nhash_robust) (numhashes numhashes_rbst)

* robust users per cell in the year (avg of all months of the year)
collapse (mean) total_vol numhashes numhashes_rbst, by(cell_id)

*ssc install egenmore
egen numhashes_qtile = xtile(numhashes_rbst), n(100)
egen vol_qtile 		 = xtile(total_vol), n(100)

* keep required columns and save data
keep cell_id numhashes_qtile vol_qtile
rename (numhashes_qtile vol_qtile) (numhashes_qtile_allyears vol_qtile_allyears)

tempfile temp_call_vol_allyears
save `temp_call_vol_allyears', replace


**** Merge everything: 

use `temp_main_panel', clear

merge m:1 distid using `temp_ethn', keep(master match) nogen
merge m:1 distid using `temp_taliban', keep(master match) nogen
merge 1:1 year_num month_num lng_str lat_str using `temp_noramadan', keep(master match) nogen
merge m:1 cell_id using `temp_call_vol_allyears', nogen

* Build Up
gen builtup5 = (builtup > 0.05 & builtup != .)

drop cropland
gen cropland = irrig_all + rainfed + rangeland
drop other
gen other = barren + forest + marsh + water + fruit

gen vpm_diff_avg_denom_ihs = asinh(vpm_diff_avg_denom)
bysort cell_id (year_num month_num): gen vpm_diff_avg_denom_lag = vpm_diff_avg_denom[_n-1]
gen total_vol_ihs = asinh(total_vol)
gen call_vol_log = ln(avgdaily_vol)
gen call_vol_ihs = asinh(avgdaily_vol)

tempfile cdr_and_climate_varioussample
save `cdr_and_climate_varioussample'


**** alternate accounts

* Table A12 - In Sample Continuously: 
import delimited using "${datadir}/CDR/hash_restricted_panels/grid_month/cdr_gridmonth_is_strict_cont_3mo_wo_outages_tomidnight_w_ramadan_panel_241002_mod.csv", bindquote(strict) clear

gen year = substr(ym, 1, 4)
gen month = substr(ym, 6, 2)
destring year month, replace
rename (year month) (year_num month_num)

split gridid, parse("X") 
rename (gridid1 gridid2) (lng_str lat_str)

drop ym 

tempfile temp_nonmovers
save `temp_nonmovers', replace

use `temp_main_panel', clear
sort x y

drop vpm_* total_vol nhash nhash_robust
merge 1:1 year_num month_num lng_str lat_str using `temp_nonmovers', nogen

gen_maghrib_measures, time(30)

rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
	(vpm_diff_before_denom vpm_diff_keepinf vpm_diff_avg_denom)

rename vpm_diff_avg_denom vpm_diff_avg_denom_continu
keep trendval cell_id vpm_diff_avg_denom_continu 

tempfile alter_account_panelB2 
save `alter_account_panelB2'
	
	

* Table A12 - Non-Movers: 
import delimited using "${datadir}/CDR/hash_restricted_panels/grid_month/cdr_gridmonth_no_diffloc_3mo_wo_outages_tomidnight_w_ramadan_panel_241014_mod.csv", bindquote(strict) clear

gen year = substr(ym, 1, 4)
gen month = substr(ym, 6, 2)
destring year month, replace
rename (year month) (year_num month_num)

split gridid, parse("X") 
rename (gridid1 gridid2) (lng_str lat_str)

drop ym 

tempfile temp_nodiffhomeloc
save `temp_nodiffhomeloc', replace

use `temp_main_panel', clear
sort x y

drop vpm_* total_vol nhash nhash_robust
merge 1:1 year_num month_num lng_str lat_str using `temp_nodiffhomeloc', nogen

gen_maghrib_measures, time(30)

rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
	(vpm_diff_before_denom vpm_diff_keepinf vpm_diff_avg_denom)

rename vpm_diff_avg_denom vpm_diff_avg_denom_nonmove
keep trendval cell_id vpm_diff_avg_denom_nonmove

tempfile alter_account_panelC1 
save `alter_account_panelC1'



**** Final dataset: 
use `cdr_and_climate_varioussample', clear 

merge 1:1 trendval cell_id using `alter_account_panelB2', nogen 
merge 1:1 trendval cell_id using `alter_account_panelC1', nogen
keep if sample == "wo_outages_tomidnight_w_ramadan"

drop sample 

keep cell_id x y district year ym year_str month_num trendval cell_cdr speipm12_g   ///
     vpm_diff_avg_denom25  vpm_diff_avg_denom35  vpm_diff_avg_denom40  ///
	 vpm_diff_avg_denom  vpm_diff_before_denom vpm_diff_avg_denom_ihs /// 
	 vpm_diff_avg_denom_lag vpm_diff_avg_denom_noramadan ///
	 vpm_diff_avg_denom_shortcode ///
	 vpm_diff_avg_denom_continu vpm_diff_avg_denom_nonmove ///
	 total_vol_ihs call_vol_ihs ///
	 rainfed irrig_all rangeland other builtup builtup5 ///
	 hazara1 taliban_fg numhashes_qtile_allyears vol_qtile_allyears /// 
	 opium_cult_ihs opium_interp_ihs opium_cult_wmiss_ihs opium_cult_miss_ind ///
	 opium_interp_wmiss_ihs opium_interp_miss_ind 
	 
order cell_id x y district year ym year_str month_num trendval cell_cdr speipm12_g   ///
     vpm_diff_avg_denom25  vpm_diff_avg_denom35  vpm_diff_avg_denom40  ///
	 vpm_diff_avg_denom  vpm_diff_before_denom vpm_diff_avg_denom_ihs /// 
	 vpm_diff_avg_denom_lag vpm_diff_avg_denom_noramadan ///
	 vpm_diff_avg_denom_shortcode ///
	 vpm_diff_avg_denom_continu vpm_diff_avg_denom_nonmove ///
	 total_vol_ihs call_vol_ihs ///
	 rainfed irrig_all rangeland other builtup builtup5 ///
	 hazara1 taliban_fg numhashes_qtile_allyears vol_qtile_allyears /// 
	 opium_cult_ihs opium_interp_ihs opium_cult_wmiss_ihs opium_cult_miss_ind ///
	 opium_interp_wmiss_ihs opium_interp_miss_ind 
	 
save  "$outputdir/cdr_and_climate_gm.dta", replace 




*==========================================================================*
*---- Gridcell-Year SPEI, EVI and Relig: Table 2 Col(3)(4) and Table 3 ---- 
*==========================================================================*

use `temp_main_panel', clear

bysort cell_id year_num: egen vpm_after_30min_yr = mean(vpm_after_30min)
bysort cell_id year_num: egen vpm_before_30min_yr = mean(vpm_before_30min)

keep cell_id x y year_num month_num speipm*_g speipm5_r evi vpm_after_30min_yr vpm_before_30min_yr ///
	cropland rainfed irrig_all rangeland barren marsh water forest fruit other builtup cell_cdr

keep if cell_cdr == 1	

rename (vpm_after_30min_yr vpm_before_30min_yr) (vpm_after_30min vpm_before_30min)
order cell_id x y year_num month_num 

* Reshape Data to Yearly Level
reshape wide speipm1_g speipm2_g speipm3_g speipm4_g speipm5_g speipm6_g ///
	speipm7_g speipm8_g speipm9_g speipm10_g speipm11_g speipm12_g speipm5_r evi, ///
	i(cell_id x y year_num) ///
	j(month_num)

* Get Past Year December EVI
bysort cell_id (year_num): gen evi_pastdec = evi12[_n-1]
* Get Past Year December SPEI
bysort cell_id (year_num): gen speipm6_g_pastdec = speipm6_g12[_n-1]
bysort cell_id (year_num): gen speipm9_g_pastdec = speipm9_g12[_n-1]
bysort cell_id (year_num): gen speipm12_g_pastdec = speipm12_g12[_n-1]

* EVI Difference
egen evispringmax = rowmax(evi1 evi2 evi3 evi4)
gen logdifevi = log(evispringmax - evi_pastdec)

* Spring (Growing Season SPEI)
egen spring_spei6 = rowmean(speipm6_g1 speipm6_g2 speipm6_g3 speipm6_g4 speipm6_g_pastdec)
egen spring_spei9 = rowmean(speipm9_g1 speipm9_g2 speipm9_g3 speipm9_g4 speipm9_g_pastdec)
egen spring_spei12 = rowmean(speipm12_g1 speipm12_g2 speipm12_g3 speipm12_g4 speipm12_g_pastdec)
rename speipm5_r5 spring_spei_rect

* Create Maghrib Measures
gen_maghrib_measures, time(30)

* Rename 30 min Variables
rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
	(vpm_diff_before_denom vpm_diff_keepinf vpm_diff_avg_denom)

drop cropland
gen cropland = irrig_all + rainfed + rangeland

drop other
gen other = barren + forest + marsh + water + fruit

keep cell_id year_num logdifevi cell_cdr rainfed irrig_all rangeland other 
rename year_num year 
tempfile evi 
save `evi' 

use "${datadir}/Panels/240419_widewheat_cellyear_nowheat_wo_outages_tomidnight_avg_denom", clear
keep year cell_id spring_vpm harvest_vpm postharvest_vpm spring_spei12 harvest_spei12 postharvest_spei12 spring_vpm_prev12 harvest_vpm_prev12 postharvest_vpm_prev12

gen reg_sample = 1 if spring_vpm != . & harvest_vpm != . & postharvest_vpm != . ///
		& spring_spei12 != . & harvest_spei12 != . & postharvest_spei12 != .

gen reg_sample2 = 1 if reg_sample == 1 & spring_vpm_prev12 != . & harvest_vpm_prev12 != . & postharvest_vpm_prev12 != .

tempfile wheat
save `wheat'  

use "${datadir}/Panels/240419_widewheat_cellyear_nowheat_wo_outages_tomidnight_noramadan_avg_denom", clear
keep year cell_id spring_vpm harvest_vpm postharvest_vpm spring_vpm_prev12 harvest_vpm_prev12 postharvest_vpm_prev12 spring_spei12 harvest_spei12 postharvest_spei12

gen reg_sample = 1 if spring_vpm != . & harvest_vpm != . & postharvest_vpm != . ///
		& spring_spei12 != . & harvest_spei12 != . & postharvest_spei12 != . ///
		& spring_vpm_prev12 != . & harvest_vpm_prev12 != . & postharvest_vpm_prev12 != .

rename spring_vpm spring_vpm_noram
rename harvest_vpm harvest_vpm_noram 
rename postharvest_vpm postharvest_vpm_noram 
rename spring_vpm_prev12 spring_vpm_prev12_noram
rename harvest_vpm_prev12 harvest_vpm_prev12_noram
rename postharvest_vpm_prev12 postharvest_vpm_prev12_noram 
rename reg_sample reg_sample3

drop spring_spei12 harvest_spei12 postharvest_spei12

merge 1:1 year cell_id using `wheat' 
drop _merge 

merge 1:1 year cell_id using `evi' 
keep if _merge == 3 

keep cell_id year cell_cdr logdifevi spring_spei12 harvest_spei12 postharvest_spei12   ///
     rainfed irrig_all rangeland other  ///
     spring_vpm harvest_vpm postharvest_vpm spring_vpm_prev12 harvest_vpm_prev12 postharvest_vpm_prev12 ///
	 spring_vpm_noram spring_vpm_prev12_noram  harvest_vpm_noram harvest_vpm_prev12_noram ///
     postharvest_vpm_noram postharvest_vpm_prev12_noram reg_sample reg_sample2 reg_sample3
	 
order cell_id year cell_cdr logdifevi spring_spei12 harvest_spei12 postharvest_spei12   ///
     rainfed irrig_all rangeland other  ///
     spring_vpm harvest_vpm postharvest_vpm spring_vpm_prev12 harvest_vpm_prev12 postharvest_vpm_prev12 ///
	 spring_vpm_noram spring_vpm_prev12_noram  harvest_vpm_noram harvest_vpm_prev12_noram ///
     postharvest_vpm_noram postharvest_vpm_prev12_noram reg_sample reg_sample2 reg_sample3

save "$outputdir/cdr_and_climate_gy.dta", replace 




*=====================================================================*
* District-month (phone call + shortcode stacked vertically): Table A1 
*=====================================================================*

import delimited using "${datadir}/Panels/District-month/260116_cdr_districtmonth_shortcode_allsample_panel.csv", bindquote(strict) clear
keep if sample == "wo_outages_tomidnight_w_ramadan"
gen maghrib_dip_shortcode = (vpm_before_30min - vpm_after_30min) / (0.5 * (vpm_before_30min + vpm_after_30min)) * 100 
keep ym distid maghrib_dip_shortcode
tempfile maghrib_dip_shortcode
save `maghrib_dip_shortcode'
sort ym distid 

import delimited using "${datadir}/Panels/District-month/260116_cdr_districtmonth_allsample_panel.csv", bindquote(strict) clear
keep if sample == "wo_outages_tomidnight_w_ramadan"
gen maghrib_dip = (vpm_before_30min - vpm_after_30min) / (0.5 * (vpm_before_30min + vpm_after_30min)) * 100 
keep ym distid maghrib_dip 
sort ym distid

merge 1:1 ym distid using `maghrib_dip_shortcode'
sort _merge

rename maghrib_dip maghrib_dip0
rename maghrib_dip_shortcode maghrib_dip1
reshape long maghrib_dip, i(ym distid) j(type) 
drop if maghrib_dip == . 
bys ym distid: gen n_in_group = _N
sort type ym distid 
drop if n_in_group == 1      // 41986

rename type variable_maghrib_dip_shortcode 
rename maghrib_dip value
cap drop _merge 

save "${outputdir}/calls_shortcode_comparison_dm.dta", replace

*use "${datadir}/CDR/transaction_type/calls_transaction_dip_comparison_panel_dm", clear  // 42108 (21054)



*======================================================================*
* Gridcell-month (phone call + shortcode stacked vertically): Table A1
*======================================================================*

use "$outputdir/cdr_and_climate_gm.dta", clear
summ vpm_diff_avg_denom
keep cell_id x y ym year_str month_num trendval vpm_diff_avg_denom vpm_diff_avg_denom_shortcode 
rename vpm_diff_avg_denom vpm_diff_avg_denom0
rename vpm_diff_avg_denom_shortcode vpm_diff_avg_denom1
reshape long vpm_diff_avg_denom, i(cell_id trendval) j(type) 
* drop if vpm_diff_avg_denom == 0
drop if vpm_diff_avg_denom == . 
bys cell_id trendval: gen n_in_group = _N
drop if n_in_group == 1 
sort type cell_id trendval 
gen gridid = string(x) + "X" + string(y) 
drop ym 
gen ym = year_str + "-" + string(month_num) 

keep gridid ym vpm_diff_avg_denom type
rename vpm_diff_avg_denom value
rename type variable_maghrib_dip_shortcode       // 74954

save "${outputdir}/calls_shortcode_comparison_gm.dta", replace

* use "${datadir}/CDR/transaction_type/calls_transaction_dip_comparison_panel_gm", clear // 74954



*==========================================================================*
*---- District level and gridcell level: Table A4 ---- 
*==========================================================================*

import delimited using "${datadir}/Panels/District-month/260116_cdr_districtmonth_allsample_panel.csv", bindquote(strict) clear

* Dropping Sunset Outages (Keeping Ramdan)
keep if sample == "wo_outages_tomidnight_w_ramadan"

gen year = substr(ym, 1, 4)
gen month = substr(ym, 6, 2)
destring year month, replace
rename (year month) (year_num month_num)

gen trendval = (year_num-2013)*12 + month_num

drop ym 

tempfile temp_newcdr_distmonth
save `temp_newcdr_distmonth', replace


import delimited using "${datadir}/Panels/District-month/260116_cdr_districtmonth_shortcode_allsample_panel.csv", bindquote(strict) clear

* Dropping Sunset Outages (Keeping Ramdan)
keep if sample == "wo_outages_tomidnight_w_ramadan"

gen year = substr(ym, 1, 4)
gen month = substr(ym, 6, 2)
destring year month, replace
rename (year month) (year_num month_num)

gen trendval = (year_num-2013)*12 + month_num

drop ym 

tempfile temp_newcdr_distmonth_shortcode
save `temp_newcdr_distmonth_shortcode', replace




*** Ethnicity Data
import delimited using "${datadir}/Ethnicity/ethnicity_10kmtower_gridlevel.csv", clear

split gridid, parse("X") 
rename (gridid1 gridid2) (lng_str lat_str)

tempfile temp_gridethn
save `temp_gridethn', replace

import delimited using "${datadir}/Ethnicity/ethnicity_10kmtower_districtlevel", bindquote(strict) clear

keep distid provid provname maj_ethn maj_ethn_share

tempfile temp_districtethn
save `temp_districtethn'

eststo clear


use `temp_main_panel', clear

collapse vpm_before_30min vpm_after_30min cell_uppsala_0312 cell_uppsala_0320, by(cell_id lng_str lat_str grid_provid)
gen_maghrib_measures, time(30)

* Rename 30 min Variables
rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
	(vpm_diff_before_denom vpm_diff_keepinf vpm_diff_avg_denom)

* Z-Score
summ vpm_diff_avg_denom
gen vpm_diff_avg_denom_zsc = (vpm_diff_avg_denom - r(mean)) / r(sd)

* add ethnicity
merge m:1 lng_str lat_str using `temp_gridethn', nogen

gen plur_pashto = 0
replace plur_pashto = 1 if maj_ethn == "pashto"
replace plur_pashto = . if maj_ethn_share == .

gen plur_hazara = 0
replace plur_hazara = 1 if maj_ethn == "hazaragi"
replace plur_hazara = . if maj_ethn_share == .

keep if !missing(vpm_diff_avg_denom)

tempfile eth_and_mag_col2
save `eth_and_mag_col2'



*******************************
use `temp_shortcode_panel', clear

collapse vpm_before_30min vpm_after_30min cell_uppsala_0312 cell_uppsala_0320, by(cell_id lng_str lat_str grid_provid)
gen_maghrib_measures, time(30)

* Rename 30 min Variables
rename (vpm_diff_before_denom30 vpm_diff_keepinf30 vpm_diff_avg_denom30) ///
	(vpm_diff_before_denom vpm_diff_keepinf vpm_diff_avg_denom)

* add ethnicity
merge m:1 lng_str lat_str using `temp_gridethn', nogen

gen plur_pashto = 0
replace plur_pashto = 1 if maj_ethn == "pashto"
replace plur_pashto = . if maj_ethn_share == .

gen plur_hazara = 0
replace plur_hazara = 1 if maj_ethn == "hazaragi"
replace plur_hazara = . if maj_ethn_share == .


tempfile eth_and_mag_col4
save `eth_and_mag_col4'


*******************************
use `temp_newcdr_distmonth', clear
keep if sample == "wo_outages_tomidnight_w_ramadan"

collapse vpm_before_30min vpm_after_30min, by(distid provid)

*** Average as Denominator
gen maghrib_dip = (vpm_before_30min - vpm_after_30min) / ((vpm_before_30min + vpm_after_30min)/2)
replace maghrib_dip = maghrib_dip * 100
* Fix 0-0 Cases (This changes nothing as we don't have 0-0 cases at the grid-month level)
replace maghrib_dip = 0 if vpm_before_30min == 0 & vpm_after_30min == 0

* add ethnicity
merge m:1 distid using `temp_districtethn', nogen

gen plur_pashto = 0
replace plur_pashto = 1 if maj_ethn == "pashto"
replace plur_pashto = . if maj_ethn_share == .

gen plur_hazara = 0
replace plur_hazara = 1 if maj_ethn == "hazaragi"
replace plur_hazara = . if maj_ethn_share == .


tempfile eth_and_mag_col1
save `eth_and_mag_col1'


*******************************
use `temp_newcdr_distmonth_shortcode', clear
keep if sample == "wo_outages_tomidnight_w_ramadan"

collapse vpm_before_30min vpm_after_30min, by(distid provid)

*** Average as Denominator
gen maghrib_dip = (vpm_before_30min - vpm_after_30min) / ((vpm_before_30min + vpm_after_30min)/2)
replace maghrib_dip = maghrib_dip * 100
* Fix 0-0 Cases (This changes nothing as we don't have 0-0 cases at the grid-month level)
replace maghrib_dip = 0 if vpm_before_30min == 0 & vpm_after_30min == 0

* add ethnicity
merge m:1 distid using `temp_districtethn', nogen

gen plur_pashto = 0
replace plur_pashto = 1 if maj_ethn == "pashto"
replace plur_pashto = . if maj_ethn_share == .

gen plur_hazara = 0
replace plur_hazara = 1 if maj_ethn == "hazaragi"
replace plur_hazara = . if maj_ethn_share == .


tempfile eth_and_mag_col3
save `eth_and_mag_col3'



*******************************
* distrcit level panel: Table A4 
*******************************

import delimited using "${datadir}/Ethnicity/ethnicity_districtlevel.csv", bindquote(strict) clear
drop if maj_ethn == ""
gen ethn_dari_ind = 0
gen ethn_pashto_ind = 0
gen ethn_other_ind = 0
replace ethn_dari_ind = 1 if maj_ethn == "dari"
replace ethn_pashto_ind = 1 if maj_ethn == "pashto"
replace ethn_other_ind = 1 if maj_ethn != "dari" & maj_ethn != "pashto"
keep distid ethn_dari_ind ethn_pashto_ind ethn_other_ind
destring distid, replace
tempfile temp_ethn_district
save `temp_ethn_district', replace  // merge this just for sum stats


use `eth_and_mag_col3', clear 
rename maghrib_dip maghrib_dip_sc
merge 1:1 distid using `eth_and_mag_col1', nogen 
merge 1:1 distid using `temp_ethn_district', nogen 
merge 1:1 distid using `temp_taliban', nogen    
save "$outputdir/dist_level.dta", replace 

*******************************
* gridcell level panel: Table A4 
*******************************

use `eth_and_mag_col4', clear 
keep if !missing(vpm_diff_avg_denom)
duplicates tag cell_id, gen(dup)
rename vpm_diff_avg_denom vpm_diff_avg_denom_sc 
merge 1:1 cell_id using `eth_and_mag_col2' 
drop _merge dup 
save "$outputdir/grid_level.dta", replace  



