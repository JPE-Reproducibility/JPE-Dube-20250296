### `README` Analysis

👉 We are considering the file at 

```
/Users/florianoswald/actions-runner/_work/JPE-Dube-20250296/JPE-Dube-20250296/replication-package/replication package/README.md 
```
to be the relevant `README`.


**Wrong `README` location warning:**

The `README` file needs to be placed at the root of your replication package. **Please fix.**

#### Keyword search

👉 We searched the readme for keywords to help the reproducibility team. This is only for internal use. 

_Replicator_: The line numbers refer to the readme file printed above.


Line 10 : This package includes aggregated datasets and code that are sufficient to reproduce all results except Tables A2, A3, A13, and Figure A2. The individual call detail records (CDR) are proprietary and cannot be shared. Similarly, the small household survey on religious practices and the cell-tower coordinates are confidential and thus excluded as well. Readers should therefore expect to find synthetic data wherever the original data would appear. See Section 2 for full details on data availability.
Line 39 : ### Confidential data that cannot be made available publicly:
Line 60 : These datasets contain the Maghrib dip (the paper's measure of religious adherence) constructed from the confidential raw CDR. They also incorporate the following publicly available data sources:
Line 76 : 2. **Synthetic individual-quarter CDR panel** (`Data/tables_data/synthetic/hash_grid_qtr_panel_synthetic.csv`): 100 fabricated observations substituting for the confidential CDR panel used in Table A13. All estimates produced from this file are meaningless.
Line 77 : 3. **Synthetic survey microdata** (`Data/tables_data/synthetic/smallsurvey_finalsample_synthetic.{dta,csv}`): 20 fabricated observations substituting for the confidential survey microdata used in Tables A2 and A3. All estimates produced from this file are meaningless.
Line 78 : 4. **Synthetic antenna coordinates** (`Data/figures_data/synthetic/cell_lookup_antenna_synthetic.csv`): 5 fabricated tower locations substituting for the confidential antenna geolocation file used in Figure A2. The output map is a meaningless placeholder.
Line 103 : 6. `Code/Cleaning/01–13` documents the full pipeline from raw CDR to analysis-ready datasets and is included for reference only — these scripts cannot be run without the confidential CDR data on the secure server.
Line 123 : | Table A6 | `All_Tables.do` | `TabA6.tex` | `cdr_and_conflict_dm.dta`, `cdr_and_climate_gm.dta`, `dist_level.dta` (Panels A and E use hardcoded summary stats from confidential data) | Yes |
Line 204 : **With full confidential CDR data (estimated):**
Line 215 : **Hardware (CDR cleaning pipeline):** Requires a secure high-memory server; not executable without the confidential CDR data.
