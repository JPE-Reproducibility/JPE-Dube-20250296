## Potential Personal Identifiable Information (PII)

⚠️ We found the following instances of potentially personally identifying information. This may be completely legitimate but might be worth checking. *As a reminder, privacy legislation in many countries (e.g. GDPR in EU) prohibits the dissemination of personal identifiable information without prior (and documented) consent of individuals.* If indeed you want to publish such information with your replication package, you should probably have obtained IRB approval for this - please check!

**Summary:**

- Data files with PII indicators: 18
- Variables flagged in data: 27
- Code files with PII references: 31
- PII references in code: 1193

### Summary of Flagged Files

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

*See [Appendix](report-pii-appendix.md) for detailed listing of all flagged instances.*
