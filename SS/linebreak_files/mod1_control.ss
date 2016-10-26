#V3.30.0.0-trans
#C 2015 Assessent of Petrale (Fish600 people) run with SS3.24O
#_data_and_control_files: petrale15.dat // petrale15.ctl
#_SS-V3.30.0.0-trans;_2016_09_30;_Stock_Synthesis_by_Richard_Methot_(NOAA)_
# using_ADMB_11.2
#_SS-V3.30.0.0-trans;user_support_available_at:NMFS.Stock.Synthesis@noaa.go
# v
#_SS-V3.30.0.0-trans;user_info_available_at:https://vlab.ncep.noaa.gov/grou
# p/stock-synthesis
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and al
# so read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
1 # recr_dist_method for parameters:  1=like 3.24; 2=main effects for GP, S
# ettle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # Recruitment: 1=global; 2=by area (future option)
1 #  number of recruitment settlement assignments 
0 # year_x_area_x_settlement_event interaction requested (only for recr_dis
# t_method=1)
#GPat month  area age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer
# ) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1
#  dest=2, age1=4, age2=10
#
5 #_Nblock_Patterns
 5 3 3 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1973 1982 1983 1992 1993 2002 2003 2010 2011 2014
 2003 2009 2010 2010 2011 2014
 2003 2008 2009 2010 2011 2014
 1875 1875
 2004 2009
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to
#  base parm bounds; 3=no bound check)
1 ## 0 means to autogenerate time-varying parameters; 1 means to read each 
# time-varying parameter line
#
# setup for M, growth, maturity, fecundity, recruitment distibution, moveme
# nt 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agesp
# ec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specifi
# c_K; 4=not implemented
2 #_Growth_Age_for_L1
17 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; val
# ue should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 l
# ogSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturit
# y matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from 
# wtatage.ss
#_placeholder for empirical age-maturity by growth pattern
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)e
# ggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=
# male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-
# GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev
# _maxyr dev_PH Block Block_Fxn
 0.005 0.5 0.145 -1.888 0.3333 3 6 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 10 45 15.8 17.18 10 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 35 80 54.4 58.7 10 0 3 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.04 0.5 0.13 0.13 0.8 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.01 1 0.19 3 0.8 0 7 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.01 1 0.03 0 1 0 7 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 -3 3 2.08296e-006 2.08296e-006 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 1 5 3.4737 3.4737 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 10 50 33.1 33.1 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -3 3 -0.743 -0.743 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 -3 3 1 1 1 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -3 3 0 0 1 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 0.005 0.6 0.15 -1.58 0.3326 3 6 0 0 0 0 0.5 0 0 # NatM_p_1_Mal_GP_1
 10 45 16.6 17.18 10 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 35 80 43.2 58.7 10 0 3 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 0.04 0.5 0.2 0.13 0.8 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 0.01 1 0.14 3 0.8 0 7 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 0.01 1 0.05 0 1 0 7 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
 -3 3 3.05e-006 3.05e-006 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal
 -3 5 3.36054 3.36054 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal
 0 1 1 0.2 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 0 1 1 1 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 0 1 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_Bseas_1
 0 1 1 1 0 0 -4 0 0 0 0 0 0 0 # CohortGrowDev
 0.000001 0.999999 0.5 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,m
# alewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=su
# rvival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvatu
# re
#_      LO        HI      INIT     PRIOR   PR_SD   PR_type        PHASE env
# -var use_dev dev_mnyr dev_mxyr dev_PH   Block Blk_Fxn  #  parm_name
          5         20       9.64          9         10          0       1 
      0       0       0       0       0       0       0 # SR_LN(R0)
        0.2          1        0.9        0.8       0.09          6       5 
      0       0       0       0       0       0       0 # SR_BH_steep
          0          2        0.4        0.9          5          6     -99 
      0       0       0       0       0       0       0 # SR_sigmaR
         -5          5          0          0        0.2          6      -2 
      0       0       0       0       0       0       0 # SR_regime
          0          0          0          0          0          0     -99 
      0       0       0       0       0       0       0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1959 # first year of main recr_devs; early devs can preceed this era
2012 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1845 #_recdev_early_start (0=none; neg value makes relative to recdev_star
# t)
 7 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxpha
# se+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1944 #_last_early_yr_nobias_adj_in_MPD
 1964 #_first_yr_fullbias_adj_in_MPD
 2011 #_last_yr_fullbias_adj_in_MPD
 2014 #_first_recent_yr_nobias_adj_in_MPD
 0.8 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all
#  estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -4 #min rec_dev
 4 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1845E 1846E 1847E 1848E 1849E 1850E 1851E 1852E 1853E 1854E 1855E 1856E 
# 1857E 1858E 1859E 1860E 1861E 1862E 1863E 1864E 1865E 1866E 1867E 1868E 1
# 869E 1870E 1871E 1872E 1873E 1874E 1875E 1876E 1877E 1878E 1879E 1880E 18
# 81E 1882E 1883E 1884E 1885E 1886E 1887E 1888E 1889E 1890E 1891E 1892E 189
# 3E 1894E 1895E 1896E 1897E 1898E 1899E 1900E 1901E 1902E 1903E 1904E 1905
# E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E
#  1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 
# 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1
# 942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 19
# 54E 1955E 1956E 1957E 1958E 1959R 1960R 1961R 1962R 1963R 1964R 1965R 196
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
# 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
# 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark
-2001 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed input
# s to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet
# Yr:  1876 1877 1878 1879 1880 1881 1882 1883 1884 1885 1886 1887 1888 188
# 9 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1
# 904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918
#  1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 19
# 33 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 
# 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 196
# 2 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1
# 977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991
#  1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 20
# 06 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
# 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
# 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#  1 1 1 1 1 1 1 1
# WinterN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.21316e-005 0.000157436 0
# .000266742 0.000382828 0.000446495 0.000568244 0.000816857 0.00109023 0.0
# 0126569 0.00139305 0.00162204 0.00189618 0.00217118 0.0024263 0.00274173 
# 0.00311279 0.00357011 0.00407063 0.00936609 0.007702 0.00886411 0.0031476
# 9 0.00182794 0.00398544 0.00955877 0.0120028 0.00714013 0.0242435 0.01782
# 71 0.0167027 0.0240193 0.0570127 0.0252033 0.0335374 0.0334276 0.0376357 
# 0.0261849 0.0173635 0.038187 0.0724373 0.076552 0.0558514 0.0630067 0.073
# 7372 0.0751024 0.103704 0.116597 0.122182 0.0658497 0.130534 0.179055 0.1
# 1822 0.0659827 0.0561884 0.0622329 0.106416 0.0892013 0.0801722 0.0700988
# SummerN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.00872e-006 4.92723e-006
#  3.84104e-006 3.74997e-006 3.65859e-006 3.56687e-006 3.4748e-006 3.35712e
# -006 3.26423e-006 3.17093e-006 3.07721e-006 2.98306e-006 2.88847e-006 2.7
# 678e-006 2.67222e-006 2.57616e-006 2.47963e-006 2.3826e-006 2.28508e-006 
# 2.16101e-006 2.06229e-006 1.96562e-006 1.86857e-006 1.76656e-006 1.66032e
# -006 1.52685e-006 1.42272e-006 1.3202e-006 1.21851e-006 1.11727e-006 1.01
# 488e-006 9.39333e-007 1.34964e-008 4.18847e-005 3.3488e-005 0.00223941 0.
# 00694668 0.0114073 0.0161346 0.0189435 0.022918 0.0320553 0.0374053 0.050
# 7662 0.0597888 0.0646039 0.109859 0.114943 0.0863466 0.0813606 0.114239 0
# .0865271 0.121322 0.10501 0.151139 0.118382 0.102731 0.0551461 0.0682038 
# WinterS 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00143683 0.000829886 0.000
# 885715 0.00325077 0.00370651 0.00231958 0.001847 0.00122038 0.000815276 0
# .00444844 0.00314701 0.000719909 0.00222844 0.0027695 0.00337949 0.002489
# 68 0.00559443 0.0105771 0.0261297 0.0197735 0.0103937 0.0166676 0.0273843
#  0.0414157 0.0275608 0.0266433 0.0278527 0.03067 0.0206922 0.0286574 0.03
# 09367 0.0307681 0.0333382 0.0242763 0.0242472 0.0212015 0.0349957 0.02372
# 76 0.027522 0.0313553 0.0374473 0.0517178 0.0323249 0.054844 0.0505332 0.
# 0681647 0.0468555 0.0412554 0.0364206 0.054781 0.0379744 0.0275996 0.0283
# 107 0.0255325 0.0248754 0.0344713 0.025726 0.0281533 0.0307016 0.0239891 
# SummerS 2.03957e-005 2.03961e-005 2.03964e-005 2.03968e-005 0.00023561 0.
# 000450962 0.000666575 0.00088256 0.00109902 0.00131603 0.00153369 0.00175
# 205 0.00197117 0.00219111 0.00241191 0.00263361 0.00285623 0.00308002 0.0
# 0330458 0.00353014 0.00375673 0.00398436 0.00421304 0.00444278 0.00467359
#  0.00490548 0.00513847 0.00537256 0.00560776 0.00584409 0.00608154 0.0063
# 2013 0.00655987 0.00680076 0.00704282 0.00728605 0.00753046 0.00777607 0.
# 00802287 0.00827088 0.00841213 0.0115009 0.00929504 0.00732317 0.0050584 
# 0.00643877 0.00931712 0.00939297 0.0117477 0.0116972 0.0115887 0.0141031 
# 0.0139086 0.0159262 0.0149462 0.0121031 0.0119256 0.00905969 0.0210342 0.
# 0186631 0.0105552 0.0185021 0.0228742 0.027436 0.0165586 0.00950067 0.006
#
#_Q_setup
#_  fleet     link link_info extra_se  biasadj   float  #  fleetname
        1        3        0        0        1        0  #  WinterN
        3        3        0        0        1        0  #  WinterS
        5        1        0        1        0        1  #  TriEarly
        6        1        0        1        0        1  #  TriLate
        7        1        0        0        0        1  #  NWFSC
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_      LO        HI      INIT     PRIOR   PR_SD  PR_type      PHASE env-va
# r use_dev dev_mnyr dev_mxyr dev_PH   Block Blk_Fxn  #  parm_name
        -20          5         -9          0         99          0       1 
      0       1    1987    2009      -5       5       1  #  LnQ_base_Winter
# N(1)
 -5 5 -0.308852 0 -1 99 3  0 0 0 0 0 0 0 # Q_power_1_WinterN
        -20          5         -6          0         99          0       1 
      0       1    1987    2009      -5       5       1  #  LnQ_base_Winter
# S(3)
 -5 5 -0.880184 0 -1 99 3  0 0 0 0 0 0 0 # Q_power_3_WinterS
        -15         15   -1.65055          0          1          0      -1 
      0       0       0       0       0       0       0  #  LnQ_base_TriEar
# ly(5)
 0.001 2 0.169527 0.22 -1 99 5  0 0 0 0 0 0 0 # Q_extraSD_5_TriEarly
        -15         15   -1.59964          0          1          0      -1 
      0       0       0       0       0       0       0  #  LnQ_base_TriLat
# e(6)
 0.001 2 0.187718 0.16 -1 99 4  0 0 0 0 0 0 0 # Q_extraSD_6_TriLate
        -15         15   0.173451          0          1          0      -1 
      0       0       0       0       0       0       0  #  LnQ_base_NWFSC(
# 7)
# timevary Q parameters 
#_      LO        HI      INIT     PRIOR   PR_SD  PR_type      PHASE
      -0.99       0.99          0          0        0.5          6      3  
# LnQ_base_WinterN(1)_block
     0.0001          2         99         99        0.5          6      -5 
 # LnQ_base_WinterN(1)_dev_se
      -0.99       0.99          0          0        0.5          6      -6 
 # LnQ_base_WinterN(1)_dev_autocorr
      -0.99       0.99          0          0        0.5          6      3  
# LnQ_base_WinterN(3)_block
     0.0001          2         99         99        0.5          6      -5 
 # LnQ_base_WinterS(3)_dev_se
      -0.99       0.99          0          0        0.5          6      -6 
 # LnQ_base_WinterS(3)_dev_autocorr
# info on dev vectors created for Q parms are reported with other devs afte
# r tag parameter section 
# info on dev vectors created for Q parms are reported with other devs afte
# r tag parameter section 
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_
# discarded_dead
#_Pattern Discard Male Special
 24 1 3 0 # 1 WinterN
 24 1 3 0 # 2 SummerN
 24 1 3 0 # 3 WinterS
 24 1 3 0 # 4 SummerS
 24 0 3 0 # 5 TriEarly
 24 0 3 0 # 6 TriLate
 24 0 3 0 # 7 NWFSC
#
#_age_selex_types
#_Pattern Discard Male Special
 10 0 0 0 # 1 WinterN
 10 0 0 0 # 2 SummerN
 10 0 0 0 # 3 WinterS
 10 0 0 0 # 4 SummerS
 10 0 0 0 # 5 TriEarly
 10 0 0 0 # 6 TriLate
 10 0 0 0 # 7 NWFSC
#
#_      LO        HI      INIT     PRIOR      PR_SD    PR_type  PHASE env-v
# ar use_dev dev_mnyr dev_mxyr dev_PH   Block Blk_Fxn  #  parm_name
         15         75       46.6       43.1          5          0       1 
      0       0       0       0     0.5       1       1  #  SizeSel_P1_Wint
# erN(1)
         -5          3          3        0.7          5          0      -3 
      0       0       0       0     0.5       0       0  #  SizeSel_P2_Wint
# erN(1)
         -4         12        3.9       3.42          5          0       2 
      0       0       0       0     0.5       0       0  #  SizeSel_P3_Wint
# erN(1)
         -2         15         14       0.21          5          0      -3 
      0       0       0       0     0.5       0       0  #  SizeSel_P4_Wint
# erN(1)
        -15          5       -999       -8.9          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P5_Wint
# erN(1)
         -5          5       -999       0.15          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P6_Wint
# erN(1)
         10         40      26.19         15          9          0       1 
      0       0       0       0       0       2       1  #  Retain_P1_Winte
# rN(1)
        0.1         10      1.701          3          9          0       2 
      0       0       0       0       0       2       1  #  Retain_P2_Winte
# rN(1)
      0.001          1     0.9945          1          9          0       4 
      0       0       0       0       0       2       2  #  Retain_P3_Winte
# rN(1)
        -10         10          0          0          9          0      -2 
      0       0       0       0       0       0       0  #  Retain_P4_Winte
# rN(1)
        -15         15       -8.8          0          5          0       3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Peak
# _WinterN(1)
        -15         15       -1.1          0          5          0       4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Asce
# nd_WinterN(1)
        -15         15          0          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Desc
# end_WinterN(1)
        -15         15          0          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Fina
# l_WinterN(1)
        -15         15          1          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Scal
# e_WinterN(1)
         15         75       53.8       43.1          5          0       1 
      0       0       0       0     0.5       1       1  #  SizeSel_P1_Summ
# erN(2)
         -5          3          3        0.7          5          0      -3 
      0       0       0       0     0.5       0       0  #  SizeSel_P2_Summ
# erN(2)
         -4         12        5.3       3.42          5          0       2 
      0       0       0       0     0.5       0       0  #  SizeSel_P3_Summ
# erN(2)
         -2         15         14       0.21          5          0      -3 
      0       0       0       0     0.5       0       0  #  SizeSel_P4_Summ
# erN(2)
        -15          5       -999       -8.9          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P5_Summ
# erN(2)
         -5          5       -999       0.15          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P6_Summ
# erN(2)
         10         40     30.679         15          9          0       1 
      0       0       0       0       0       3       1  #  Retain_P1_Summe
# rN(2)
        0.1         10     1.1278          3          9          0       2 
      0       0       0       0       0       3       1  #  Retain_P2_Summe
# rN(2)
      0.001          1     0.9999          1          9          0       4 
      0       0       0       0       0       3       2  #  Retain_P3_Summe
# rN(2)
        -10         10          0          0          9          0      -2 
      0       0       0       0       0       0       0  #  Retain_P4_Summe
# rN(2)
        -20         15      -13.7          0         -5          0       3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Peak
# _SummerN(2)
        -15         15       -1.9          0         -5          0       4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Asce
# nd_SummerN(2)
        -15         15          0          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Desc
# end_SummerN(2)
        -15         15          0          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Fina
# l_SummerN(2)
        -15         15          1          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Scal
# e_SummerN(2)
         15         75     40.422       43.1          5          0       1 
      0       0       0       0     0.5       1       1  #  SizeSel_P1_Wint
# erS(3)
         -5          3          3        0.7          5          0      -3 
      0       0       0       0     0.5       0       0  #  SizeSel_P2_Wint
# erS(3)
         -4         12     4.5999       3.42          5          0       2 
      0       0       0       0     0.5       0       0  #  SizeSel_P3_Wint
# erS(3)
         -2         15         14       0.21          5          0      -3 
      0       0       0       0     0.5       0       0  #  SizeSel_P4_Wint
# erS(3)
        -15          5       -999       -8.9          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P5_Wint
# erS(3)
         -5          5       -999       0.15          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P6_Wint
# erS(3)
         10         40     28.816         15          9          0       1 
      0       0       0       0       0       2       1  #  Retain_P1_Winte
# rS(3)
        0.1         10     1.1443          3          9          0       2 
      0       0       0       0       0       2       1  #  Retain_P2_Winte
# rS(3)
      0.001          1      0.986          1          9          0       4 
      0       0       0       0       0       2       2  #  Retain_P3_Winte
# rS(3)
        -10         10          0          0          9          0      -2 
      0       0       0       0       0       0       0  #  Retain_P4_Winte
# rS(3)
        -15         15    -14.995          0          5          0       3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Peak
# _WinterS(3)
        -15         15    -2.4591          0          5          0       4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Asce
# nd_WinterS(3)
        -15         15          0          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Desc
# end_WinterS(3)
        -15         15          0          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Fina
# l_WinterS(3)
        -15         15          1          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Scal
# e_WinterS(3)
         15         75    43.0793       43.1          5          0       1 
      0       0       0       0     0.5       1       1  #  SizeSel_P1_Summ
# erS(4)
         -5          3          3        0.7          5          0      -3 
      0       0       0       0     0.5       0       0  #  SizeSel_P2_Summ
# erS(4)
         -4         12     4.7717       3.42          5          0       2 
      0       0       0       0     0.5       0       0  #  SizeSel_P3_Summ
# erS(4)
         -2         15         14       0.21          5          0      -3 
      0       0       0       0     0.5       0       0  #  SizeSel_P4_Summ
# erS(4)
        -15          5       -999       -8.9          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P5_Summ
# erS(4)
         -5          5       -999       0.15          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P6_Summ
# erS(4)
         10         40     29.055         15          9          0       1 
      0       0       0       0       0       3       1  #  Retain_P1_Summe
# rS(4)
        0.1         10      0.976          3          9          0       2 
      0       0       0       0       0       3       1  #  Retain_P2_Summe
# rS(4)
      0.001          1     0.9995          1          9          0       4 
      0       0       0       0       0       3       2  #  Retain_P3_Summe
# rS(4)
        -10         10          0          0          9          0      -2 
      0       0       0       0       0       0       0  #  Retain_P4_Summe
# rS(4)
        -15         15    -11.004          0          5          0       3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Peak
# _SummerS(4)
        -15         15      -1.44          0          5          0       4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Asce
# nd_SummerS(4)
        -15         15          0          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Desc
# end_SummerS(4)
        -15         15          0          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Fina
# l_SummerS(4)
        -15         15          1          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Scal
# e_SummerS(4)
         15         61    35.8319       43.1          5          0       1 
      0       0       0       0     0.5       0       0  #  SizeSel_P1_TriE
# arly(5)
         -5          3          3        0.7          5          0      -2 
      0       0       0       0     0.5       0       0  #  SizeSel_P2_TriE
# arly(5)
         -4         12     4.2596       3.42          5          0       1 
      0       0       0       0     0.5       0       0  #  SizeSel_P3_TriE
# arly(5)
         -2         15         14       0.21          5          0      -2 
      0       0       0       0     0.5       0       0  #  SizeSel_P4_TriE
# arly(5)
        -15          5       -999       -8.9          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P5_TriE
# arly(5)
         -5          5       -999       0.15          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P6_TriE
# arly(5)
        -15         15    -3.7323          0          5          0       2 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Peak
# _TriEarly(5)
        -15         15    -0.5322          0          5          0       2 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Asce
# nd_TriEarly(5)
        -15         15          0          0          5          0      -3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Desc
# end_TriEarly(5)
        -15         15          0          0          5          0      -3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Fina
# l_TriEarly(5)
        -15         15          1          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Scal
# e_TriEarly(5)
         15         61    36.9845       43.1          5          0       1 
      0       0       0       0     0.5       0       0  #  SizeSel_P1_TriL
# ate(6)
         -5          3          3        0.7          5          0      -2 
      0       0       0       0     0.5       0       0  #  SizeSel_P2_TriL
# ate(6)
         -4         12     4.6735       3.42          5          0       1 
      0       0       0       0     0.5       0       0  #  SizeSel_P3_TriL
# ate(6)
         -2         15         14       0.21          5          0      -2 
      0       0       0       0     0.5       0       0  #  SizeSel_P4_TriL
# ate(6)
        -15          5       -999       -8.9          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P5_TriL
# ate(6)
         -5          5       -999       0.15          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P6_TriL
# ate(6)
        -15         15    -4.0542          0          5          0       2 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Peak
# _TriLate(6)
        -15         15    -0.1367          0          5          0       2 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Asce
# nd_TriLate(6)
        -15         15          0          0          5          0      -3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Desc
# end_TriLate(6)
        -15         15          0          0          5          0      -3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Fina
# l_TriLate(6)
        -15         15          1          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Scal
# e_TriLate(6)
         15         61    43.5877       43.1          5          0       1 
      0       0       0       0     0.5       0       0  #  SizeSel_P1_NWFS
# C(7)
         -5          3          3        0.7          5          0      -2 
      0       0       0       0     0.5       0       0  #  SizeSel_P2_NWFS
# C(7)
         -4         12     5.2029       3.42          5          0       1 
      0       0       0       0     0.5       0       0  #  SizeSel_P3_NWFS
# C(7)
         -2         15         14       0.21          5          0      -2 
      0       0       0       0     0.5       0       0  #  SizeSel_P4_NWFS
# C(7)
        -15          5       -999       -8.9          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P5_NWFS
# C(7)
         -5          5       -999       0.15          5          0      -4 
      0       0       0       0     0.5       0       0  #  SizeSel_P6_NWFS
# C(7)
        -15         15    -5.8784          0          5          0       2 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Peak
# _NWFSC(7)
        -15         15    -0.4792          0          5          0       2 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Asce
# nd_NWFSC(7)
        -15         15          0          0          5          0      -3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Desc
# end_NWFSC(7)
        -15         15          0          0          5          0      -3 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Fina
# l_NWFSC(7)
        -15         15          1          0          5          0      -4 
      0       0       0       0     0.5       0       0  #  SzSel_Male_Scal
# e_NWFSC(7)
# timevary selex parameters 
#_      LO        HI      INIT     PRIOR   PR_SD  PR_type       PHASE
      -31.6       28.4          0          0       14.2          6      4  
# SizeSel_P1_WinterN(1)_BLK1add_1973
      -31.6       28.4          0          0       14.2          6      4  
# SizeSel_P1_WinterN(1)_BLK1add_1983
      -31.6       28.4          0          0       14.2          6      4  
# SizeSel_P1_WinterN(1)_BLK1add_1993
      -31.6       28.4          0          0       14.2          6      4  
# SizeSel_P1_WinterN(1)_BLK1add_2003
      -31.6       28.4          0          0       14.2          6      4  
# SizeSel_P1_WinterN(1)_BLK1add_2011
     -16.19      13.81          0          0      6.905          6      4  
# Retain_P1_WinterN(1)_BLK2add_2003
     -16.19      13.81          0          0      6.905          6      4  
# Retain_P1_WinterN(1)_BLK2add_2010
     -16.19      13.81          0          0      6.905          6      4  
# Retain_P1_WinterN(1)_BLK2add_2011
     -1.601      8.299          0          0     0.8005          6      4  
# Retain_P2_WinterN(1)_BLK2add_2003
     -1.601      8.299          0          0     0.8005          6      4  
# Retain_P2_WinterN(1)_BLK2add_2010
     -1.601      8.299          0          0     0.8005          6      4  
# Retain_P2_WinterN(1)_BLK2add_2011
      0.001          1     0.9945          1          9          0      4  
# Retain_P3_WinterN(1)_BLK2repl_2003
      0.001          1     0.9945          1          9          0      4  
# Retain_P3_WinterN(1)_BLK2repl_2010
      0.001          1     0.9945          1          9          0      4  
# Retain_P3_WinterN(1)_BLK2repl_2011
      -38.8       21.2          0          0       10.6          6      4  
# SizeSel_P1_SummerN(2)_BLK1add_1973
      -38.8       21.2          0          0       10.6          6      4  
# SizeSel_P1_SummerN(2)_BLK1add_1983
      -38.8       21.2          0          0       10.6          6      4  
# SizeSel_P1_SummerN(2)_BLK1add_1993
      -38.8       21.2          0          0       10.6          6      4  
# SizeSel_P1_SummerN(2)_BLK1add_2003
      -38.8       21.2          0          0       10.6          6      4  
# SizeSel_P1_SummerN(2)_BLK1add_2011
    -20.679      9.321          0          0     4.6605          6      4  
# Retain_P1_SummerN(2)_BLK3add_2003
    -20.679      9.321          0          0     4.6605          6      4  
# Retain_P1_SummerN(2)_BLK3add_2009
    -20.679      9.321          0          0     4.6605          6      4  
# Retain_P1_SummerN(2)_BLK3add_2011
    -1.0278     8.8722          0          0     0.5139          6      4  
# Retain_P2_SummerN(2)_BLK3add_2003
    -1.0278     8.8722          0          0     0.5139          6      4  
# Retain_P2_SummerN(2)_BLK3add_2009
    -1.0278     8.8722          0          0     0.5139          6      4  
# Retain_P2_SummerN(2)_BLK3add_2011
      0.001          1     0.9999          1          9          0      4  
# Retain_P3_SummerN(2)_BLK3repl_2003
      0.001          1     0.9999          1          9          0      4  
# Retain_P3_SummerN(2)_BLK3repl_2009
      0.001          1     0.9999          1          9          0      4  
# Retain_P3_SummerN(2)_BLK3repl_2011
    -25.422     34.578          0          0     12.711          6      4  
# SizeSel_P1_WinterS(3)_BLK1add_1973
    -25.422     34.578          0          0     12.711          6      4  
# SizeSel_P1_WinterS(3)_BLK1add_1983
    -25.422     34.578          0          0     12.711          6      4  
# SizeSel_P1_WinterS(3)_BLK1add_1993
    -25.422     34.578          0          0     12.711          6      4  
# SizeSel_P1_WinterS(3)_BLK1add_2003
    -25.422     34.578          0          0     12.711          6      4  
# SizeSel_P1_WinterS(3)_BLK1add_2011
    -18.816     11.184          0          0      5.592          6      4  
# Retain_P1_WinterS(3)_BLK2add_2003
    -18.816     11.184          0          0      5.592          6      4  
# Retain_P1_WinterS(3)_BLK2add_2010
    -18.816     11.184          0          0      5.592          6      4  
# Retain_P1_WinterS(3)_BLK2add_2011
    -1.0443     8.8557          0          0    0.52215          6      4  
# Retain_P2_WinterS(3)_BLK2add_2003
    -1.0443     8.8557          0          0    0.52215          6      4  
# Retain_P2_WinterS(3)_BLK2add_2010
    -1.0443     8.8557          0          0    0.52215          6      4  
# Retain_P2_WinterS(3)_BLK2add_2011
      0.001          1      0.986          1          9          0      4  
# Retain_P3_WinterS(3)_BLK2repl_2003
      0.001          1      0.986          1          9          0      4  
# Retain_P3_WinterS(3)_BLK2repl_2010
      0.001          1      0.986          1          9          0      4  
# Retain_P3_WinterS(3)_BLK2repl_2011
   -28.0793    31.9207          0          0    14.0397          6      4  
# SizeSel_P1_SummerS(4)_BLK1add_1973
   -28.0793    31.9207          0          0    14.0397          6      4  
# SizeSel_P1_SummerS(4)_BLK1add_1983
   -28.0793    31.9207          0          0    14.0397          6      4  
# SizeSel_P1_SummerS(4)_BLK1add_1993
   -28.0793    31.9207          0          0    14.0397          6      4  
# SizeSel_P1_SummerS(4)_BLK1add_2003
   -28.0793    31.9207          0          0    14.0397          6      4  
# SizeSel_P1_SummerS(4)_BLK1add_2011
    -19.055     10.945          0          0     5.4725          6      4  
# Retain_P1_SummerS(4)_BLK3add_2003
    -19.055     10.945          0          0     5.4725          6      4  
# Retain_P1_SummerS(4)_BLK3add_2009
    -19.055     10.945          0          0     5.4725          6      4  
# Retain_P1_SummerS(4)_BLK3add_2011
     -0.876      9.024          0          0      0.438          6      4  
# Retain_P2_SummerS(4)_BLK3add_2003
     -0.876      9.024          0          0      0.438          6      4  
# Retain_P2_SummerS(4)_BLK3add_2009
     -0.876      9.024          0          0      0.438          6      4  
# Retain_P2_SummerS(4)_BLK3add_2011
      0.001          1     0.9995          1          9          0      4  
# Retain_P3_SummerS(4)_BLK3repl_2003
      0.001          1     0.9995          1          9          0      4  
# Retain_P3_SummerS(4)_BLK3repl_2009
      0.001          1     0.9995          1          9          0      4  
# Retain_P3_SummerS(4)_BLK3repl_2011
# info on dev vectors created for selex parms are reported with other devs 
# after tag parameter section 
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase 
#  dev_vector
#      3     1     1     0     0     0     0     1     1  1987  2009     5 
#      0      0      0      0      0      0      0      0      0      0    
#   0      0      0      0      0      0      0      0      0      0      0
#       0      0
#      3     3     3     0     0     0     0     2     1  1987  2009     5 
#      0      0      0      0      0      0      0      0      0      0    
#   0      0      0      0      0      0      0      0      0      0      0
#       0      0
#      5     1     5     1     1     2     0     0     0     0     0     0
#      5     7    10     2     1     2     0     0     0     0     0     0
#      5     8    13     2     1     2     0     0     0     0     0     0
#      5     9    16     2     2     2     0     0     0     0     0     0
#      5    16    19     1     1     2     0     0     0     0     0     0
#      5    22    24     3     1     2     0     0     0     0     0     0
#      5    23    27     3     1     2     0     0     0     0     0     0
#      5    24    30     3     2     2     0     0     0     0     0     0
#      5    31    33     1     1     2     0     0     0     0     0     0
#      5    37    38     2     1     2     0     0     0     0     0     0
#      5    38    41     2     1     2     0     0     0     0     0     0
#      5    39    44     2     2     2     0     0     0     0     0     0
#      5    46    47     1     1     2     0     0     0     0     0     0
#      5    52    52     3     1     2     0     0     0     0     0     0
#      5    53    55     3     1     2     0     0     0     0     0     0
#      5    54    58     3     2     2     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
      2      1      0.02
      4      1      2.38
      5      1      6.26
      2      2      0.02
      4      2      1.89
      5      2      2.21
      2      3      0.02
      4      3      1.25
      5      3      1.83
      2      4      0.02
      4      4      1.34
      5      4       1.6
      4      5      1.59
      4      6      1.19
      4      7      0.59
      5      7      0.22
 -9999   1    0  # terminator
#
15 #_maxlambdaphase
1 #_sd_offset
# read 10 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=
# sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag
# -comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 1 1 1 1 1
 1 3 1 1 1
 5 1 1 0.5 1
 5 2 1 0.5 1
 5 3 1 0.5 1
 5 4 1 0.5 1
 4 1 1 0.5 1
 4 2 1 0.5 1
 4 3 1 0.5 1
 4 4 1 0.5 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_1
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_CPUE/survey:_2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_3
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_CPUE/survey:_4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_3
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_4
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_5
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_6
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:3
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:7
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_1
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_2
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_3
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_7
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_1
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_2
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_3
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_4
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_agecomp:_5
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_agecomp:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_agecomp:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_recruitments
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_crashPenLambda
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex
#  bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr,
#  N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

