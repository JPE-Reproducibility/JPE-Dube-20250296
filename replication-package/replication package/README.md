# Replication Package

**Paper:** Measuring Religion from Behavior: Violence, Climate Shocks and Religious Adherence in Afghanistan  
**Authors:** Oeindrila Dube, Joshua E. Blumenstock, Michael Callen

---

## 1. Package Overview

This package includes aggregated datasets and code that are sufficient to reproduce all results except Tables A2, A3, A13, and Figure A2. The individual call detail records (CDR) are proprietary and cannot be shared. Similarly, the small household survey on religious practices and the cell-tower coordinates are confidential and thus excluded as well. Readers should therefore expect to find synthetic data wherever the original data would appear. See Section 2 for full details on data availability.

**Folder structure:**

```
replication package/
├── Code/
│   ├── Cleaning/          # CDR cleaning pipeline
│   └── Analysis/          # Table and figure scripts
├── Data/
│   ├── raw_CDR/           # Synthetic CDR raw data
│   ├── tables_data/       # Analysis-ready data for tables
│   │   └── synthetic/     # Synthetic placeholders
│   └── figures_data/      # Aggregated data for figures
│       ├── country_shp/   # Country boundary shapefile
│       ├── district_shp/  # District boundary shapefile
│       └── synthetic/     # Synthetic antenna coordinates 
├── Output/
│   ├── Tables/            # .tex table output
│   └── Figures/           # PDF/PNG figure output
├── README.md
├── codebook.md            # variable descriptions for datasets
└── LICENSE.txt            # CC BY 4.0
```

---

## 2. Data Availability Statement

### Confidential data that cannot be made available publicly: 

1. **Raw transaction-level CDR:** The primary data source is anonymized transaction-level call detail records (CDR) from one of Afghanistan's largest mobile network operators. The data include records for phone calls, SMS, data usage, and shortcode calls. It was obtained through a legal agreement between the authors' university and the Afghanistan Telecommunications Regulatory Authority. Due to privacy constraints and the terms of that agreement, the raw phone data **cannot be shared** outside the research team and are not included in this replication package.
2. **Individual-quarter CDR panel** (~78 million observations, used in Table A13): Cannot be shared for the same reason above.
3. **Individual-level survey microdata** (used in Tables A2 and A3): A small household survey including religious practices conducted in October 2015, covering 1,000+ individuals in Parwan and Kabul provinces (Blumenstock et al., 2024).
4. **Cell tower coordinates** (antenna geolocation file): Cannot be released due to privacy constraints; also prevents reproduction of Figure A2.

### Data included in this package: 

1. **Analysis-ready datasets** (`Data/tables_data/`): Seven aggregated, analysis-ready datasets at the district-month, grid-cell-month/year, grid-cell, or district level. These are the direct inputs to all analysis scripts:

   | Dataset | Level |
   |---------|-------|
   | `cdr_and_conflict_dm.dta` | District × month |
   | `cdr_and_climate_gm.dta` | Grid cell × month |
   | `cdr_and_climate_gy.dta` | Grid cell × year |
   | `calls_shortcode_comparison_dm.dta` | District × month × transaction type |
   | `calls_shortcode_comparison_gm.dta` | Grid cell × month × transaction type |
   | `dist_level.dta` | District (cross-section) |
   | `grid_level.dta` | Grid cell (cross-section) |

   These datasets contain the Maghrib dip (the paper's measure of religious adherence) constructed from the confidential raw CDR. They also incorporate the following publicly available data sources:
   - **Conflict:** SIGACTS violence counts (ISAF Significant Activities database; https://github.com/knapply/data4ds4da/blob/master/data/sigacts_afghanistan_df.rda)
   - **Climate:** SPEI (12-month Standardized Precipitation-Evapotranspiration Index on a 10 km × 10 km grid, ERA5-Land-based, Vicente-Serrano et al. 2010; Muñoz-Sabater et al. 2021) and EVI (Enhanced Vegetation Index, MODIS MOD13A3.061, aggregated following Asher and Novosad 2020)
   - **Agriculture:** grid-cell irrigation indicator (FAO 2021, *Aggregated Land Cover Database of Afghanistan*) and district-year poppy cultivation (UNODC 2021)
   - **District accessibility:** monthly district-level accessibility scores constructed following Wright (2024), from ACSOR (https://acsor-surveys.com/)
   - **Taliban presence:** district-level administrative control data from Protected Internet Exchange (PIX, https://pixtoday.net)
   - **Ethnicity:** plurality language derived from 2012 village-level data compiled by AIMS, the Central Statistics Organization, USAID, and Yale University
   - **Geographic components:** Afghanistan district boundaries (AIMS, 398 districts), country boundary (GADM v3.6), grid raster mask (from ERA5-Land-based SPEI raster), and cell-district crosswalk

2. **Figures data** (`Data/figures_data/`): Pre-aggregated data files used by the figure scripts to produce all figures except Figure A2. Includes district and country shapefiles (AIMS; GADM v3.6).



### Synthetic placeholders:

1. **Synthetic CDR raw data** (`Data/raw_CDR/`): Four 5-observation fabricated files illustrating the column structure of the raw CDR inputs — one each for phone calls, SMS, shortcode calls, and data usage. All subscriber hashes and tower IDs are fabricated.
2. **Synthetic individual-quarter CDR panel** (`Data/tables_data/synthetic/hash_grid_qtr_panel_synthetic.csv`): 100 fabricated observations substituting for the confidential CDR panel used in Table A13. All estimates produced from this file are meaningless.
3. **Synthetic survey microdata** (`Data/tables_data/synthetic/smallsurvey_finalsample_synthetic.{dta,csv}`): 20 fabricated observations substituting for the confidential survey microdata used in Tables A2 and A3. All estimates produced from this file are meaningless.
4. **Synthetic antenna coordinates** (`Data/figures_data/synthetic/cell_lookup_antenna_synthetic.csv`): 5 fabricated tower locations substituting for the confidential antenna geolocation file used in Figure A2. The output map is a meaningless placeholder.

---

## 3. Statement about Rights

The authors certify that:

1. They have legitimate access and appropriate permission to use each dataset listed in Section 2.
2. All datasets included in this package are redistributed with permission or are in the public domain, with the following exceptions:
   - CDR transaction data (raw and hash-quarter level CDR); Cell tower coordinates; Survey microdata  


---

## 4. Instructions to Reproduce Results

JPE has granted a partial exemption to the Data Policy. **All tables except A2, A3, and A13 — and all figures except Figure A2 — are fully reproducible** with the data in this package. Tables A2, A3, A13, and Figure A2 run with synthetic placeholders but produce meaningless results. `TabA13.R` sets `set.seed(123)` before the 600-iteration bootstrap; no other stochastic steps are present.

1. Install all software and packages listed in Sections 6 and 7.
2. In `Code/Analysis/All_Tables.do`, update `global root "..."` on line 71 to the package root path. In `Code/Analysis/TabA13.R`, update `root = '...'` on line 39. All R figure scripts resolve paths automatically via `this.path` and require no changes, **except `FigA2.qmd`**: update `maindir` in its setup chunk to the package root path.
3. Run `Code/Analysis/All_Tables.do` in Stata for tables.
4. Run `Code/Analysis/All_Figures.R` in R for all figures except Figure A2.
5. Render `Code/Analysis/FigA2.qmd` in R/Quarto for Figure A2 (runs independently; output is a meaningless placeholder using synthetic data).
5. Run `Code/Analysis/TabA13.R` in R for Table A13. Output: `Output/Tables/TabA13.tex` (estimates are meaningless with synthetic data).
6. `Code/Cleaning/01–13` documents the full pipeline from raw CDR to analysis-ready datasets and is included for reference only — these scripts cannot be run without the confidential CDR data on the secure server.

---

## 5. Output Locations

All output files are generated by the scripts in `Code/Analysis/`. Tables are saved as `.tex` to `Output/Tables/`; figures are saved as PDF or PNG to `Output/Figures/`.

### Tables

| Exhibit | Script | Output File | Data Used | Reproducible? |
|---------|--------|-------------|-----------|--------------|
| Table 1 | `All_Tables.do` | `Tab1.tex` | `cdr_and_conflict_dm.dta` | Yes |
| Table 2 | `All_Tables.do` | `Tab2.tex` | `cdr_and_climate_gm.dta`, `cdr_and_climate_gy.dta` | Yes |
| Table 3 | `All_Tables.do` | `Tab3.tex` | `cdr_and_climate_gy.dta` | Yes |
| Table A1 | `All_Tables.do` | `TabA1.tex` | `calls_shortcode_comparison_dm.dta`, `_gm.dta` | Yes |
| Table A2 | `All_Tables.do` | `TabA2.tex` | `synthetic/smallsurvey_finalsample_synthetic.dta` | **Synthetic only** |
| Table A3 | `All_Tables.do` | `TabA3.tex` | `synthetic/smallsurvey_finalsample_synthetic.dta` | **Synthetic only** |
| Table A4 | `All_Tables.do` | `TabA4.tex` | `dist_level.dta`, `grid_level.dta` | Yes |
| Table A5 | `All_Tables.do` | `TabA5.tex` | `cdr_and_conflict_dm.dta`, `cdr_and_climate_gm.dta`, `cdr_and_climate_gy.dta`, `grid_level.dta` | Yes |
| Table A6 | `All_Tables.do` | `TabA6.tex` | `cdr_and_conflict_dm.dta`, `cdr_and_climate_gm.dta`, `dist_level.dta` (Panels A and E use hardcoded summary stats from confidential data) | Yes |
| Table A7 | `All_Tables.do` | `TabA7.tex` | `cdr_and_conflict_dm.dta` | Yes |
| Table A8 | `All_Tables.do` | `TabA8.tex` | `cdr_and_conflict_dm.dta` | Yes |
| Table A9 | `All_Tables.do` | `TabA9.tex` | `cdr_and_conflict_dm.dta` | Yes |
| Table A10 | `All_Tables.do` | `TabA10.tex` | `cdr_and_climate_gm.dta` | Yes |
| Table A11 | `All_Tables.do` | `TabA11.tex` | `cdr_and_climate_gm.dta` | Yes |
| Table A12 | `All_Tables.do` | `TabA12.tex` | `cdr_and_climate_gm.dta` | Yes |
| Table A13 | `TabA13.R` | `TabA13.tex` | `synthetic/hash_grid_qtr_panel_synthetic.csv` | **Synthetic only** |
| Table A14 | `All_Tables.do` | `TabA14.tex` | `cdr_and_climate_gm.dta` | Yes |

### Figures

| Exhibit | Script | Output File(s) | Data Used | Reproducible? |
|---------|--------|----------------|-----------|--------------|
| Figure 1 | `Fig1.R` | `day_callvol.pdf`, `day_callvol_zoomed.pdf` | `cdr_relativemins_data.csv` | Yes |
| Figure 2 | `Fig2.R` | `heatmap_full_w_sunrise.png`, `heatmap_zoomed.png` | `cdr_relativemins_day_1516_withsun.csv` | Yes |
| Figure 3 | `Fig3.R` | `day_shortcodevol_zoomed.pdf`, `day_smsvol_zoomed.pdf`, `day_datavol_zoomed.pdf` | `cdr_shortcode_relativemins_data.csv`, `cdr_sms_relativemins_data.csv`, `cdr_data_relativemins_data.csv` | Yes |
| Figure 4 | `Fig4.R` | `religiosity_by_districts_pashto.png` | `cdr_ethnicity_distlevel.csv`, `district_shp/district398.shp` | Yes |
| Figure A2 | `FigA2.qmd` (run independently) | `FigA2_cell_towers_in_afg.pdf` | `country_shp/gadm36_AFG_0.shp`, `district_shp/district398.shp`, `synthetic/cell_lookup_antenna_synthetic.csv` | **Synthetic only** |
| Figure A3 | `FigA3.R` | `users_by_month.pdf` | `n_users_combined.csv` | Yes |
| Figure A4 | `FigA4.R` | `survey_barplots_*.png` (6 files) | `survey_relig_aggregated_counts.csv` | Yes |
| Figure A5 | `FigA5.R` | `sigacts_insurgent_violence_heatmap.png`, `sigacts_stateled_violence_heatmap.png`, `sigacts_other_insurgent_heatmap.png`, `sigacts_other_stateled_heatmap.png`, `legend.png` | `sigacts_afghanistan.csv`, `SIGACTS_event_classifications.csv`, `district_shp/district398.shp` | Yes |
| Figure A6 | `FigA6.R` | `spei_by_district.pdf` | `spei_cellym.dta`, `rasterwithmask.nc` | Yes |

---

## 6. Software Requirements

| Software | Version | Operating System | Used by |
|----------|---------|-----------------|---------|
| Stata | StataNow 19.5 SE (x86-64) | Windows (tested); macOS and Linux also supported | `Code/Analysis/All_Tables.do`, `Code/Cleaning/11–13` |
| R | 4.4.0 (x86-64) | Windows (tested); macOS and Linux also supported | `Code/Analysis/TabA13.R`, `Fig*.R`, `Code/Cleaning/10` |
| Quarto | ≥ 1.4 | Windows (tested); macOS and Linux also supported | `Code/Analysis/FigA2.qmd` |
| Python | 3.10.x | Any | `Code/Cleaning/02–09` (not executable without CDR data) |

---

## 7. Packages and Libraries

### Stata

```stata
ssc install estout
ssc install reghdfe
ssc install ftools     // install before reghdfe
ssc install winsor2
ssc install egenmore
```

> Set `global install_package 1` at the top of `All_Tables.do` to install all packages on first run.

### R

```r
install.packages(c(
  "this.path", "data.table", "fixest", "tidyverse", "haven",
  "sf", "stars", "cowplot", "patchwork", "ggpointdensity", "MASS",
  "ggtext", "xtable", "DescTools", "ggthemes", "geosphere",
  "fastcluster", "kableExtra", "scales", "grid", "rlang",
  "lubridate", "magrittr", "pacman"
))
```


### Python

Requires Python 3.10.x with: `pandas`, `numpy`, `polars`, `pyreadstat`, `geopandas`. These scripts are included for documentation only.

---

## 8. Expected Running Time

**With included data (synthetic CDR):**

| Script | Runtime |
|--------|---------|
| `Code/Analysis/All_Tables.do` | < 1 minute |
| `Code/Analysis/All_Figures.R` | ~1–2 minutes |
| `Code/Analysis/FigA2.qmd` | < 1 minute |
| `Code/Analysis/TabA13.R` | ~1–5 minutes |

**With full confidential CDR data (estimated):**

| Script | Runtime | 
|--------|---------|
| `Code/Cleaning/01–09` (Python/R) | Days–weeks |
| `Code/Cleaning/10–13` (R/Stata) | < Several hours |
| `Code/Analysis/All_Tables.do` | < 1 hour |
| `Code/Analysis/TabA13.R` | ~120 hours |

**Hardware (analysis scripts):** Windows 11 Enterprise; Intel Core i7-12700H (20 logical cores); 16 GB RAM. The runtimes above were measured on this machine.

**Hardware (CDR cleaning pipeline):** Requires a secure high-memory server; not executable without the confidential CDR data.

---

## 9. Data Citations

Asher, Sam, and Paul Novosad. 2020. "Rural Roads and Local Economic Development." *American Economic Review* 110 (3): 797–823.

Blumenstock, Joshua, Michael Callen, Tarek Ghani, and Robert Gonzalez. 2024. "Violence and Financial Decisions: Evidence from Mobile Money in Afghanistan." *The Review of Economics and Statistics* :1–45.

FAO. 2021. "Aggregated Land Cover Database of the Islamic Republic of Afghanistan (2010)." https://data.apps.fao.org/map/catalog/srv/eng/catalog.search?id=1289#/metadata/1dd35e22-bd51-4c4d-bf0c-546baababe74

International Security Assistance Force (ISAF). *Significant Activities (SIGACTS) Database*. https://github.com/knapply/data4ds4da/blob/master/data/sigacts_afghanistan_df.rda

Muñoz-Sabater, Joaquín, et al. 2021. "ERA5-Land: A State-of-the-Art Global Reanalysis Dataset for Land Applications." *Earth System Science Data* 13 (9): 4349–4383. https://doi.org/10.5194/essd-13-4349-2021

NASA EOSDIS Land Processes DAAC. 2021. *MODIS/Terra Vegetation Indices Monthly L3 Global 1km SIN Grid V061*. Accessed 2022-01-27 from https://doi.org/10.5067/MODIS/MOD13A3.061 

Protected Internet Exchange (PIX). 2023. "Areas of Control in Afghanistan." https://pixtoday.net. Accessed: 2023-10-01.

UNODC. 2021. *Afghanistan Opium Survey 2019*. Tech. rep. Vienna: UNODC. https://www.unodc.org/documents/crop-monitoring/Afghanistan/20210217_report_with_cover_for_web_small.pdf


Vicente-Serrano, Sergio M., Santiago Beguería, and Juan I. López-Moreno. 2010. "A Multiscalar Drought Index Sensitive to Global Warming: The Standardized Precipitation Evapotranspiration Index." *Journal of Climate* 23 (7): 1696–1718.

Wright, Austin. 2024. "Territorial Control." Seminar Slides. https://www.austinlwright.com/territorial-control


---

