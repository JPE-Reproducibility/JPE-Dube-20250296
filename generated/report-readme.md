### `README` Analysis

👉 We are considering the file at 

```
/var/folders/5q/yhcyv3z55wvg6lhgc3h22kk00000gq/T/20250296-2/replication-package/replication package/README.md 
```
to be the relevant `README`.


**Wrong `README` location warning:**

The `README` file needs to be placed at the root of your replication package. **Please fix.**

#### Keyword search

👉 We searched the readme for keywords to help the reproducibility team. This is only for internal use. 

_Replicator_: The line numbers refer to the readme file printed above.


Line 9 : This package includes datasets and code that are sufficient to reproduce all results except Tables A2, A3, A13, and Figure A2. The individual call detail records (CDR) are proprietary and cannot be shared. Similarly, the small household survey on religious practices and the cell-tower coordinates are confidential and thus excluded as well. Readers should therefore expect to find synthetic data wherever the original data would appear. See Section 2 for full details on data availability.
Line 38 : ### Confidential data that cannot be made available publicly:
Line 40 : 1. **Raw transaction-level CDR:** The primary data source is anonymized transaction-level call detail records (CDR) from one of Afghanistan's largest mobile network operators. The data include records for phone calls, SMS, data usage, and shortcode calls. **These records were provided to us by the telecommunications company pursuant to a signed confidentiality agreement that restricts our ability to communicate, disseminate, or disclose confidential information supplied by the company.** The agreement provides continuing protection for information that is proprietary. Because the transaction-level CDR are proprietary, non-public telecommunications records supplied under this agreement, we are not authorized to include the underlying records in this replication package.
Line 42 : 3. **Individual-level survey microdata** (used in Tables A2 and A3): A small household survey including religious practices conducted in October 2015, covering 1,000+ individuals in Parwan and Kabul provinces (Blumenstock, Callen, Ghani, and Shapiro 2016). These data are confidential and are not publicly posted. Researchers seeking access should contact J. Blumenstock and M. Callen.
Line 59 : These datasets contain the Maghrib dip (the paper's measure of religious adherence) constructed from the confidential raw CDR. They also incorporate the following publicly available data sources:
Line 78 : 2. **Synthetic individual-quarter CDR panel** (`Data/tables_data/synthetic/hash_grid_qtr_panel_synthetic.csv`): 100 fabricated observations substituting for the confidential CDR panel used in Table A13. All estimates produced from this file are meaningless.
Line 79 : 3. **Synthetic survey microdata** (`Data/tables_data/synthetic/smallsurvey_finalsample_synthetic.{dta,csv}`): 20 fabricated observations substituting for the confidential survey microdata used in Tables A2 and A3. All estimates produced from this file are meaningless.
Line 80 : 4. **Synthetic antenna coordinates** (`Data/figures_data/synthetic/cell_lookup_antenna_synthetic.csv`): 5 fabricated tower locations substituting for the confidential antenna geolocation file used in Figure A2. The output map is a meaningless placeholder.
Line 84 : The confidential data listed above (raw CDR, individual-quarter CDR panel, survey microdata, and cell tower coordinates) are stored on a secure server maintained by the authors' institutions. The authors commit to preserving these data and the associated code for a period of **no less than five years** following the publication of the paper, in accordance with the JPE Data Policy. The authors will also provide reasonable assistance to requests for clarification and replication.
Line 94 : The authors certify that they have legitimate access and appropriate permission to use each dataset listed in Section 2, and that all datasets included in this package are redistributed with permission or are in the public domain. The confidential sources — the CDR transaction data (raw and individual-quarter panel), the cell tower coordinates, and the survey microdata — are not included in this package; the authors have permission to use these data for this research but do not have the right to redistribute them.
Line 118 : 7. `Code/Cleaning/01–13` documents the full pipeline from raw CDR to analysis-ready datasets and is included for reference only — these scripts cannot be run without the confidential CDR data on the secure server. In these scripts, the authors' project-folder paths have been replaced with the placeholder `<PATH_TO_PROJECT_ROOT>`; this placeholder points to the internal project folder holding the confidential source data, not to this replication package, and is retained for documentation only.
Line 138 : | Table A6 | `All_Tables.do` | `TabA6.tex` | `cdr_and_conflict_dm.dta`, `cdr_and_climate_gm.dta`, `dist_level.dta` (Panels A and E use hardcoded summary stats from confidential data) | Yes |
Line 220 : **With full confidential CDR data (estimated):**
Line 231 : **Hardware (CDR cleaning pipeline):** Requires a secure high-memory server; not executable without the confidential CDR data.
Line 245 : Blumenstock, Joshua, Michael Callen, Tarek Ghani, and Jacob Shapiro. 2016. "Household Survey Data on Households in Afghanistan." University of California, Berkeley. Confidential microdata.
