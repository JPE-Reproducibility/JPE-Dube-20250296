# ============================================================================
# hashgridqtr_regs_init_relig_to15.R
#
# Produces Appendix Table A13: Heterogeneity in Maghrib Dip by Initial
# Baseline Religious Adherence (Individual-Quarter CDR Panel, 2016-2020).
#
# Table structure (4 columns):
#   Cols 1-2: Average method  -- baseline religiosity = avg Maghrib dip
#             over 2013-2015; clustered SEs on grid cell
#   Cols 3-4: Residual method -- baseline religiosity = residual from
#             first-stage regression of Maghrib dip on SPEI + grid/quarter
#             FEs over 2013-2015; cluster-bootstrapped SEs (600 iterations)
#             to correct for generated-regressor problem
#
# Actual data: hash_grid_qtr_panel.csv (~78M obs, confidential CDR data)
# Replication: hash_grid_qtr_panel_synthetic.csv (100 synthetic obs)
# Runtime on actual data: ~120 hours
# Runtime on synthetic data: ~1 minute
#
# Software: R 4.4.0 (2024-04-24, "Puppy Cup"), x86_64-w64-mingw32/x64
#           RStudio 2025.09.0+387
#
# USAGE: Set the `root` variable (line ~34) to the absolute path of the
#        replication package folder on your machine. All other paths are
#        derived from `root` automatically and require no changes.
# ============================================================================

# Required packages: data.table, magrittr, fixest
# To install:  install.packages(c("data.table", "magrittr", "fixest"))

library('data.table')
library('magrittr')
library('fixest')


# ----------------------------------------------------------------------------
# Paths
# ----------------------------------------------------------------------------
root = '<PATH_TO_REPLICATION_PACKAGE>'

paths = list(
    'hashQtrPanel' = file.path(root, 'Data/tables_data/synthetic/hash_grid_qtr_panel_synthetic.csv'),
    'outputDir'    = file.path(root, 'Output/Tables')
)


# ----------------------------------------------------------------------------
# Helper: add tercile dummy indicators for baseline religiosity
#   dum_tercileInitRelig_to15_2 = 1 if middle tercile (tercile == 1)
#   dum_tercileInitRelig_to15_3 = 1 if top tercile    (tercile == 2)
# ----------------------------------------------------------------------------
addBaselineIndicators <- function(df_panel){
    df_panel = df_panel[, dum_tercileInitRelig_to15_2 := ifelse(tercileInitRelig_avg_denom_to15 == 1, 1, 0)]
    df_panel = df_panel[, dum_tercileInitRelig_to15_3 := ifelse(tercileInitRelig_avg_denom_to15 == 2, 1, 0)]
}


# ----------------------------------------------------------------------------
# Load data and split into pre/post-2015 periods
# ----------------------------------------------------------------------------
df_panel = fread(paths[['hashQtrPanel']])
df_panel = df_panel[, year := as.numeric(substr(yearQtr, 1, 4))]
df_panel = addBaselineIndicators(df_panel)

df_panel_post2015 = df_panel[year > 2015, ]   # main regression sample (2016-2020)
df_panel_pre2015  = df_panel[year <= 2015, ]  # baseline period for residual method


# ----------------------------------------------------------------------------
# Variable labels for etable output
# ----------------------------------------------------------------------------
vars_dict = c(
    'vpm_diff_30min_avg_denom'                     = 'Maghrib Dip - Avg. as Denom',
    'speipm12_g'                                   = 'SPEI',
    'medianInitRelig_avg_denom_to15'               = 'AboMed Baseline Relig.',
    'I(speipm12_g*medianInitRelig_avg_denom_to15)' = 'SPEI $\\times$ Above Median Baseline Religious Adherence',
    'dum_tercileInitRelig_to15_2'                  = 'Tercile 2 Baseline Relig.',
    'dum_tercileInitRelig_to15_3'                  = 'Tercile 3 Baseline Relig.',
    'I(speipm12_g*dum_tercileInitRelig_to15_2)'    = 'SPEI $\\times$ Tercile 2 Baseline Religious Adherence',
    'I(speipm12_g*dum_tercileInitRelig_to15_3)'    = 'SPEI $\\times$ Tercile 3 Baseline Religious Adherence',
    'I(speipm12_g*abv_med_baseline_residual)'      = 'SPEI $\\times$ Above Median Baseline Religious Adherence',
    'I(speipm12_g*tercile2_baseline_residual)'     = 'SPEI $\\times$ Tercile 2 Baseline Religious Adherence',
    'I(speipm12_g*tercile3_baseline_residual)'     = 'SPEI $\\times$ Tercile 3 Baseline Religious Adherence',
    'phonehash'                                    = 'Individual FE',
    'gridID'                                       = 'Grid Cell FE',
    'yearQtrID'                                    = 'Quarter FE'
)




# ============================================================================
# PART 1: Average-method regressions (Table A13, cols 1-2)
#
# Baseline religiosity = average Maghrib dip 2013-2015, pre-computed and
# stored in the panel as medianInitRelig_avg_denom_to15 (above/below median)
# and tercileInitRelig_avg_denom_to15 (tercile rank 0/1/2).
# Standard errors clustered on grid cell.
# ============================================================================

# Col 1: above/below median split
reg1 = feols(vpm_diff_30min_avg_denom ~ speipm12_g + I(speipm12_g*medianInitRelig_avg_denom_to15) |
               phonehash + gridID + yearQtrID,
             cluster  = ~gridID,
             fixef.rm = 'singleton',
             data     = df_panel_post2015)

# Summary stats on the reg1 estimation sample
df_panel_post2015[obs(reg1), mean(vpm_diff_30min_avg_denom)]
df_panel_post2015[obs(reg1), mean(speipm12_g)]
length(df_panel_post2015[obs(reg1), vpm_diff_30min_avg_denom])
df_panel_post2015[obs(reg1), .(maghrib_dip_sd = sd(vpm_diff_30min_avg_denom, na.rm = TRUE),
                               speipm12_sd    = sd(speipm12_g))]

# Col 2: tercile split (bottom tercile is reference; dummies for middle and top)
reg2 = feols(vpm_diff_30min_avg_denom ~ speipm12_g +
               I(speipm12_g*dum_tercileInitRelig_to15_2) +
               I(speipm12_g*dum_tercileInitRelig_to15_3) |
               phonehash + gridID + yearQtrID,
             cluster  = ~gridID,
             fixef.rm = 'singleton',
             data     = df_panel_post2015)


# ============================================================================
# PART 2: Residual-method baseline religiosity (Table A13, cols 3-4)
#
# Two-stage approach:
#   Stage 1: regress Maghrib dip on SPEI + grid FE + quarter FE using the
#            pre-2015 panel to absorb climate and location variation.
#   Stage 2: average the individual residuals from stage 1 over 2013-2015;
#            this average is each individual's "residual baseline religiosity".
#   Then construct above/below-median and tercile dummies from these residuals
#   and use them as heterogeneity variables in the main post-2015 regression.
# ============================================================================

# Stage 1: pre-2015 baseline regression (grid + quarter FEs absorb SPEI variation)
reg_baseline_v2 = feols(vpm_diff_30min_avg_denom ~ speipm12_g | gridID + yearQtrID,
                        cluster  = ~gridID,
                        fixef.rm = 'singleton',
                        data     = df_panel_pre2015)

# Extract residuals from the estimation sample and average by individual
df_used <- df_panel_pre2015[obs(reg_baseline_v2), ]
df_used[, residual_baseline := resid(reg_baseline_v2)]

residuals_indiv <- df_used[
  , .(baseline_relig_residual = mean(residual_baseline, na.rm = TRUE)),
  by = phonehash
]

# Construct above/below-median and tercile dummies from residual baseline
terciles <- quantile(residuals_indiv$baseline_relig_residual, probs = c(1/3, 2/3), na.rm = TRUE)
residuals_indiv <- residuals_indiv %>%
  .[, abv_med_baseline_residual   := fifelse(baseline_relig_residual > median(baseline_relig_residual, na.rm = TRUE), 1, 0)] %>%
  .[, tercile2_baseline_residual  := fifelse(baseline_relig_residual > terciles[[1]] & baseline_relig_residual <= terciles[[2]], 1, 0)] %>%
  .[, tercile3_baseline_residual  := fifelse(baseline_relig_residual > terciles[[2]], 1, 0)]

# Merge residual baseline variables back into the post-2015 and full panels
df_panel_post2015 <- residuals_indiv[df_panel_post2015, on = "phonehash"]
df_panel          <- residuals_indiv[df_panel,          on = "phonehash"]

# Col 3: above/below-median residual baseline (point estimates; SEs from bootstrap below)
reg1_orig = feols(vpm_diff_30min_avg_denom ~ speipm12_g + I(speipm12_g*abv_med_baseline_residual) |
                    phonehash + gridID + yearQtrID,
                  cluster  = ~gridID,
                  fixef.rm = 'singleton',
                  data     = df_panel_post2015)

reg_data <- df_panel_post2015[obs(reg1_orig), ]

# Col 4: tercile residual baseline
reg2_orig = feols(vpm_diff_30min_avg_denom ~ speipm12_g +
                    I(speipm12_g*tercile2_baseline_residual) +
                    I(speipm12_g*tercile3_baseline_residual) |
                    phonehash + gridID + yearQtrID,
                  cluster  = ~gridID,
                  fixef.rm = 'singleton',
                  data     = df_panel_post2015)


# ============================================================================
# PART 3: Cluster bootstrap for cols 3-4
#
# The residual baseline variable is generated (two-stage), so OLS clustered
# SEs are understated. We correct via cluster bootstrap: resample grids with
# replacement, re-run both stages, collect coefficients. Bootstrap SE = SD of
# the coefficient distribution across 600 iterations.
#
# Bootstrap also re-runs stage 1 (reg_baseline_v2) in each iteration so the
# generated-regressor uncertainty is fully propagated.
# ============================================================================
{
  ls()
  rm(list = c('df_panel_pre2015', 'df_panel_post2015'))
  gc()
  
  set.seed(123)
  n_boot     <- 600
  chunk_size <- 10   # save to disk every 10 iterations as a checkpoint
  start_iter <- 1
  
  all_grids <- unique(df_panel$gridID)
  
  # Intermediate files: written every chunk_size iterations to guard against crashes
  intermediate_file_reg1 <- file.path(paths[['outputDir']], "boot_coeffs_reg1_chunk.csv")
  intermediate_file_reg2 <- file.path(paths[['outputDir']], "boot_coeffs_reg2_chunk.csv")
  file.remove(intermediate_file_reg1)
  file.remove(intermediate_file_reg2)
  
  # Pre-allocate coefficient matrices (rows accumulate across iterations)
  boot_coeffs_reg1 <- matrix(NA, nrow = 0, ncol = 2)
  colnames(boot_coeffs_reg1) <- c("speipm12_g", "I(speipm12_g*abv_med_baseline_residual)")
  
  boot_coeffs_reg2 <- matrix(NA, nrow = 0, ncol = 3)
  colnames(boot_coeffs_reg2) <- c("speipm12_g",
                                  "I(speipm12_g*tercile2_baseline_residual)",
                                  "I(speipm12_g*tercile3_baseline_residual)")
  
  for (i in start_iter:n_boot) {
    cat(paste0("[", Sys.time(), "] Starting bootstrap iteration: ", i, "\n"))
    
    # Sample grids with replacement; each selected grid gets a unique boot_id
    boot_grids_dt <- data.table(
      gridID = sample(all_grids, size = length(all_grids), replace = TRUE)
    )[, boot_id := .I]
    
    # Expand panel: each drawn grid brings all its observations
    boot_df <- df_panel[boot_grids_dt, on = 'gridID', allow.cartesian = TRUE]
    
    # Create a new individual ID that is unique within each boot_id x phonehash pair
    # (prevents the same individual appearing as the same FE across duplicate grid draws)
    boot_df[, phonehash_boot_id := .GRP, by = .(boot_id, phonehash)]
    
    boot_df_pre2015  <- boot_df[year <= 2015, ]
    boot_df_post2015 <- boot_df[year > 2015, ]
    
    # Stage 1: baseline regression on bootstrap pre-2015 sample
    reg_baseline_boot <- feols(
      vpm_diff_30min_avg_denom ~ speipm12_g | gridID + yearQtrID,
      cluster  = ~gridID,
      fixef.rm = 'singleton',
      data     = boot_df_pre2015
    )
    
    # Stage 1 residuals -> individual-level baseline religiosity
    boot_df_used <- boot_df_pre2015[obs(reg_baseline_boot), ]
    boot_df_used[, residual_baseline := resid(reg_baseline_boot)]
    residuals_indiv_boot <- boot_df_used[
      , .(baseline_relig_residual = mean(residual_baseline, na.rm = TRUE)),
      by = phonehash_boot_id
    ]
    
    # Merge residual baseline into post-2015 bootstrap sample
    boot_df_post2015 <- residuals_indiv_boot[boot_df_post2015, on = 'phonehash_boot_id']
    
    # Re-compute heterogeneity dummies on the bootstrap distribution
    median_boot  <- median(boot_df_post2015$baseline_relig_residual, na.rm = TRUE)
    terciles_boot <- quantile(boot_df_post2015$baseline_relig_residual, probs = c(1/3, 2/3), na.rm = TRUE)
    
    boot_df_post2015[, abv_med_baseline_residual  := fifelse(baseline_relig_residual > median_boot, 1, 0)]
    boot_df_post2015[, tercile2_baseline_residual := fifelse(
      baseline_relig_residual > terciles_boot[[1]] & baseline_relig_residual <= terciles_boot[[2]], 1, 0)]
    boot_df_post2015[, tercile3_baseline_residual := fifelse(
      baseline_relig_residual > terciles_boot[[2]], 1, 0)]
    
    # Stage 2 regressions on bootstrap post-2015 sample (wrapped in try() to skip failures)
    reg1_boot_fit <- try(feols(
      vpm_diff_30min_avg_denom ~ speipm12_g + I(speipm12_g*abv_med_baseline_residual) |
        phonehash_boot_id + gridID + yearQtrID,
      cluster  = ~gridID,
      fixef.rm = 'singleton',
      data     = boot_df_post2015
    ), silent = TRUE)
    
    if (!inherits(reg1_boot_fit, "try-error")) {
      boot_coeffs_reg1 <- rbind(boot_coeffs_reg1, coef(reg1_boot_fit))
    }
    
    reg2_boot_fit <- try(feols(
      vpm_diff_30min_avg_denom ~ speipm12_g +
        I(speipm12_g*tercile2_baseline_residual) +
        I(speipm12_g*tercile3_baseline_residual) |
        phonehash_boot_id + gridID + yearQtrID,
      cluster  = ~gridID,
      fixef.rm = 'singleton',
      data     = boot_df_post2015
    ), silent = TRUE)
    
    if (!inherits(reg2_boot_fit, "try-error")) {
      boot_coeffs_reg2 <- rbind(boot_coeffs_reg2, coef(reg2_boot_fit))
    }
    
    # Checkpoint: save accumulated coefficients to disk every chunk_size iterations
    if (i %% chunk_size == 0 || i == n_boot) {
      fwrite(as.data.table(boot_coeffs_reg1), intermediate_file_reg1)
      fwrite(as.data.table(boot_coeffs_reg2), intermediate_file_reg2)
      cat(paste0("✅ Saved intermediate results at iteration ", i, "\n"))
    }
    
    rm(list = c('boot_grids_dt', 'boot_df', 'boot_df_pre2015', 'boot_df_post2015',
                'reg_baseline_boot', 'boot_df_used', 'residuals_indiv_boot',
                'reg1_boot_fit', 'reg2_boot_fit'))
    gc()
    
    cat(paste0("[", Sys.time(), "] Finished bootstrap iteration: ", i, "\n"))
  }
  
  # Read back saved coefficients and compute bootstrap SEs (SD across iterations)
  boot_coeffs_reg1 <- as.matrix(fread(intermediate_file_reg1))
  boot_coeffs_reg2 <- as.matrix(fread(intermediate_file_reg2))
  se_boot_reg1     <- apply(boot_coeffs_reg1, 2, sd,   na.rm = TRUE)
  se_boot_reg2     <- apply(boot_coeffs_reg2, 2, sd,   na.rm = TRUE)
  coef_boot_reg1   <- colMeans(boot_coeffs_reg1,        na.rm = TRUE)
  coef_boot_reg2   <- colMeans(boot_coeffs_reg2,        na.rm = TRUE)
  
  print("bootstrapped SE reg1");   print(se_boot_reg1)
  print("bootstrapped SE reg2");   print(se_boot_reg2)
  print("bootstrapped coefs reg1"); print(coef_boot_reg1)
  print("bootstrapped coefs reg2"); print(coef_boot_reg2)
  
  # Helper: normalise coefficient names before matching
  # (strips whitespace; maps ":" to "*" so fixest's interaction notation is consistent)
  sanitize <- function(x) {
    x <- gsub("\\s+", "", x)
    x <- gsub(":", "*", x, fixed = TRUE)
    x
  }
  
  # Align bootstrap output to the coefficient order of the original regression objects
  align_by_sanitized <- function(source_vec, target_names) {
    if (is.null(names(source_vec))) stop("bootstrap output unnamed")
    idx <- match(sanitize(target_names), sanitize(names(source_vec)))
    if (anyNA(idx)) stop(sprintf("Variables not found: %s",
                                 paste(target_names[is.na(idx)], collapse = ", ")))
    out <- source_vec[idx]
    names(out) <- target_names
    out
  }
  
  coef1_target <- stats::coef(reg1_orig)
  coef2_target <- stats::coef(reg2_orig)
  
  # Restore names if lost during matrix read-back
  if (is.null(names(coef_boot_reg1)) && !is.null(colnames(boot_coeffs_reg1)))
    names(coef_boot_reg1) <- colnames(boot_coeffs_reg1)
  if (is.null(names(coef_boot_reg2)) && !is.null(colnames(boot_coeffs_reg2)))
    names(coef_boot_reg2) <- colnames(boot_coeffs_reg2)
  if (is.null(names(se_boot_reg1)) && !is.null(colnames(boot_coeffs_reg1)))
    names(se_boot_reg1) <- colnames(boot_coeffs_reg1)
  if (is.null(names(se_boot_reg2)) && !is.null(colnames(boot_coeffs_reg2)))
    names(se_boot_reg2) <- colnames(boot_coeffs_reg2)
  
  se1_boot_aligned <- align_by_sanitized(se_boot_reg1, names(coef1_target))
  se2_boot_aligned <- align_by_sanitized(se_boot_reg2, names(coef2_target))
  
  # Diagonal vcov matrices from bootstrap SEs (off-diagonals zero — only need SDs)
  V_boot1 <- diag(se1_boot_aligned^2)
  dimnames(V_boot1) <- list(names(se1_boot_aligned), names(se1_boot_aligned))
  V_boot2 <- diag(se2_boot_aligned^2)
  dimnames(V_boot2) <- list(names(se2_boot_aligned), names(se2_boot_aligned))
  
  # vcov list: [clustered vcov for cols 1-2] + [bootstrap vcov for cols 3-4]
  vcov_full <- list(stats::vcov(reg1), stats::vcov(reg2), V_boot1, V_boot2)
  
  
  # ========================================================================
  # PART 4: Build LaTeX table in paper format
  #
  # etable() produces a raw LaTeX character vector; post-processing converts
  # it to the threeparttable format used in the paper:
  #   - threeparttable wrapper (for tablenotes)
  #   - 3-row multi-level column header
  #   - \toprule / \bottomrule (booktabs)
  #   - Observations row before FE rows
  #   - Full notes paragraph in tablenotes
  # ========================================================================
  
  # Capture etable output as a character vector (no file= means returns invisibly)
  # Col 1-2: average method (reg1, reg2) with OLS clustered SEs
  # Col 3-4: residual method (reg1_orig, reg2_orig) with bootstrap SEs
  tex_lines <- fixest::etable(
    reg1, reg2, reg1_orig, reg2_orig,
    vcov      = vcov_full,
    se.below  = TRUE,
    digits    = "r3",
    dict      = vars_dict,
    order     = c("speipm12_g", "SPEI"),
    fitstat   = c("n"),
    tex       = TRUE,
    style.tex = style.tex(yesNo = "Y")
  )
  
  lines <- tex_lines
  
  # 1. Outer wrapper: \begingroup -> \begin{threeparttable}; drop \par\endgroup
  lines <- sub("^\\\\begingroup$", "\\\\begin{threeparttable}", lines)
  lines <- lines[!grepl("^\\\\par\\\\endgroup$", lines)]
  
  # 2. Replace header block (from \tabularnewline \midrule \midrule through first \midrule)
  #    with the paper's 3-row multi-level header
  idx_tabrow    <- grep("tabularnewline", lines)
  midrule_idxs  <- which(grepl("^\\s*\\\\midrule\\s*$", lines))
  idx_first_mid <- midrule_idxs[midrule_idxs > idx_tabrow][1]
  header_new <- c(
    "   \\toprule",
    "   & \\multicolumn{4}{c}{Maghrib Dip (2016--2020)}\\\\",
    "   \\textit{Baseline religious adherence:} &\\multicolumn{2}{c}{Average} &\\multicolumn{2}{c}{Residual} \\\\\\cmidrule(lr){2-3}\\cmidrule(lr){4-5}",
    "    &\\multicolumn{1}{c}{(1)} &\\multicolumn{1}{c}{(2)} &\\multicolumn{1}{c}{(3)} &\\multicolumn{1}{c}{(4)} \\\\",
    "   \\midrule"
  )
  lines <- c(lines[seq_len(idx_tabrow - 1)], header_new, lines[(idx_first_mid + 1):length(lines)])
  
  # 3. Remove etable section-title rows (\emph{Variables}, \emph{Fixed-effects}, \emph{Fit statistics})
  lines <- lines[!grepl("\\\\emph\\{(Variables|Fixed-effects|Fit statistics)\\}", lines)]
  
  # 4. Reorder bottom block: Observations before FE rows; replace \midrule\midrule with \bottomrule
  idx_obs           <- grep("^\\s*Observations\\s*&", lines)
  idx_ife           <- grep("Individual FE\\s*&",     lines)
  idx_gfe           <- grep("Grid Cell FE\\s*&",      lines)
  idx_qfe           <- grep("Quarter FE\\s*&",        lines)
  idx_mid_before_fe <- idx_ife - 1
  idx_end_tab       <- grep("\\\\end\\{tabular\\}",   lines)
  
  notes_lines <- c(
    "\\begin{tablenotes}[flushleft]",
    "\\vspace{.1cm}",
    "\\item",
    "\\footnotesize",
    "\\textit{Notes:}",
    paste0("Each column is a separate regression. One observation is included for each individual-quarter ",
           "between 2016 to 2020. SPEI is calculated for each quarter in each individual's home grid, ",
           "where home is defined as the grid from which they made the most calls in that quarter. ",
           "The regressions in this table examine heterogeneity by baseline religious adherence. ",
           "In columns (1) and (2), baseline religious adherence is defined based on the Maghrib dip ",
           "calculated by aggregating call volumes in the 30-minute windows before and after Maghrib, ",
           "for all 33 months during the baseline period (spanning 2013-2015). Columns (3) and (4) use ",
           "a two-stage approach to calculate baseline religiosity as the residual after accounting for ",
           "SPEI shocks (and grid and quarter fixed effects) during the baseline period (see text for details). ",
           "The table shows that adverse climate shocks (measured by SPEI) are associated with a larger ",
           "increase in religious adherence for those who are initially more religiously adherent. ",
           "Standard errors clustered on grid cell are shown in parentheses. ",
           "*p$<$.10, ** p$<$.05, *** p$<$.01."),
    "\\end{tablenotes}"
  )
  
  lines <- c(
    lines[seq_len(idx_mid_before_fe)],
    lines[idx_obs],
    lines[idx_ife],
    lines[idx_gfe],
    lines[idx_qfe],
    "   \\bottomrule",
    lines[idx_end_tab],
    notes_lines,
    "\\end{threeparttable}"
  )
  
  # Replace hyphen-minus with en-dash before digits (matches Stata's -- convention)
  # Lookbehind ensures only cell-context negatives are replaced, not LaTeX commands
  lines <- gsub("(?<=[ &(])-(?=[0-9])", "--", lines, perl = TRUE)

  # Write final table to Output/Tables/
  out_file <- file.path(paths[["outputDir"]], "TabA13.tex")
  writeLines(lines, out_file)
  cat(paste0("Table saved to ", out_file, "\n"))
  
  # Clean up intermediate bootstrap files
  file.remove(intermediate_file_reg1)
  file.remove(intermediate_file_reg2)
  
}
