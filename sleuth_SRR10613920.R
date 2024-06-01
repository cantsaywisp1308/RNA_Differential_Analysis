> library("Sleuth")
> print(paste("kal_dirs", kal_dirs)) 
[1] "kal_dirs SRR10613920" "kal_dirs SRR10613921" "kal_dirs SRR10613922"
[4] "kal_dirs SRR10613923" "kal_dirs SRR10613924" "kal_dirs SRR10613925"
[7] "kal_dirs SRR10613926" "kal_dirs SRR10613927" "kal_dirs SRR10613928"
> kal_dirs <- file.path("kallisto_output", sample_output)
> print(paste("kal_dirs", kal_dirs))
[1] "kal_dirs kallisto_output/SRR10613920" "kal_dirs kallisto_output/SRR10613921"
[3] "kal_dirs kallisto_output/SRR10613922" "kal_dirs kallisto_output/SRR10613923"
[5] "kal_dirs kallisto_output/SRR10613924" "kal_dirs kallisto_output/SRR10613925"
[7] "kal_dirs kallisto_output/SRR10613926" "kal_dirs kallisto_output/SRR10613927"
[9] "kal_dirs kallisto_output/SRR10613928"
> s2c <- read.table(file.path("data/meta_data.txt"), header = TRUE, stringsAsFactors=FALSE, sep=",")
> s2c <- dplyr::select(s2c, sample = file_name, growth_condition)
> print(paste("s2c", s2c))
[1] "s2c c(\"SRR10613920\", \"SRR10613921\", \"SRR10613922\", \"SRR10613923\", \"SRR10613924\", \"SRR10613925\", \"SRR10613926\", \"SRR10613927\", \"SRR10613928\")"
[2] "s2c c(\"stationary\", \"stationary\", \"stationary\", \"biofilm\", \"biofilm\", \"biofilm\", \"log\", \"log\", \"log\")"                                       
> so <- sleuth_prep(s2c, extra_bootstrap_summary = TRUE)
Error in sleuth_prep(s2c, extra_bootstrap_summary = TRUE) : 
  could not find function "sleuth_prep"
> libary("sleuth")
Error in libary("sleuth") : could not find function "libary"
> library("sleuth")
> so <- sleuth_prep(s2c, extra_bootstrap_summary = TRUE)
Error in sleuth_prep(s2c, extra_bootstrap_summary = TRUE) : 
  's2c' (sample_to_covariates) must contain a column named 'path'
> so <- sleuth_prep(s2c, extra_bootstrap_summary = TRUE, num_cores = 1)
Error in sleuth_prep(s2c, extra_bootstrap_summary = TRUE, num_cores = 1) : 
  's2c' (sample_to_covariates) must contain a column named 'path'
> getwd()
[1] "D:/Research_Data"
> setwd("D:\Research_Data\kallisto_output")
Error: '\R' is an unrecognized escape in character string (<input>:1:11)
> setwd("D:\\Research_Data\\kallisto_output")
> q()

> dir(file.path("")> 
> setwd("D:\\Research_Data")
> dir(file.path("kallisto_output/"))
[1] "SRR10613920" "SRR10613921" "SRR10613922" "SRR10613923" "SRR10613924" "SRR10613925" "SRR10613926" "SRR10613927" "SRR10613928"
> sample_id <- dir(file.path("kallisto_output"))
> print(paste("sample_id", sample_id))
[1] "sample_id SRR10613920" "sample_id SRR10613921" "sample_id SRR10613922" "sample_id SRR10613923" "sample_id SRR10613924" "sample_id SRR10613925" "sample_id SRR10613926"
[8] "sample_id SRR10613927" "sample_id SRR10613928"
> kal_dirs <- file.path("kallisto_output", sample_id)
> print(paste("kal_dirs", kal_dirs))
[1] "kal_dirs kallisto_output/SRR10613920" "kal_dirs kallisto_output/SRR10613921" "kal_dirs kallisto_output/SRR10613922" "kal_dirs kallisto_output/SRR10613923"
[5] "kal_dirs kallisto_output/SRR10613924" "kal_dirs kallisto_output/SRR10613925" "kal_dirs kallisto_output/SRR10613926" "kal_dirs kallisto_output/SRR10613927"
[9] "kal_dirs kallisto_output/SRR10613928"
> s2c <- read.table(file.path("data/meta_data.txt"), header = TRUE, stringsAsFactors=FALSE, sep=",")
> s2c <- dplyr::select(s2c, sample = file_name, condition)
Error in `dplyr::select()`:
! Can't select columns that don't exist.
✖ Column `condition` doesn't exist.
Run `rlang::last_trace()` to see where the error occurred.
> s2c <- dplyr::select(s2c, sample = file_name, growth_condition)
> print(paste("s2c", s2c))
[1] "s2c c(\"SRR10613920\", \"SRR10613921\", \"SRR10613922\", \"SRR10613923\", \"SRR10613924\", \"SRR10613925\", \"SRR10613926\", \"SRR10613927\", \"SRR10613928\")"
[2] "s2c c(\"stationary\", \"stationary\", \"stationary\", \"biofilm\", \"biofilm\", \"biofilm\", \"log\", \"log\", \"log\")"                                       
> s2c <- dplyr::mutate(s2c, path = kal_dirs)
>  
Error: unexpected input in ""
> print(s2c)
       sample growth_condition                        path
1 SRR10613920       stationary kallisto_output/SRR10613920
2 SRR10613921       stationary kallisto_output/SRR10613921
3 SRR10613922       stationary kallisto_output/SRR10613922
4 SRR10613923          biofilm kallisto_output/SRR10613923
5 SRR10613924          biofilm kallisto_output/SRR10613924
6 SRR10613925          biofilm kallisto_output/SRR10613925
7 SRR10613926              log kallisto_output/SRR10613926
8 SRR10613927              log kallisto_output/SRR10613927
9 SRR10613928              log kallisto_output/SRR10613928
> so <- sleuth_prep(s2c, extra_bootstrap_summary = TRUE)
reading in kallisto results
dropping unused factor levels
.........
normalizing est_counts
6015 targets passed the filter
normalizing tpm
merging in metadata
summarizing bootstraps
Error in parallel::mclapply(x, y, mc.cores = num_cores) : 
  'mc.cores' > 1 is not supported on Windows
> library(sleuth)
> 
> # Set the number of cores to 1 explicitly
> so <- sleuth_prep(s2c, extra_bootstrap_summary = TRUE, num_cores = 1)
reading in kallisto results
dropping unused factor levels
.........
normalizing est_counts
6015 targets passed the filter
normalizing tpm
merging in metadata
summarizing bootstraps
.........
> so <- sleuth_fit(so, ~growth_condition, 'full')
fitting measurement error models
shrinkage estimation
2 NA values were found during variance shrinkage estimation due to mean observation values outside of the range used for the LOESS fit.
The LOESS fit will be repeated using exact computation of the fitted surface to extrapolate the missing values.
These are the target ids with NA values: lcl|NC_014931.1_cds_VARPA_RS31765_5147, lcl|NC_014931.1_cds_WP_234974877.1_5696
computing variance of betas
> so <- sleuth_fit(so, ~1, 'reduced')
fitting measurement error models
shrinkage estimation
4 NA values were found during variance shrinkage estimation due to mean observation values outside of the range used for the LOESS fit.
The LOESS fit will be repeated using exact computation of the fitted surface to extrapolate the missing values.
These are the target ids with NA values: lcl|NC_014931.1_cds_VARPA_RS31765_5147, lcl|NC_014931.1_cds_WP_013540475.1_2035, lcl|NC_014931.1_cds_WP_234974877.1_5696, lcl|NC_014931.1_cds_WP_013539634.1_1170
computing variance of betas
> so <- sleuth_lrt(so, 'reduced', 'full')
> print(models(so))
[  full  ]
formula:  ~growth_condition 
data modeled:  obs_counts 
transform sync'ed:  TRUE 
coefficients:
        (Intercept)
        growth_conditionlog
        growth_conditionstationary
[  reduced  ]
formula:  ~1 
data modeled:  obs_counts 
transform sync'ed:  TRUE 
coefficients:
        (Intercept)
$full
formula:  ~growth_condition 
data modeled:  obs_counts 
transform sync'ed:  TRUE 
coefficients:
        (Intercept)
        growth_conditionlog
        growth_conditionstationary

$reduced
formula:  ~1 
data modeled:  obs_counts 
transform sync'ed:  TRUE 
coefficients:
        (Intercept)

> sleuth_table <- sleuth_results(so, 'reduced:full', 'lrt', show_all = FALSE)
> sleuth_significant <- dplyr::filter(sleuth_table, qval <= 0.05)
> print(head(sleuth_significant, 20))
                                 target_id         pval         qval test_stat      rss degrees_free mean_obs  var_obs     tech_var sigma_sq smooth_sigma_sq final_sigma_sq
1  lcl|NC_014931.1_cds_WP_013539789.1_1327 2.308281e-12 1.388431e-08  53.58904 38.43513            2 6.691546 4.804391 0.0038837468 4.800507       0.1347985       4.800507
2  lcl|NC_014931.1_cds_WP_013539785.1_1323 9.021358e-12 1.808782e-08  50.86285 28.95171            2 6.546075 3.618963 0.0042685999 3.614695       0.1303138       3.614695
3  lcl|NC_014931.1_cds_WP_013539790.1_1328 7.957621e-12 1.808782e-08  51.11378 33.49868            2 6.593392 4.187335 0.0046428028 4.182692       0.1316898       4.182692
4   lcl|NC_014931.1_cds_WP_013538781.1_311 2.011585e-11 2.419936e-08  49.25903 23.19996            2 6.835093 2.899995 0.0023200663 2.897675       0.1400185       2.897675
5   lcl|NC_014931.1_cds_WP_013538782.1_312 1.915259e-11 2.419936e-08  49.35717 25.30633            2 7.706176 3.163292 0.0011034692 3.162188       0.1824389       3.162188
6  lcl|NC_014931.1_cds_WP_013539551.1_1085 4.907879e-11 3.428578e-08  47.47519 40.05575            2 6.905605 5.006969 0.0035439594 5.003425       0.1428481       5.003425
7  lcl|NC_014931.1_cds_WP_013539788.1_1326 5.700046e-11 3.428578e-08  47.17592 37.84019            2 5.785763 4.730024 0.0095951388 4.720429       0.1170955       4.720429
8  lcl|NC_014931.1_cds_WP_013539792.1_1330 5.312451e-11 3.428578e-08  47.31677 30.59476            2 5.631383 3.824345 0.0124695449 3.811875       0.1166766       3.811875
9  lcl|NC_014931.1_cds_WP_013542185.1_3779 4.498382e-11 3.428578e-08  47.64944 27.71316            2 6.004496 3.464145 0.0060714941 3.458074       0.1192030       3.458074
10 lcl|NC_014931.1_cds_WP_041942801.1_1324 5.575169e-11 3.428578e-08  47.22023 33.90277            2 5.673917 4.237847 0.0109625094 4.226884       0.1166790       4.226884
11 lcl|NC_014931.1_cds_WP_041942906.1_2931 1.074966e-10 5.878111e-08  45.90712 31.54388            2 6.132059 3.942985 0.0051601913 3.937825       0.1208895       3.937825
12 lcl|NC_014931.1_cds_WP_013540923.1_2491 1.372292e-10 6.878613e-08  45.41874 23.59047            2 6.751662 2.948809 0.0023267427 2.946483       0.1368917       2.946483
13  lcl|NC_014931.1_cds_WP_013538783.1_313 1.689946e-10 7.421855e-08  45.00231 24.08886            2 6.118536 3.011108 0.0043980863 3.006710       0.1206927       3.006710
14 lcl|NC_014931.1_cds_WP_013542267.1_3861 1.850837e-10 7.421855e-08  44.82043 14.08074            2 6.208904 1.760093 0.0041821131 1.755911       0.1221674       1.755911
15 lcl|NC_014931.1_cds_WP_013544095.1_5755 1.832099e-10 7.421855e-08  44.84078 18.05987            2 6.751086 2.257484 0.0021836993 2.255300       0.1368710       2.255300
16  lcl|NC_014931.1_cds_WP_041943170.1_310 2.347124e-10 8.823718e-08  44.34532 23.81586            2 8.483303 2.976983 0.0005239784 2.976459       0.2282118       2.976459
17 lcl|NC_014931.1_cds_WP_041942879.1_2573 2.795239e-10 9.890214e-08  43.99587 17.75460            2 5.261724 2.219326 0.0107696978 2.208556       0.1189624       2.208556
18 lcl|NC_014931.1_cds_WP_013539793.1_1331 4.003546e-10 1.267438e-07  43.27734 31.93685            2 5.045387 3.992106 0.0247551569 3.967351       0.1224810       3.967351
19 lcl|NC_014931.1_cds_WP_013543474.1_5107 3.955685e-10 1.267438e-07  43.30139 22.43499            2 5.923685 2.804374 0.0059531350 2.798421       0.1182732       2.798421
20 lcl|NC_014931.1_cds_WP_013539784.1_1322 4.338046e-10 1.304667e-07  43.11685 16.68485            2 7.426685 2.085607 0.0011780360 2.084429       0.1675970       2.084429
>  plot_bootstrap(so, "lcl|NC_014931.1_cds_WP_013539789.1_1327", units = "est_counts", color_by = "growth_condition")

