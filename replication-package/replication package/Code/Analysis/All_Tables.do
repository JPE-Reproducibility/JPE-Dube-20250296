/*
====================================================================
All_Tables.do

Reproduces all tables in the paper and appendix that can be
constructed from the released replication data.

OUTPUTS (saved to Output/Tables/):
  Table 1  : Tab1.tex
  Table 2  : Tab2.tex
  Table 3  : Tab3.tex
  Table A1 : TabA1.tex
  Table A2 : TabA2.tex       [synthetic]
  Table A3 : TabA3.tex         [synthetic]
  Table A4 : TabA4.tex
  Table A5 : TabA5.tex
  Table A6 : TabA6.tex
  Table A7 : TabA7.tex
  Table A8 : TabA8.tex
  Table A9 : TabA9.tex
  Table A10: TabA10.tex
  Table A11: TabA11.tex
  Table A12: TabA12.tex
  Table A14: TabA14.tex

NOT REPRODUCED HERE:
  Table A2 / A3 : Rely on individual-level survey records (privacy).
                  A synthetic placeholder dataset is used instead;
                  output reflects synthetic data, not paper results.
  Table A13     : Relies on individual-quarter CDR data (privacy).
                  Reproduced separately in Code/Analysis/TabA13.R
                  using a synthetic placeholder dataset.

REQUIRED PACKAGES (install once by setting install_package = 1):
  estout, reghdfe, ftools
  To install: ssc install estout
              ssc install reghdfe
              ssc install ftools

SOFTWARE:
  StataNow 19.5 SE, Windows x86-64

USAGE:
  Set the global `root` (under Parameters below) to the absolute
  path of the replication package folder on your machine.
  All other paths are derived automatically.
====================================================================
*/


clear all
set more off
pause off
set matsize 11000
cap log close 


global install_package 0     
if $install_package == 1 {
	ssc install estout
	ssc install ftools
	ssc install reghdfe
}


* ===================================================================== *
* -----------------     	     Parameters           ----------------- *
* ===================================================================== *

// should modify the path below to point to the folder on your local machine.
global root "<PATH_TO_REPLICATION_PACKAGE>"  
global datadir "${root}/Data/tables_data"
global outputdir  "${root}/Output/Tables"

* Latex Options
global endoptions "star(* 0.1 ** 0.05 *** 0.01) substitute(_ \_) msign(--)  default(tab) modelwidth(8) varwidth(20)"


* ===================================================================== *
* -----------------     	  	 Programs             ----------------- *
* ===================================================================== *


program define add_stats

	estadd ysumm
	estadd local gridFE "Y"
	estadd local monthFE "Y"

end

program define add_stats2

	estadd ysumm, mean 
	estadd local districtFE "Y"
	estadd local monthFE "Y"

end

program define add_count 

	tempvar tag_d tag_m
	egen `tag_d' = tag(distid)  if e(sample)
	egen `tag_m' = tag(trendval) if e(sample)
	quietly count if `tag_d'
	local ndist = r(N)
	quietly count if `tag_m'
	local nmon  = r(N)

	estadd scalar N_districts = `ndist'
	estadd scalar N_months    = `nmon'

end 


* ===================================================================== *
* Table 1: Insurgent Violence and Religious Adherence
* ===================================================================== *


eststo clear
use "${datadir}/cdr_and_conflict_dm", clear

eststo A1: reghdfe maghrib_dip num_insurg_viol, absorb(trendval distid) cluster(distid)
add_stats2
add_count

eststo A2: reghdfe maghrib_dip num_insurg_viol num_insurg_viol_lead1 num_insurg_viol_lead2, absorb(trendval distid) cluster(distid)
add_stats2
add_count

eststo A3: reghdfe maghrib_dip num_insurg_viol num_state_viol num_other_state, absorb(trendval distid) cluster(distid)
add_stats2
add_count

eststo A4: reghdfe maghrib_dip num_insurg_viol num_other_insurg, absorb(trendval distid) cluster(distid)
add_stats2
add_count

eststo A5: reghdfe maghrib_dip num_insurg_viol num_other_insurg num_state_viol num_other_state, absorb(trendval distid) cluster(distid)
add_stats2
add_count


esttab A1 A2 A3 A4 A5 using "${outputdir}/Tab1.tex", replace booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N ymean N_districts N_months districtFE monthFE, ///
	fmt(%9.0f %9.3f %9.0f %9.0f) ///
	labels("Observations" "Mean of Dependent Variable" "Number of Districts" "Number of Months" "District Fixed Effects" "Month Fixed Effects")) ///
	drop(_cons) ///
	order(num_insurg_viol) ///
	varlabels(num_insurg_viol "Insurgent Violence" ///
		num_insurg_viol_lead1 "Insurgent Violence (1 lead)" ///
		num_insurg_viol_lead2 "Insurgent Violence (2 leads)" ///
		num_state_viol "State-led Violence" ///
		num_other_state "Other State-led Activity"   ///
		num_other_insurg "Other Insurgent Activity" ) ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule) ///
	mgroups("Maghrib Dip", pattern(1 0 0 0 0) ///
		  prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "Each column is a separate regression. One observation is included for each month for each district.  Column (1) regresses the Maghrib dip measure of religious adherence on the number of insurgent violence incidents. Column (2) controls for insurgent violence one and two months in advance. Column (3) controls for state-led violence (including  escalation of force, direct fire, close air support, and indirect fire) and other state-led activity (including clearing enemy weapons caches, detention, arrest, surveillance, medical evacuation, police actions, and releasing detainees). Columns (4) and (5) control for other insurgent activity (including threats, unexploded IEDs/mines/explosives, meetings, accidents, kidnappings, weapons transport, intimidation, illegal checkpoints, corruption, smuggling, theft, demonstrations, narcotics, surveillance, terrorist tactics and procedures, terrorist recruitment, defecting, assault, terrorist training, arson, counterfeiting, and sabotage). All regressions include district and month fixed effects. The number of districts and months appearing in each regression is shown separately in each column. Standard errors clustered on district shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions
	

* ===================================================================== *
* Table 2: Climate and Religious Adherence
* ===================================================================== *

eststo clear

use "${datadir}/cdr_and_climate_gm.dta", clear

local landcontrols12 "c.speipm12_g#c.other"

eststo A1: reghdfe vpm_diff_avg_denom speipm12_g  if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats


eststo A2: reghdfe vpm_diff_avg_denom speipm12_g  c.speipm12_g#c.rainfed c.speipm12_g#c.irrig_all c.speipm12_g#c.rangeland `landcontrols12' if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats
estadd local landtypectrls "Y"


use "${datadir}/cdr_and_climate_gy.dta", clear

local spring_landcontrols12 "c.spring_spei12#c.other"

eststo B1: reghdfe logdifevi spring_spei12 if cell_cdr == 1, absorb(cell_id year) cluster(cell_id)
estadd local gridFE "Y"
estadd local yearFE "Y"


eststo B2: reghdfe logdifevi spring_spei12  c.spring_spei12#c.rainfed c.spring_spei12#c.irrig_all c.spring_spei12#c.rangeland `spring_landcontrols12' if cell_cdr == 1, absorb(cell_id year) cluster(cell_id)
estadd local gridFE "Y"
estadd local yearFE "Y"
estadd local landtypectrls "Y"


* latex table
esttab A* B* using "${outputdir}/Tab2.tex", replace booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N gridFE monthFE yearFE landtypectrls, fmt(%9.0f) ///
		labels("Observations" "Grid Cell Fixed Effects" "Month Fixed Effects" "Year Fixed Effects" "Controls - Other Land Types")) ///
	drop(_cons `landcontrols12' `spring_landcontrols12') ///
	prehead(\begin{threeparttable}[htbp] \renewcommand{\arraystretch}{1.2} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule) ///
	order(speipm12_g  c.speipm12_g#c.rainfed c.speipm12_g#c.irrig_all c.speipm12_g#c.rangeland ///
		spring_spei12  c.spring_spei12#c.rainfed c.spring_spei12#c.irrig_all c.spring_spei12#c.rangeland) ///
	varlabels(speipm12_g "SPEI" ///
			  c.speipm12_g#c.rainfed   "SPEI x Rainfed Cropland" ///
			  c.speipm12_g#c.irrig_all "SPEI x Irrigated Cropland" ///
			  c.speipm12_g#c.rangeland "SPEI x Rangeland" ///
			  spring_spei12 "Growing Season SPEI" ///
			  c.spring_spei12#c.rainfed   "Growing Season SPEI x Rainfed Cropland" ///
			  c.spring_spei12#c.irrig_all "Growing Season SPEI x Irrigated Cropland" ///
			  c.spring_spei12#c.rangeland "Growing Season SPEI x Rangeland") ///
	mgroups("Maghrib Dip" "Agricultural Growth", pattern(1 0 1 0) ///
		  prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "Each column is a separate regression. In columns (1)-(2): One observation is included for each month for each 10km X 10km grid cell; and the dependent variable is the Maghrib dip measure of religious adherence. The Maghrib dip is regressed on the monthly SPEI in column (1) and its interaction with the fraction of the grid cell containing rainfed and irrigated cropland, and rangeland in column (2). Both regressions include grid cell and month fixed effects. In columns (3)-(4): One observation is included for each year for each grid cell; and the dependent variable is the (log) difference in the Enhanced Vegetation Index (EVI) between the maximum and the beginning of the growing season, which is December. This transformation of EVI is regressed on the growing season SPEI in column (3), as well as its interaction with the fraction of the grid cell containing rainfed and irrigated cropland, and rangeland (in column 4). These two regressions include grid cell and year fixed effects. The \textquotedblleft Controls - Other Land Types\textquotedblright~refers to interactions of SPEI in column (2) and growing season SPEI in column (4), with the fraction of the grid cell containing forest cover, fruit trees and vineyards, barren areas, water and marshland (with the omitted category being built-up urban areas). Standard errors clustered on grid cell shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions

	
* ===================================================================== *
* Table 3 - Climate and Religious Adherence by Agricultural Season
* ===================================================================== *

eststo clear

	use "${datadir}/cdr_and_climate_gy.dta", clear
	
	
	eststo A3_1: reghdfe spring_vpm  spring_spei12 if reg_sample == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"

	eststo A3_2: reghdfe harvest_vpm spring_spei12 harvest_spei12 if reg_sample == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"
	estadd local cntrlownSPEI "Y"

	eststo A3_3: reghdfe postharvest_vpm spring_spei12 postharvest_spei12 if reg_sample == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"
	estadd local cntrlownSPEI "Y"


	eststo A3_4: reghdfe spring_vpm spring_spei12 spring_vpm_prev12 if reg_sample2 == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"
	estadd local MDprev "Y"

	eststo A3_5: reghdfe harvest_vpm spring_spei12 harvest_spei12 harvest_vpm_prev12 if reg_sample2 == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"
	estadd local cntrlownSPEI "Y"
	estadd local MDprev "Y"

	eststo A3_6: reghdfe postharvest_vpm spring_spei12 postharvest_spei12 postharvest_vpm_prev12 if reg_sample2 == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"
	estadd local cntrlownSPEI "Y"
	estadd local MDprev "Y"


	eststo A3_7: reghdfe spring_vpm_noram spring_spei12 spring_vpm_prev12_noram if reg_sample3 == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"
	estadd local MDprev "Y"
	estadd local dropRAM "Y"

	eststo A3_8: reghdfe harvest_vpm_noram spring_spei12 harvest_spei12 harvest_vpm_prev12_noram if reg_sample3 == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"
	estadd local cntrlownSPEI "Y"
	estadd local MDprev "Y"
	estadd local dropRAM "Y"

	eststo A3_9: reghdfe postharvest_vpm_noram spring_spei12 postharvest_spei12 postharvest_vpm_prev12_noram if reg_sample3 == 1, absorb(year cell_id) cluster(cell_id)
	estadd local gridFE "Y"
	estadd local yearFE "Y"
	estadd local cntrlownSPEI "Y"
	estadd local MDprev "Y"
	estadd local dropRAM "Y"


esttab A3_* using "${outputdir}/Tab3.tex", replace booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N gridFE yearFE cntrlownSPEI MDprev dropRAM, fmt(%9.0f) ///
		labels("Observations" "Grid Cell Fixed Effects" "Year Fixed Effects" ///
		"Control for own season SPEI" "Control for Prev. Maghrib Dip" "Dropping Ramadan days")) ///
	keep(spring_spei12) ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule) ///
	varlabels(spring_spei12 "Growing Season SPEI") ///
	mtitles("\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Season}" ///
			"\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Season}" ///
			"\shortstack{Growing\\Season}" "\shortstack{Harvest\\Season}" "\shortstack{Post-harvest\\Season}") ///
	mgroups("\textit{Maghrib Dip in}" "\textit{Maghrib Dip in}" "\textit{Maghrib Dip in}", pattern(1 0 0 1 0 0 1 0 0) ///
		  prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "Each column is a regression of the Maghrib dip during an agricultural season (growing, harvest, or post-harvest) on SPEI during the growing season. Seasons are defined based on the wheat crop calendar: growing season is December-April, harvest season is May-July, and post-harvest season is August-September. The \textquotedblleft Control for own season SPEI\textquotedblright~controls for Harvest season SPEI in columns (2) (5) and (8); and for Post-harvest season SPEI in columns (3) (6) and (9). The \textquotedblleft Control for Prev. Maghrib Dip\textquotedblright~controls for the average Maghrib dip over the previous 12 months in columns (4)-(9). One observation is included for each year for each 10 km x 10 km grid cell. Standard errors clustered on grid cell shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) noobs compress nogaps $endoptions

	
	
* ===================================================================== *
* Appendix Table A1: Comparing the Maghrib Dip in Calls to 
* Shortcodes vs. Standard Numbers
* ===================================================================== *	

eststo clear
use "${datadir}/calls_shortcode_comparison_gm", clear

eststo A1: reghdfe value variable_maghrib_dip_shortcode, absorb(ym gridid) cluster(gridid)
summarize value if e(sample) == 1 & variable_maghrib_dip_shortcode == 0
estadd scalar mean_value 15.103
add_stats

use "${datadir}/calls_shortcode_comparison_dm", clear

eststo A2: reghdfe value variable_maghrib_dip_shortcode, absorb(ym distid) cluster(distid)
summarize value if e(sample) == 1 & variable_maghrib_dip_shortcode == 0
estadd scalar mean_value 15.855
estadd local distFE "Y"
estadd local monthFE "Y"

esttab A* using "${outputdir}/TabA1.tex", replace booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N mean_value gridFE monthFE distFE, fmt(%9.0f %9.3f %9.0f %9.0f %9.0f) labels("Observations" "Mean Non-shortcode Maghrib Dip" "Grid Cell Fixed Effects" "Month Fixed Effects" "District Fixed Effects")) ///
	drop(_cons) ///
	varlabels(variable_maghrib_dip_shortcode "Shortcode Transaction Type (Indicator)") ///
	mgroups("Grid Cell" "District", pattern(0 1 1) ///
		prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule ///
		"& \multicolumn{2}{c}{Maghrib Dip} \\") ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "This table examines if the measured Maghrib dip differs statistically based on the transaction type (shortcode calls versus non-shortcode calls). The Maghrib dip is regressed on a indicator of whether the measure uses shortcode calls (versus non-shortcode calls). Column (1) is a grid cell-month level regression which incorporates grid cell and month fixed effects; standard errors, shown in parentheses, are clustered on grid cell.  Column (2) is a district-month level regression which uses district and month fixed effects; standard errors, shown in parentheses, are clustered on district. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions
	
	
	
* ===================================================================== *
* Appendix Table A2: The Maghrib Dip and Survey Measures of Religiosity
* ===================================================================== *

* NOTE: Appendix Table A2 is not reproduced here because it relies on
* individual-level survey data that cannot be released due to privacy restrictions. 
* However, a synthetic data is generated to ensure reproducibility. 

eststo clear
use "${datadir}/synthetic/smallsurvey_finalsample_synthetic.dta", clear

* choose control set
local control_just_hazara hazara_ethn
local controls age hhmbr_male hhmbr_female hhmbr_kids hazara_ethn

	eststo A1: reghdfe vpm_diff_avg_denom mn_ix_imp_vimp_16, absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"
	
	eststo B1: reghdfe vpm_diff_avg_denom q12_16_e_imp_vimp_zsc, absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"

	eststo C1: reghdfe vpm_diff_avg_denom q12_16_a_imp_vimp_zsc, absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"

	eststo D1: reghdfe vpm_diff_avg_denom q12_16_d_imp_vimp_zsc, absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"

	eststo E1: reghdfe vpm_diff_avg_denom q12_16_f_imp_vimp_zsc, absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"

	eststo F1: reghdfe vpm_diff_avg_denom q12_16_b_imp_vimp_zsc, absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"

	eststo G1: reghdfe vpm_diff_avg_denom q12_16_c_imp_vimp_zsc, absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"
	
	eststo A2: reghdfe vpm_diff_avg_denom mn_ix_imp_vimp_16 `controls', absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"
	estadd local demoControls "Y"

	eststo B2: reghdfe vpm_diff_avg_denom q12_16_e_imp_vimp_zsc `controls', absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"
	estadd local demoControls "Y"

	eststo C2: reghdfe vpm_diff_avg_denom q12_16_a_imp_vimp_zsc `controls', absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"
	estadd local demoControls "Y"

	eststo D2: reghdfe vpm_diff_avg_denom q12_16_d_imp_vimp_zsc `controls', absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"
	estadd local demoControls "Y"

	eststo E2: reghdfe vpm_diff_avg_denom q12_16_f_imp_vimp_zsc `controls', absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"
	estadd local demoControls "Y"

	eststo F2: reghdfe vpm_diff_avg_denom q12_16_b_imp_vimp_zsc `controls', absorb(distname) vce(robust)
	estadd local distFE "Y"
	estadd local demoControls "Y"

	eststo G2: reghdfe vpm_diff_avg_denom q12_16_c_imp_vimp_zsc `controls', absorb(distname) vce(robust)
	estadd ysumm, mean
	estadd local distFE "Y"
	estadd local demoControls "Y"
	
	
local relig_table_name TabA2


* Table A2 in the paper: 
esttab A1 A2 using "${outputdir}/`relig_table_name'.tex", replace fragment booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	drop(_cons `controls') ///
	varlabels(mn_ix_imp_vimp_16 "Survey Religiosity Index") ///
	mgroups("Maghrib Dip", pattern(1) ///
		  prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions

esttab B1 B2 using "${outputdir}/`relig_table_name'.tex", append fragment booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	drop(_cons `controls') ///
	varlabels(q12_16_e_imp_vimp_zsc "Reading the Quran Daily") ///
	refcat(q12_16_e_imp_vimp_zsc "\textit{Standardized components:}", nolabel) ///
	collabels(none) nomtitles noobs nonumbers compress nogaps $endoptions

esttab C1 C2 using "${outputdir}/`relig_table_name'.tex", append fragment booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	drop(_cons `controls') ///
	varlabels(q12_16_a_imp_vimp_zsc "Observing Namaz 5 Times per Day") ///
	collabels(none) nomtitles noobs nonumbers compress nogaps $endoptions

esttab D1 D2 using "${outputdir}/`relig_table_name'.tex", append fragment booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	drop(_cons `controls') ///
	varlabels(q12_16_d_imp_vimp_zsc "No Alcohol") ///
	collabels(none) nomtitles noobs nonumbers compress nogaps $endoptions

esttab E1 E2 using "${outputdir}/`relig_table_name'.tex", append fragment booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	drop(_cons `controls') ///
	varlabels(q12_16_f_imp_vimp_zsc "No Music") ///
	collabels(none) nomtitles noobs nonumbers compress nogaps $endoptions

esttab F1 F2 using "${outputdir}/`relig_table_name'.tex", append fragment booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	drop(_cons `controls') ///
	varlabels(q12_16_b_imp_vimp_zsc "Fasting during Ramadan") ///
	collabels(none) nomtitles noobs nonumbers compress nogaps $endoptions

esttab G1 G2 using "${outputdir}/`relig_table_name'.tex", append fragment booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N ymean distFE demoControls, ///
          fmt(%9.0g 3 0 0) ///
          labels("Observations" "Mean of Dependent Variable" "District Fixed Effects" "Demographic Controls")) ///
	drop(_cons `controls') ///
	varlabels(q12_16_c_imp_vimp_zsc "Giving Zakat") ///
	prefoot(\midrule) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "This table examines correlations between the Maghrib dip measure of religious adherence and religious practices self-reported in a household survey. One observation is included for each surveyed individual. Individuals were surveyed in October 2015, so we calculate their Maghrib dip measure using 2015 and 2016 call data. In the top row, the independent variable is an index of responses to survey questions that ask about the importance of six different Islamic religious practices. To construct the index, we convert the responses for each religious practice into an indicator variable (equal to one if the respondent reports the practice is \textquotedblleft very important\textquotedblright~or \textquotedblleft important\textquotedblright), standardize these indicators, and take their average. In the remaining rows, the independent variables are each of the standardized components that comprise the index. All regressions include district fixed effects. Column (2) includes demographic controls for: number of men in their household, number of women in their household, number of children in their household, and an indicator for whether the respondent is of the Hazara ethnic group. Robust standard errors shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles compress nonumbers nogaps $endoptions



* ===================================================================== *
* Appendix Table A3: The Maghrib Dip and Demographic Characteristics 
* of Survey Respondents
* ===================================================================== *

* NOTE: Appendix Table A3 results cannot be reproduced here because it relies on
* individual-level survey data that cannot be released due to privacy restrictions.
* However, a synthetic data is generated to ensure reproducibility. 

est clear 


eststo M9: reghdfe vpm_diff_avg_denom age readwrite rural agri_land pashtun_ethn hazara_ethn, absorb(distname) vce(robust)
estadd ysumm, mean
estadd local distFE "Y"
estadd local hazara "Y"

label variable readwrite "Can Read and Write"
label variable agri_land "Owns Agricultural Land"	

esttab M9 using "${outputdir}/TabA3.tex", ///
    replace booktabs ///
	cells(b(fmt(a3) star) se(fmt(%9.3f) par))                 ///
	starlevels(* 0.10 ** 0.05 *** 0.01)              ///
	scalars("N Observations" "ymean Mean of Dependent Variable" "distFE District Fixed Effects" "hazara Hazara Ethnicity Control") ///
       sfmt(0 3 0 0)   ///
	keep(age rural readwrite agri_land pashtun_ethn) label  ///
	order(age rural readwrite agri_land pashtun_ethn)   ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule) ///
	mgroups("Maghrib Dip", pattern(1) ///
		  prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	postfoot(\bottomrule \end{tabular}  \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "This table examines correlations between the Maghrib dip measure of religious adherence and demographic characteristics of survey respondents. Since individuals were surveyed in October 2015, we calculate the Maghrib dip calculated using call data over 2015-2016. We regress this Maghrib dip measure on the demographic characteristics shown in the rows of the table. This includes age measured in years; whether the respondent resides in a rural location, can read and write, owns agricultural land and is a member of the Pashtun ethnic group. The regression also includes district fixed effects, and a control for whether the respondent is a member of the Hazara ethnic group. One observation is included for each surveyed individual. Robust standard errors shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles compress nogaps $endoptions



	
* ===================================================================== *
* Appendix Table A4: Ethnicity and the Maghrib Dip   
* ===================================================================== *

eststo clear
use "${datadir}/grid_level.dta", clear

eststo B1: reghdfe vpm_diff_avg_denom plur_pashto plur_hazara, absorb(grid_provid) vce(robust)
estadd local provFE "Y"
estadd local hazaraFE "Y"

eststo B2: reghdfe vpm_diff_avg_denom_sc plur_pashto plur_hazara, absorb(grid_provid) vce(robust)
estadd local provFE "Y"
estadd local hazaraFE "Y"

use "${datadir}/dist_level.dta", clear


eststo B3: reghdfe maghrib_dip plur_pashto plur_hazara, absorb(provid) vce(robust)
estadd local provFE "Y"
estadd local hazaraFE "Y"


eststo B4: reghdfe maghrib_dip_sc plur_pashto plur_hazara, absorb(provid) vce(robust)
estadd local provFE "Y"
estadd local hazaraFE "Y"

esttab B3 B1 B4 B2 using "${outputdir}/TabA4.tex", replace booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N provFE hazaraFE, fmt(%9.0f) labels("Observations" "Province Fixed Effects" "Plurality Hazara Control")) ///
	drop(_cons plur_hazara) ///
	varlabels(plur_pashto "Plurality Pashto Speaking") ///
	mgroups("District" "Grid Cell" "District" "Grid Cell", pattern(1 1 1 1) ///
		prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule ///
		"& \multicolumn{2}{c}{Maghrib Dip (All Calls)} & \multicolumn{2}{c}{Maghrib Dip (Shortcode Calls)} \\" ///
		"\cmidrule(lr){2-3} \cmidrule(lr){4-5}") ///
	prefoot(\midrule) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "We proxy ethnicity by language spoken in each village. To define the plurality language spoken in each unit (district or grid cell) we aggregate village-level data from 2012 to either district level or grid cell level, restricting to villages within 10km of a cell tower.  There are 128 plurality Pashto speaking districts; of the remaining 160 districts, 113 are plurality Dari speaking, 24 Uzbek, 11 Turkmen, 5 Pashai, 4 Balochi, 2 Nuristani, and 1 Hazaragi. Each column is a separate regression.  The Maghrib dip is calculated using all calls in columns (1)-(2) and shortcode calls in columns (3)-(4).  Columns (1) and (3) are district level regressions in which the district's average Maghrib Dip over 2013-2020 is regressed on an indicator of whether the largest number of villages in the district are plurality Pashto-speaking (while controlling for an indicator of whether the largest number of villages in the district are plurality Hazaragi-speaking). Columns (2) and (4) are grid cell level regressions in which the grid's average Maghrib Dip over 2013-2020 is regressed on an indicator of whether the largest number of villages in the grid are plurality Pashto-speaking (while controlling for an indicator of whether the largest number of villages in the grid are plurality Hazaragi-speaking). All regressions include province fixed effects. Robust standard errors shown in parentheses. *p$<$.10, **p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions

	
	
	

* ===================================================================== *
* Table A5: Summary Stats of Main Variables    
* ===================================================================== *
eststo clear

local landtype_cellmonth rainfed irrig_all rangeland other builtup
local cellyr_vars logdifevi spring_spei12 spring_vpm harvest_vpm postharvest_vpm

	
* -----------------     	  District month variables        ----------------- *

use "${datadir}/cdr_and_conflict_dm.dta", clear

eststo A1: estpost tabstat maghrib_dip num_insurg_viol num_other_insurg num_state_viol num_other_state, stat(mean sd min max count) columns(statistics) 
	
	
* -----------------     	  Grid Cell Month Level         ----------------- *

use "${datadir}/cdr_and_climate_gm.dta", clear

* Identify Singletons
gen with_mgrb_dip = 1 if vpm_diff_avg_denom != .
bysort cell_id: egen cell_yms_with_mgrb_dip = total(with_mgrb_dip)
gen main_sample = 1 if cell_yms_with_mgrb_dip > 1 & vpm_diff_avg_denom != .

eststo A2: estpost tabstat vpm_diff_avg_denom speipm12_g if main_sample == 1, stat(mean sd min max count) columns(statistics) 

* -----------------     	  Grid-Cell Variables       ----------------- *

collapse (mean) `landtype_cellmonth', by(cell_id main_sample)

eststo A4: estpost tabstat rainfed irrig_all rangeland other builtup if main_sample == 1, stat(mean sd min max count) columns(statistics) 


* -----------------     	  Grid Cell Year Variables        ----------------- *

use "${datadir}/cdr_and_climate_gy.dta", clear

gen vpm_sample = 1 if spring_vpm != . & harvest_vpm != . & postharvest_vpm != .
replace spring_vpm = . if vpm_sample != 1
replace harvest_vpm = . if vpm_sample != 1
replace postharvest_vpm = . if vpm_sample != 1

gen spei_sample = 1 if logdifevi != . & spring_spei12 != .
replace logdifevi = . if spei_sample != 1
replace spring_spei12 = . if spei_sample != 1

eststo A3: estpost tabstat `cellyr_vars', stat(mean sd min max count) columns(statistics) 



*** Latex Table
	
esttab A1 using "${outputdir}/TabA5.tex", replace booktabs fragment ///
	cells("mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3)) count(fmt(0))") ///
	prehead(\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{5}{c}} \toprule ///
		" & Mean & SD & Min & Max & Obs \\" ///
		"& (1) & (2) & (3) & (4) & (5) \\") ///
	varlabels(maghrib_dip "\hspace{2mm} Maghrib Dip" ///
		num_insurg_viol "\hspace{2mm} Violent Insurgent Events" ///
		num_other_insurg "\hspace{2mm} Other Insurgent Events" ///
		num_state_viol "\hspace{2mm} State-led Violence" ///
		num_other_state "\hspace{2mm} Other State-led Activity") ///
	refcat(maghrib_dip "\textbf{A. Variables at District-Month level}", nolabel) ///
	collabels(none) nomtitles noobs nonumbers compress $endoptions
	
esttab A2 using "${outputdir}/TabA5.tex", append booktabs fragment ///
	cells("mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3)) count(fmt(0))") ///
	varlabels(vpm_diff_avg_denom "\hspace{2mm} Maghrib Dip" ///
			  speipm12_g "\hspace{2mm} SPEI") ///
	refcat(vpm_diff_avg_denom "\textbf{B. Variables at Grid Cell-Month Level}", nolabel) ///
	posthead("") ///
	collabels(none) nomtitles noobs nonumbers compress $endoptions

esttab A3 using "${outputdir}/TabA5.tex", append booktabs fragment ///
	cells("mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3)) count(fmt(0))") ///
	varlabels(logdifevi "\hspace{2mm} EVI Max - December" ///
		spring_spei12 "\hspace{2mm} Growing Season SPEI" ///
		spring_vpm "\hspace{2mm} Maghrib Dip in Growing Season" ///
		harvest_vpm "\hspace{2mm} Maghrib Dip in Harvest Season" ///
		postharvest_vpm "\hspace{2mm} Maghrib Dip in Post-harvest Season") ///
	refcat(logdifevi "\textbf{C. Variables at Grid Cell-Year Level}", nolabel) ///
	posthead("") ///
	collabels(none) nomtitles noobs nonumbers compress $endoptions

esttab A4 using "${outputdir}/TabA5.tex", append booktabs fragment ///
	cells("mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3)) count(fmt(0))") ///
	varlabels(rainfed "\hspace{2mm} Fraction Rainfed Cropland" ///
		irrig_all "\hspace{2mm} Fraction Irrigated Cropland" ///
		rangeland "\hspace{2mm} Fraction Rangeland" ///
		other "\hspace{2mm} Fraction Land Type Aggregated Control" ///
		builtup "\hspace{2mm} Fraction Built-up") ///
	refcat(rainfed "\textbf{D. Variables at Grid Cell-Level}", nolabel) ///
	posthead("") postfoot(\bottomrule \end{tabular}) ///
	collabels(none) nomtitles noobs nonumbers compress $endoptions


	

* ===================================================================== *
* Table A6: Summary Stats of Additional Variables 
* ===================================================================== *

eststo clear

local main_individual mn_ix_imp_vimp_16 q12_16_e_imp_vimp q12_16_a_imp_vimp q12_16_d_imp_vimp /// 
	q12_16_f_imp_vimp q12_16_b_imp_vimp q12_16_c_imp_vimp

local addn_cellmonth vpm_diff_avg_denom_shortcode vpm_diff_avg_denom25 vpm_diff_avg_denom35 vpm_diff_avg_denom40 vpm_diff_before_denom vpm_diff_avg_denom_ihs ///
	total_vol_ihs

* District-Year Level - Poppy and ethn
local distyrlevel_vars opium_cult_ihs opium_interp_ihs

* Conflict - Grid-Cell
local conflict_vars cell_uppsala_0312 cell_uppsala_0320

* -----------------     	  Survey Variables        ----------------- *

/*
use "${datadir}/smallsurvey_finalsample.dta", clear

local other_individual age rural readwrite agri_land pashtun_ethn
eststo A0: estpost tabstat `main_individual' `other_individual', stat(mean sd min max count) columns(statistics) 
*/ 

* -----------------	            District Month       ------------------ *

use "${datadir}/cdr_and_conflict_dm.dta", clear

eststo A4: estpost tabstat maghrib_dip_shortcode maghrib_dip_nodiffhome3mo maghrib_dip_25min ///
	maghrib_dip_35min maghrib_dip_40min maghrib_dip_before_denom maghrib_dip_ihs total_vol_ihs access_dum45  access_num_missing, stat(mean sd min max count) columns(statistics) 


* -----------------          Gridcell-month Level         ----------------- *

use "${datadir}/cdr_and_climate_gm.dta", clear

* Identify Sample
reghdfe vpm_diff_avg_denom speipm12_g  if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
gen main_sample = e(sample)

eststo A1: estpost tabstat `addn_cellmonth' if main_sample == 1, stat(mean sd min max count) columns(statistics) 

* -----------------     	  District Level - Ethnicity       ----------------- *

use "${datadir}/dist_level.dta", clear

eststo A3: estpost tabstat ethn_pashto_ind ethn_dari_ind ethn_other_ind taliban_fg, stat(mean sd min max count) columns(statistics) 



* -----------------     	  District year Level - Poppy        ----------------- *

use "${datadir}/cdr_and_climate_gm.dta", clear 

* Identify Sample
reghdfe vpm_diff_avg_denom speipm12_g  if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
gen main_sample = e(sample)

keep if main_sample == 1

local distyrlevel_vars opium_cult_ihs opium_interp_ihs
collapse (mean) `distyrlevel_vars', by(district year)

eststo A5: estpost tabstat `distyrlevel_vars', stat(mean sd min max count) columns(statistics)


* -----------------     	  Latex Table        ----------------- *


*** Latex Table

file open fh using "${outputdir}/TabA6.tex", write replace
file write fh ///
"\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}" _n ///
"\begin{tabular}{l*{5}{c}} \toprule" _n ///
" & Mean & SD & Min & Max & Obs \\" _n ///
"& (1) & (2) & (3) & (4) & (5) \\" _n ///
"\midrule" _n
file close fh

* NOTE: Panel A summary statistics are manually entered because they rely on
* restricted individual-level survey data that cannot be publicly released
* due to privacy constraints.
file open fh using "${outputdir}/TabA6.tex", write append
file write fh ///
"`=char(92)'textbf{A. Variables at Individual Level (In Survey)} & & & & & \\" _n ///
"`=char(92)'hspace{2mm} Survey Religiosity Index & --0.000 & 0.833 & --3.792 & 0.298 & 1092 \\" _n ///
"`=char(92)'hspace{4mm} Reading the Quran Daily & 0.944 & 0.230 & 0.000 & 1.000 & 1092 \\" _n ///
"`=char(92)'hspace{4mm} Observing Namaz 5 Times per Day & 0.953 & 0.211 & 0.000 & 1.000 & 1092 \\" _n ///
"`=char(92)'hspace{4mm} No Alcohol & 0.935 & 0.247 & 0.000 & 1.000 & 1092 \\" _n ///
"`=char(92)'hspace{4mm} No Music & 0.738 & 0.440 & 0.000 & 1.000 & 1092 \\" _n ///
"`=char(92)'hspace{4mm} Fasting during Ramadan & 0.953 & 0.211 & 0.000 & 1.000 & 1092 \\" _n ///
"`=char(92)'hspace{4mm} Giving Zakat & 0.945 & 0.228 & 0.000 & 1.000 & 1092 \\" _n ///
"`=char(92)'hspace{2mm} Age & 39.577 & 14.049 & 16.000 & 87.000 & 1092 \\" _n ///
"`=char(92)'hspace{2mm} Rural & 0.495 & 0.500 & 0.000 & 1.000 & 1092 \\" _n ///
"`=char(92)'hspace{2mm} Read and Write & 0.620 & 0.486 & 0.000 & 1.000 & 1043 \\" _n ///
"`=char(92)'hspace{2mm} Own Agricultural Land & 0.245 & 0.431 & 0.000 & 1.000 & 1092 \\" _n ///
"`=char(92)'hspace{2mm} Pashtun & 0.177 & 0.382 & 0.000 & 1.000 & 1092 \\" _n
file close fh


esttab A4 using "${outputdir}/TabA6.tex", append booktabs fragment ///
	cells("mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3)) count(fmt(0))") ///
	varlabels(maghrib_dip_shortcode "\hspace{2mm} Maghrib Dip (Shortcode)" ///
			  maghrib_dip_nodiffhome3mo "\hspace{2mm} Maghrib Dip (Constant Home Location)" ///
			  maghrib_dip_25min "\hspace{2mm} Maghrib Dip (25 min)" ///
			  maghrib_dip_35min "\hspace{2mm} Maghrib Dip (35 min)" ///
			  maghrib_dip_40min "\hspace{2mm} Maghrib Dip (40 min)" ///
			  maghrib_dip_before_denom "\hspace{2mm} Maghrib Dip - Before Denom." ///
			  maghrib_dip_ihs "\hspace{2mm} Maghrib Dip - IHS" ///
			  total_vol_ihs "\hspace{2mm} IHS(Call Volume)"    ///
			  access_dum45  "\hspace{2mm} Taliban Control"     ///
			  access_num_missing "\hspace{2mm} Missing Indicator: Taliban Control" ///
			  ) ///
	refcat(maghrib_dip_shortcode "\textbf{B. Variables at District-Month Level}", nolabel) ///
	posthead("") ///
	collabels(none) nomtitles noobs nonumbers compress $endoptions

esttab A1 using "${outputdir}/TabA6.tex", append booktabs fragment ///
	cells("mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3)) count(fmt(0))") ///
	varlabels(vpm_diff_avg_denom_shortcode "\hspace{2mm} Maghrib Dip (Shortcode)" ///
			  vpm_diff_avg_denom25 "\hspace{2mm} Maghrib Dip (25 min)" ///
			  vpm_diff_avg_denom35 "\hspace{2mm} Maghrib Dip (35 min)" ///
			  vpm_diff_avg_denom40 "\hspace{2mm} Maghrib Dip (40 min)" ///
			  vpm_diff_before_denom "\hspace{2mm} Maghrib Dip - Before Denom." ///
			  vpm_diff_avg_denom_ihs "\hspace{2mm} Maghrib Dip - IHS" ///
			  total_vol_ihs "\hspace{2mm} IHS(Call Volume)") ///
	refcat(vpm_diff_avg_denom_shortcode "\textbf{C. Variables at Grid Cell-Month Level}", nolabel) ///
	posthead("") ///
	collabels(none) nomtitles noobs nonumbers compress $endoptions

esttab A3 using "${outputdir}/TabA6.tex", append booktabs fragment ///
	cells("mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3)) count(fmt(0))") ///
	varlabels(ethn_pashto_ind "\hspace{2mm} Plurality Pashto" ///
		ethn_dari_ind "\hspace{2mm} Plurality Dari" ///
		ethn_other_ind "\hspace{2mm} Plurality Neither Dari nor Pashto" ///
		taliban_fg "\hspace{2mm} District Experienced Any Taliban Control between 2015-2020 (PiX)") ///
	refcat(ethn_pashto_ind "\textbf{D. Variables at District Level}", nolabel) ///
	posthead("") ///
	collabels(none) nomtitles noobs nonumbers compress $endoptions

	
* NOTE: Panel E summary statistics are manually entered because they rely on
* individual-quater level mobile phone data that cannot be publicly released
* due to privacy constraints.
file open fh using "${outputdir}/TabA6.tex", write append
file write fh ///
"`=char(92)'textbf{E. Variables at Individual-Quarter Level (in CDR)}& & & & & \\" _n ///
"`=char(92)'hspace{2mm} Maghrib Dip & 10.198 & 100.014 & --200.000 & 200.000 & 78419140\\" _n ///
"`=char(92)'hspace{2mm} SPEI & --0.268 & 0.861 & --2.538 & 2.033 & 78419140\\" _n
file close fh
	
esttab A5 using "${outputdir}/TabA6.tex", append booktabs fragment ///
	cells("mean(fmt(3)) sd(fmt(3)) min(fmt(3)) max(fmt(3)) count(fmt(0))") ///
	varlabels(opium_cult_ihs "\hspace{2mm} Poppy - IHS" ///
		opium_interp_ihs "\hspace{2mm} Interpolated Poppy - IHS") ///
	refcat(opium_cult_ihs "\textbf{F. Variables at District-Year Level}", nolabel) ///
	posthead("") postfoot(\bottomrule \end{tabular}) ///
	collabels(none) nomtitles noobs nonumbers compress $endoptions



* ===================================================================== *
* Appendix Table A7: Addressing Accounts of how Violence affects
*  Religious Adherence
* ===================================================================== *

use "${datadir}/cdr_and_conflict_dm.dta", clear

local otherSIGACTSEvents num_other_insurg num_state_viol num_other_state

eststo C1: reghdfe maghrib_dip_shortcode num_insurg_viol `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"

eststo C0: reghdfe maghrib_dip_nodiffhome3mo num_insurg_viol `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"

esttab C1 C0 using "${outputdir}/TabA7.tex", replace booktabs fragment ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N districtFE monthFE controlsSIGACTS, fmt(%9.0f) ///
		labels("Observations" "District Fixed Effects" "Month Fixed Effects" "Controls for Other Insurgent Activity and State-led Actions")) ///
	drop(_cons `otherSIGACTSEvents') ///
	varlabels(num_insurg_viol "Insurgent Violence") ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule ///
		"& \multicolumn{2}{c}{Maghrib Dip (2013-2014)} \\" ///
		"\cmidrule(lr){2-3}") ///
	mgroups("\shortstack{Shortcode\\Calls}"  "\shortstack{Non-\\Movers}" , ///
		pattern(1 1) ///
		begin("\textit{Sample:}") prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), we restrict to shortcode calls when defining the Maghrib dip. In column (2), we restrict to individuals who have not changed their home location in the past 3 months. We define home location as the district where a caller has made the most calls in a given month. Controls for State-led Actions include the variables \textquotedblleft State-led Violence\textquotedblright~and \textquotedblleft Other State-led Activity\textquotedblright. Standard errors clustered on district shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions		
	

	
* ===================================================================== *
* Appendix Table A8: Insurgent Violence and Religious Adherence: 
* Robustness to Additonal Controls and Alternate Dip Measures
* ===================================================================== *

* alternate time windows
eststo clear
use "${datadir}/cdr_and_conflict_dm.dta", clear

eststo B1: reghdfe maghrib_dip_25min num_insurg_viol `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

eststo B2: reghdfe maghrib_dip_35min num_insurg_viol `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

eststo B3: reghdfe maghrib_dip_40min num_insurg_viol `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

eststo B4: reghdfe maghrib_dip_before_denom num_insurg_viol `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

eststo B5: reghdfe maghrib_dip_ihs num_insurg_viol `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

* Regressions
eststo A1: reghdfe maghrib_dip num_insurg_viol maghrib_dip_lag `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

eststo A2: reghdfe maghrib_dip num_insurg_viol total_vol_ihs `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local callvolcntrl "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

* taliban control: 
eststo Taliban2: reghdfe maghrib_dip num_insurg_viol access_dum45_nonmiss access_num_missing `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local callvolcntrl "Y"
estadd local controlsSIGACTS "Y"


esttab A* B* Taliban2 using "${outputdir}/TabA8.tex", replace booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N districtFE monthFE controlsSIGACTS space, fmt(%9.0f) labels("Observations" "District Fixed Effects" "Month Fixed Effects" "Controls for Other Insurgent" "\hspace{.2cm} Activity \& State-led Actions")) ///
	drop(_cons `otherSIGACTSEvents' access_num_missing) ///
	order(num_insurg_viol) ///
	varlabels(num_insurg_viol "Insurgent Violence" ///
		maghrib_dip_lag "Maghrib Dip\textsubscript{t-1}" ///
		total_vol_ihs "IHS(Total Volume)"    ///
		access_dum45_nonmiss "Taliban Control"   ///
		) ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule) ///
	mgroups("Maghrib Dip (2013-2014)", pattern(1 0 0 0 0 0 0 0) ///
		  prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	mtitles( "(Main)" "(Main)" "(25 min)" "(35 min)" "(40 min)" "(Before Denom.)" "(IHS)" "(Main)") ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "Column (1) controls for the Maghrib dip in the previous month. Column (2) controls for the inverse hyperbolic sine (IHS) transform of the average daily call volume in a month. Columns (3)-(5) construct the outcome by considering the change in call volume 25, 35, and 40 minutes before and after the start of Maghrib, respectively. In column (6), the Maghrib dip is constructed by scaling the change in call volume 30 minutes before and after by the volume 30 minutes before. In column (7), the dependent variable is the IHS transform of the ratio of call volume in the 30 minutes before Maghrib over the average call volume in 30 minutes before and after. Column (8) controls for Taliban control, based on a binary indicator for whether a survey firm could access the district (1 if a district was coded as \textquotedblleft Totally inaccessible\textquotedblright~or \textquotedblleft No women – only men can work there\textquotedblright; 0 otherwise), as well as a dummy variable for missing values of Taliban control. Each regression is at the district-month level, using data from April 2013 to December 2014. Controls for State-led Actions include the variables \textquotedblleft State-led Violence\textquotedblright~and \textquotedblleft Other State-led Activity\textquotedblright. Standard errors, clustered by district, are shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) noobs compress nogaps $endoptions

	
	
* ===================================================================== *
* Table A9: Insurgent Violence and Religious Adherence: 
* Robustness to Various Samples
* ===================================================================== *	

use "${datadir}/cdr_and_conflict_dm.dta", clear

* No Hazara
eststo E2: reghdfe maghrib_dip num_insurg_viol `otherSIGACTSEvents' if hazara1 == 0, absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

* Dropping Ramadan Days
eststo E1: reghdfe maghrib_dip_noram num_insurg_viol `otherSIGACTSEvents', absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

* Bottom 5% volume / user/call
eststo E3: reghdfe maghrib_dip num_insurg_viol `otherSIGACTSEvents' if numhashes_qtile_pre2015 > 5 & numhashes_qtile_pre2015 != . , absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "

eststo E4: reghdfe maghrib_dip num_insurg_viol `otherSIGACTSEvents'  if vol_qtile_pre2015 > 5 & vol_qtile_pre2015 != . , absorb(trendval distid) cluster(distid)
estadd local districtFE "Y"
estadd local monthFE "Y"
estadd local controlsSIGACTS "Y"
estadd local space " "
	
esttab E* using "${outputdir}/TabA9.tex", replace booktabs fragment ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N districtFE monthFE controlsSIGACTS space, fmt(%9.0f) ///
		labels("Observations" "District Fixed Effects" "Month Fixed Effects" "Controls for Other Insurgent" "\hspace{.2cm} Activity \& State-led Actions")) ///
	drop(_cons `otherSIGACTSEvents') ///
	varlabels(num_insurg_viol "Insurgent Violence") ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule ///
		"& \multicolumn{4}{c}{Maghrib Dip (2013-2014)} \\" ///
		"\cmidrule(lr){2-5}") ///
	mgroups("\shortstack{Non-Ramadan\\Days}" "\shortstack{Non-Hazara\\Districts}" ///
	"\shortstack{\# Users\\(Top 95\%)}" "\shortstack{Call Volume\\(Top 95\%)}", ///
		pattern(1 1 1 1 1 1) ///
		begin("\textit{Sample:}") prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "Column (1) excludes Ramadan days. Column (2) excludes districts in which at least 5\% of villages speak primarily Hazaragi. Column (3) excludes the 5\% of districts that have the fewest number of active mobile phone subscribers over 2013-2014. Column (4) excludes the 5\% of districts with the lowest call volume over 2013-2014. Controls for State-led Actions include the variables \textquotedblleft State-led Violence\textquotedblright~and \textquotedblleft Other State-led Activity\textquotedblright. Standard errors clustered on district shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions	

	
	
	
* ===================================================================== *
* Appendix Table A10: Climate and Religious Adherence: Robustness to 
* Additional Controls & Alternate Dip Measures
* ===================================================================== *
	

eststo clear
use "${datadir}/cdr_and_climate_gm.dta", clear


eststo A3: reghdfe vpm_diff_avg_denom25 speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats
estadd local clusteredOn "Grid Cell"

eststo A4: reghdfe vpm_diff_avg_denom35 speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats
estadd local clusteredOn "Grid Cell"

eststo A5: reghdfe vpm_diff_avg_denom40 speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats
estadd local clusteredOn "Grid Cell"

eststo A1: reghdfe vpm_diff_before_denom speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats
estadd local clusteredOn "Grid Cell"

eststo A2: reghdfe vpm_diff_avg_denom_ihs speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats
estadd local clusteredOn "Grid Cell"

eststo A8: reghdfe vpm_diff_avg_denom speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(district)
add_stats
estadd local clusteredOn "District"

eststo A6: reghdfe vpm_diff_avg_denom speipm12_g vpm_diff_avg_denom_lag if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats
estadd local clusteredOn "Grid Cell"

eststo A7: reghdfe vpm_diff_avg_denom speipm12_g total_vol_ihs if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats
estadd local clusteredOn "Grid Cell"


* latex table
esttab A1 A2 A3 A4 A5 A6 A7 A8  using "${outputdir}/TabA10.tex", replace booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N gridFE monthFE clusteredOn, fmt(%9.0f) ///
		labels("Observations" "Grid Cell Fixed Effects" "Month Fixed Effects" "Clustering on")) ///
	drop(_cons) ///
	order(speipm12_g) ///
	varlabels(speipm12_g "SPEI" ///
		vpm_diff_avg_denom_lag "Maghrib Dip\textsubscript{t-1}" ///
		total_vol_ihs "IHS(Total Volume)") ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule) ///
	mgroups("Maghrib Dip", pattern(1 0 0 0 0 0 0 0) ///
    prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	mtitles("(Before Denom.)" "(IHS)" "(25 min)" "(35 min)" "(40 min)" "(Main)"  "(Main)" "(Main)") ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), the Maghrib dip is constructed by scaling the change in call volume 30 minutes before and after by the volume 30 minutes before. In column (2), we take the Inverse hyperbolic sine (IHS) transform of the ratio of call volume in the 30 minutes before over the average call volume in the before and after periods. In columns (3)-(5), we construct the Maghrib dip measure by considering the change in all volume 25, 35, and 40 minutes before and after the start of Maghrib, respectively. Column (6) controls for the Maghrib dip in the previous month. Column (7) controls for the IHS transform of the average daily call volume in a month. In column (8), standard errors are clustered on district, as opposed to on grid. In columns (1)-(7), standard errors clustered on grid cell shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) noobs compress nogaps $endoptions	
	
	
	
* ========================================================================= *
* Table A11: Climate and Religious Adherence: Robustness to Various Samples 		
* ========================================================================== *

eststo clear
use "${datadir}/cdr_and_climate_gm.dta", clear

*** Regressions
* No Build Up
eststo A5: reghdfe vpm_diff_avg_denom speipm12_g  if builtup5 == 0 & cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats

* No Hazara
eststo A1: reghdfe vpm_diff_avg_denom speipm12_g  if hazara1 == 0 & cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats

* No Taliban
eststo A6: reghdfe vpm_diff_avg_denom speipm12_g  if taliban_fg == 0 & cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats

* Dropping Ramadan Days
eststo A2: reghdfe vpm_diff_avg_denom_noramadan speipm12_g  if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats

* dropping low user/call grids - all years
eststo A3: reghdfe vpm_diff_avg_denom speipm12_g if numhashes_qtile_allyears > 5 & numhashes_qtile_allyears != . & cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats

eststo A4: reghdfe vpm_diff_avg_denom speipm12_g  if vol_qtile_allyears > 5 & vol_qtile_allyears != . & cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats

* latex table using all year baseline
esttab A1 A2 A3 A4 A5 A6 using "${outputdir}/TabA11.tex", replace booktabs fragment ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N gridFE monthFE, fmt(%9.0f) ///
		labels("Observations" "Grid Cell Fixed Effects" "Month Fixed Effects")) ///
	drop(_cons) ///
	varlabels(speipm12_g "SPEI") ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule ///
		"& \multicolumn{6}{c}{Maghrib Dip} \\" ///
		"\cmidrule(lr){2-7}") ///
	mgroups("\shortstack{Non-Hazara\\Districts}" "\shortstack{Non-Ramadan\\Days}" ///
		"\shortstack{Users\\(Top 95\%)}" ///
		"\shortstack{Call Volume\\(Top 95\%)}" ///
		"\shortstack{Non-Urban\\Areas}" "\shortstack{Non-Taliban\\Districts}", ///
		pattern(1 1 1 1 1 1) ///
		begin("\textit{Sample:}") prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), we drop grids in which at least 5\% of villages speak Hazaragi. In column (2), we drop Ramadan days. In column (3), we drop the sparsest 5\% of grids, defining sparsity based on the number of mobile phone users within the grid cell over 2013-2020. In column (4), we drop the bottom 5\% of grids in terms of 2013-2020 call volume. In column (5), we drop the urban areas defined as those in which the fraction of the grid cell with \textquotedblleft built up\textquotedblright~area exceeds 5\%. In column (6), we drop districts under Taliban control, which is directly measured in the PiX data for the 2015-2020 period. Standard errors clustered on grid cell shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions
	

	
* ======================================================================== *
* Table A12: Climate and Religious Adherence: Addressing Alternate Accounts 
* ======================================================================== *

eststo clear

use "${datadir}/cdr_and_climate_gm.dta", clear

eststo A1: reghdfe vpm_diff_avg_denom_shortcode speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats


eststo B1: reghdfe call_vol_ihs speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats


eststo B2: reghdfe vpm_diff_avg_denom_continu speipm12_g if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
add_stats



eststo C1: reghdfe vpm_diff_avg_denom_nonmove speipm12_g , absorb(trendval cell_id) cluster(cell_id)
add_stats
	
esttab A1 B1 B2 C1 using "${outputdir}/TabA12.tex", replace booktabs fragment ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N gridFE monthFE, fmt(%9.0f) ///
		labels("Observations" "Grid Cell Fixed Effects" "Month Fixed Effects")) ///
	drop(_cons) ///
	varlabels(speipm12_g "SPEI") ///
	prehead(\begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule ///
		"&  \multicolumn{1}{c}{Maghrib Dip} & \multicolumn{1}{c}{IHS(Call Volume)} & \multicolumn{2}{c}{Maghrib Dip} \\" ///
		"\cmidrule(lr){2-2} \cmidrule(lr){3-5}") ///
	mgroups("Shortcode" "Full Sample" "In Sample Continuously" "Non-Movers", pattern(1 1 1 1)) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), the dependent variable is the Maghrib dip restricted to shortcode calls. In column (2), the outcome is the IHS transform of the average daily call volume in a month in a grid cell. In columns (3) and (4), the dependent variable is the Maghrib dip across different sample restrictions. In column (3), we restrict the sample to callers who have made at least 1 call in each of the past 3 months. In column (4), in each month, we restrict the sample to users who have only made calls from the same home location over the previous 3 months. We define home location as the district where a caller has made the most calls in a given month. Standard errors clustered on grid cell shown in parentheses. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable}) ///
	collabels(none) nomtitles noobs compress nogaps $endoptions

	
	
* =============================================================================== *
* Table A13: Climate and Religious Adherence: Heterogeneity by Initial Religiosity 
* =============================================================================== *

* NOTE: This table is not reproduced here because it relies on individual-quater
* level mobile phone data that cannot be publicly released due to privacy constraints.


* ===================================================================== *
* Table A14: Climate and Religious Adherence: Role of Poppy Cultivation 
* ===================================================================== *

use "${datadir}/cdr_and_climate_gm.dta", clear

reghdfe vpm_diff_avg_denom speipm12_g  if cell_cdr == 1, absorb(trendval cell_id) cluster(cell_id)
gen main_sample = e(sample)

eststo clear

* Regressions
eststo A1: reghdfe opium_cult_ihs speipm12_g if main_sample == 1 & cell_cdr == 1, absorb(trendval cell_id) cluster(district)
add_stats

eststo A2: reghdfe opium_interp_ihs speipm12_g if main_sample == 1 & cell_cdr == 1, absorb(trendval cell_id) cluster(district)
add_stats

eststo A3: reghdfe vpm_diff_avg_denom speipm12_g opium_cult_wmiss_ihs opium_cult_miss_ind if cell_cdr == 1, absorb(trendval cell_id) cluster(district)
add_stats
estadd local poppyctrl "Y"

eststo A4: reghdfe vpm_diff_avg_denom speipm12_g opium_interp_wmiss_ihs opium_interp_miss_ind if cell_cdr == 1, absorb(trendval cell_id) cluster(district)
add_stats
estadd local poppyintctrl "Y"

* latex table
esttab A* using "${outputdir}/TabA14.tex", replace booktabs ///
	cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
	stats(N gridFE monthFE poppyctrl poppyintctrl, fmt(%9.0f) ///
		labels("Observations" "Grid Cell Fixed Effects" "Month Fixed Effects" "Controls – IHS(Poppy)" "Controls – IHS(Int. Poppy)")) ///
	keep(speipm12_g) ///
	varlabels(speipm12_g "SPEI") ///
	prehead("{" \begin{threeparttable} \def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi} \begin{tabular}{l*{@M}{c}} \toprule ) ///
	mgroups("IHS(Poppy)" "IHS(Interpolated Poppy)" "Maghrib Dip" "Maghrib Dip", pattern(1 1 1 0) ///
		  prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	postfoot(\bottomrule \end{tabular} \begin{tablenotes}[flushleft] ///
\vspace{.1cm} \item \footnotesize \textit{Notes:} "In column (1), the dependent variable is the IHS transform of hectares of land cultivated with poppy. In column (2), the dependent variable is the IHS transform of linearly interpolated poppy cultivation. In columns (3) and (4), the dependent variable is the Maghrib dip, and we control for the IHS transform of the poppy cultivation and the IHS transform of linearly interpolated poppy cultivation, respectively. The poppy cultivation variable is a the district-year level. Regressions are at the grid cell-month level, with standard errors clustered on grid cell shown in parentheses. In columns (3) and (4), missing values of the poppy control variable are filled in by an arbitrary number (zero) and an additional control variable is included indicating if missing values have been filled in this way. *p$<$.10, ** p$<$.05, *** p$<$.01." ///
\end{tablenotes} ///
\end{threeparttable} "}") ///
	collabels(none) nomtitles noobs compress nogaps $endoptions

	
