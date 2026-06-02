## Potential Personal Identifiable Information (PII)

⚠️ We found the following instances of potentially personally identifying information. This may be completely legitimate but might be worth checking. *As a reminder, privacy legislation in many countries (e.g. GDPR in EU) prohibits the dissemination of personal identifiable information without prior (and documented) consent of individuals.* If indeed you want to publish such information with your replication package, you should probably have obtained IRB approval for this - please check!

**Summary:**
- Data files with PII indicators: 2
- Variables flagged in data: 6
- Code files with PII references: 12
- PII references in code: 519

### Summary of Flagged Files

| File Type | File | Variables/References | PII Categories |
|-----------|------|----------------------|----------------|
| Data | `grid_level.csv` | 3 | lat, loc |
| Data | `grid_level.dta` | 3 | lat, loc |
| Code | `13_precleaning_alltables.do` | 103 | lat, district, son, phone, city, name, loc, lon |
| Code | `All_Figures.R` | 5 | lat, loc, location, district, coord |
| Code | `All_Tables.do` | 241 | loc, lat, district, son, name, city, location, phone, address, minute, village |
| Code | `Fig2.R` | 9 | lat, loc, location, name, minute, coord |
| Code | `Fig3.R` | 16 | minute, lat, loc, location, name |
| Code | `Fig4.R` | 20 | district, city, lat, loc, location, name |
| Code | `FigA2.qmd` | 21 | loc, location, coord, country, district, name, lon, lat |
| Code | `FigA3.R` | 6 | lat, loc, location, name, phone |
| Code | `FigA4.R` | 7 | lat, loc, location, name, fname |
| Code | `FigA5.R` | 30 | district, lat, lon, loc, location, name, coord |
| Code | `FigA6.R` | 15 | district, lat, loc, location, name, coord, lon |
| Code | `TabA13.R` | 46 | minute, phone, loc, location, lat, lname, name, block |

*See [Appendix](report-pii-appendix.md) for detailed listing of all flagged instances.*
