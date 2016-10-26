# Lingcod control file North
# for SS v3.x
#July15, 2009
#catch data from washington updated

# Morph setup
1	# Number of growth patterns
1	# N sub morphs within growth patterns

1 # Blocks
1  # blocks in each design 

#1973  1982  1983 1992  1993 1997  1998 2002 2003 2008
1998  2008

# Mortality and growth specifications
0.5	# Fraction female at birth 
1	# M setup: 0=single Par,1=N_breakpoints,2=Lorenzen,3=agespecific;_4=agespec_withseasinterpolate
2	# Number of M breakpoints
11 13	# Ages at M breakpoints
1       # Growth model: 1=VB with L1 and L2, 2=VB with A0 and Linf, 3=Richards, 4=Read vector of L@A 
1	# Age for growth Lmin
20	# Age for growth Lmax or 999 = Linf
0.0 	# SD constant added to LAA (0.1 mimics v1.xx for compatibility only) 
0 	# Variability about growth: 0=CV~f(LAA) [mimic v1.xx], 1=CV~f(A), 2=SD~f(LAA), 3=SD~f(A)
1	# Maturity option: 1=length logistic, 2=age logistic, 3=read age-maturity matrix by growth_pattern
1	# First age allowed to mature
1       # fecundity option - ?
0       # hermaphro
1	# mg parm offset option: 
#old key: 1=direct assignment, 2=each pat. x gender offset from pat. 1 gender 1, 3=offsets as SS2 V1.xx with M old and CV old offset from young values
#new key: 1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)

1	# mg parm adjust method 1=do V1.23 approach, 2=use logistic transform between bounds approach

# Maturity & Growth Parameters
# min 	max   init  	prior pr_type 	sd 	phase 	env 	UseDev	Minyr	Maxyr	DevSD	use_bl bl_type
0.05	0.25	0.18	0.19	0	99	-3	0	0	0	0	0.5	0	0	#M1_natM_young
0.05	0.25	0.18	0.19	0	99	-4	0	0	0	0	0.5	0	0	#M1_natM_old
10	60	30	42.5	0	99	2	0	0	0	0	0.5	0	0	#M1_Lmin
40	140	118	120	0	99	-2	0	0	0	0	0.5	0	0	#M1_Lmax
0.01	0.5	0.1041	0.105	0	99	3	0	0	0	0	0.5	0	0	#M1_VBK
0.01	0.5	0.0633	0.0633	0	99	2	0	0	0	0	0.5	0	0	#M1_CV-young
0.01	0.5	0.085	0.07	0	0.8	3	0	0	0	0	0	0	0	# CV old 
0.15	0.40	0.32	0.32	0	99	-3	0	0	0	0	0.5	0	0	#M2_natM_young
0.15	0.40	0.32	0.32	0	99	-4	0	0	0	0	0.5	0	0	#M2_natM_old
10	60	30	42.5	0	99	3	0	0	0	0	0.5	0	0	#M2_Lmin
40	140	86	90	0	99	-3	0	0	0	0	0.5	0	0	#M2_Lmax
0.01	1	0.149	0.15	0	99	3	0	0	0	0	0.5	0	0	#M2_VBK
0.01	0.5	0.05	0.05	0	99	2	0	0	0	0	0.5	0	0	#M2_CV-young
0.01	0.5	0.085	0.07	0	0.8	3	0	0	0	0	0	0	0	# Male cv old

# Add 2+2*gender lines to read the wt-Len and mat-Len parameters
# Female length-weight
#	LO	HI	INIT		PRIOR	PR_type	SD	PHASE
	-3	3	0.00000176  0.00000176	0	99	-3	0	0	0	0	0.5	0	0	#Female wt-len-1 a
	-3	5	3.39780	    3.39780	0	99	-3	0	0	0	0	0.5	0	0	#Female wt-len-2 b
# Female maturity 
	-3	100	68.059	0.1577	0	99	-3	0	0	0	0	0.5	0	0	#Female mat-len-infl
	-5	5	-0.1577	68.059	0	99	-3	0	0	0	0	0.5	0	0	#Female mat-len-slope
# Female fecundity - Same as biomass if intercept = 1 and slope = 0
	-3	3	1.	1.	0	99	-3	0	0	0	0	0.5	0	0	#Female eggs/gm intercept
	-3	3	0.	0.	0	99	-3	0	0	0	0	0.5	0	0	#Female eggs/gm slope
# Male length-weight
	-3	3	0.000003953	0.000003953	0	99	-3	0	0	0	0	0.5	0	0	#Male wt-len-1
	-5	5	3.2149   	3.2149		0	99	-3	0	0	0	0	0.5	0	0	#Male wt-len-2
# Distribute recruitment among growth pattern x area x season
0	999	1	1	0	0.8	-3	0	0	0	0	0.5	0	0	# GP 1
0	999	1	1	0	0.8	-3	0	0	0	0	0.5	0	0	# Area 1
0	999	1	1	0	0.8	-3	0	0	0	0	0.5	0	0	# Season 1
# Cohort growth (K) deviation parameter
-1	1	1	1	0	99	-3	0	0	1980	1983	0.5	0	0
# Seasonal effects on biology parameters (0=none)
 0 0 0 0 0 0 0 0 0 0
# Spawner-recruit parameters											
1	# SR_fxn:  1=Beverton-Holt											
#LO	HI	INIT	PRIOR	Pr_type	SD	PHASE					
5	20	8.22947	7.6187	0	99	2	#Ln(R0)				
0.2	5	0.8	0.9	0	99	-4	#steepness				
0	20	0.5	0.5	0	99	-3	#SD_recruitments
-5	5	0	0	0	99	-3	#Env_link				
-5	5	0	0	0	99	-5	#_ln(init_eq_R_multiplier)
 0 	2 	0 	1 	0 	50 	-50      	# Autocorrelation placeholder (Future implementation)
0 # index of environmental variable to be used
0 # env target parameter: 1=rec devs, 2=R0, 3=steepness
1 # rec dev type: 0=none, 1=devvector (zero-sum), 2=simple deviations (no sum constraint)

# Recruitment residuals
1928	# Start year recruitment residuals
2007	# End year recruitment residuals
3	# Phase

1 # Read 11 advanced recruitment options: 0=no, 1=yes
0	# first year for early rec devs
-4 	# phase for early rec devs
5	# Phase for forecast recruit deviations
1 	# Lambda for forecast recr devs before endyr+1
1950	#_last_yr_nobias_adj_in_MPD
1964 	# first year of full bias correction (linear ramp up from this year minus the plus-age to this year)
2007 	# last year for full bias correction in_MPD
2008 	#_first_recent_yr_nobias_adj_in_MPD
1.0     # Max bias correction
0	# placeholder
-15	# Lower bound rec devs
15	# Upper bound rec devs
0       # read intitial values for rec devs

# Fishing mortality setup 
0.1 	# F ballpark for tuning early phases
1999 	# F ballpark year
1 	# F method:  1=Pope's; 2=Instan. F; 3=Hybrid (recommended)
0.9 	# max F or harvest rate, depends on F_Method

#init_F_setupforeachfleet										
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE						
0	1	0.0009	0.009	0	99	1						
0	1	0.0000	0.009	0	99	-1

# Catchability (Q) setup
# A=do power: 0=skip, survey is prop. to abundance, 1= add par for non-linearity
# B=env. link: 0=skip, 1= add par for env. effect on Q
# C=extra SD: 0=skip, 1= add par. for additive constant to input SE (in ln space)
# D=type: <0=mirror lower abs(#) fleet, 0=no par Q is median unbiased, 1=no par Q is mean unbiased, 2=estimate par for ln(Q)
# 	   3=ln(Q) + set of devs about ln(Q) for all years. 4=ln(Q) + set of devs about Q for indexyr-1
# E=Units: 0=numbers, 1=biomass
# F=err_type 0=lognormal, >0=T-dist. DF=input value
# A B C D E F
  0 0 0	0 1 0 #Com_1
  0 0 0	0 1 0 #Rec_2
  0 0 0	0 1 0 #Tri_3
  0 0 0	0 1 0 #NWFSC_4
  0 0 0	0 1 0 #Logbk_5

# Selectivity Specification
#Type	Retent	Moffset	Special
#_SELEX_&_RETENTION_PARAMETERS													
#Selex_type Do_retention(0/1) Do_male Mirrored_selex_number										
#Length Selectivity
24	1	0	0	#Com_1
24	0	2	0	#Rec_2	
24	0	0	0	#Tri_3
24	0	0	0	#NWFSC_4
5	0	0	1	#Logbk_5
#_Age	selectivity													
10	0	0	0	#Com_1
10	0	0	0	#Rec_2	
10	0	0	0	#Tri_3
10	0	0	0	#NWFSC_4
10	0	0	0	#Logbk_5

# Selectivity Parameter

#Low	High	Init	Prior	PrType	SD	Phase	env	usedev	minyr	maxyear	sd	block	blswitch # 1 means that parm’ = baseparm + blockparm # 2 means that parm’ = blockparm
#Comm
35	100	45	75	0	50	2	0	0	0	0	0.5	1	2	# Peak
-6	4	0	0	0	50	2	0	0	0	0	0.5	1	2	# Top width
-1	9	4	4	0	50	3	0	0	0	0	0	0	0	# Ascending width			
-1	9	5	5.5	0	50	3	0	0	0	0	0	0	0	# Descending width	
-5	9	-2	-2	0	50	2	0	0	0	0	0	0	0	# inital value		
-5	9	9	5	0	50	3	0	0	0	0	0	0	0	# Final										
#retention			
31	100	40	55	0	50	-2	0	0	0	0	0.5	1	2	# Inflection
0.1	10	2	1	0	99	-2	0	0	0	0	0.5	0	0	# Slope
0.001	1	1	1	0	99	-3	0	0	0	0	0.5	1	2	# Asymptotic retention
0	0	0	0	0	99	-3	0	0	0	0	0.5	0	0	# male arithmetic offset to inflection

##Recreational														
35	100	50	75	0	50	2	0	0	0	0	0.5	1	2	# Peak
-6	4	-5.9	0	0	50	-2	0	0	0	0	0	0	0	# Top width 
-1	9	4	4	0	50	3	0	0	0	0	0	0	0	# Ascending width			
-1	9	5	5.5	0	50	3	0	0	0	0	0	0	0	# Descending width	
-5	9	-4.9	-2	0	50	-2	0	0	0	0	0	0	0	# inital value 
-5	9	-4.9	5	0	50	-3	0	0	0	0	0	0	0	# Final

30	100	58	60	0	99	2	0	0	0	0	0	0	0	#dogleg female vs. male rec
-1	1	-.99	0	0	99	-3	0	0	0	0	0	0	0	#log min length select relative to male
-2	1	-1.99	-.5	0	99	-3	0	0	0	0	0	0	0	#log relative select at dogleg
-2	2	1.2	-.2	0	99	3	0	0	0	0	0	0	0	#log relative select at maxlength # fixed since hitting bound	
#Triennial
35	100	70	75	0	50	-2	0	0	0	0	0.5	0	0	# Peak
-6	4	-0.55	0	0	50	-2	0	0	0	0	0	0	0	# Top width 
-1	9	5.34	4	0	50	-2	0	0	0	0	0	0	0	# Ascending width			
-1	9	5.2	5.5	0	50	-2	0	0	0	0	0	0	0	# Descending width	
-5	9	-1.14	-2	0	50	-2	0	0	0	0	0	0	0	# inital value		
-5	9	-4.9	5	0	50	-3	0	0	0	0	0	0	0	# Final		
#NWFSC
35	100	40	75	0	50	2	0	0	0	0	0.5	0	0	# Peak
-6	4	-5.9	0	0	50	2	0	0	0	0	0	0	0	# Top width 
-1	9	4	4	0	50	3	0	0	0	0	0	0	0	# Ascending width			
-1	9	5	5.5	0	50	3	0	0	0	0	0	0	0	# Descending width	
-5	9	-2	-2	0	50	2	0	0	0	0	0	0	0	# inital value		
-5	9	-4.9	5	0	50	-3	0	0	0	0	0	0	0	# Final 
#logbook mirror
-2 	0	-1	0	0	50	-2	0	0	0	0	0	0	0	
-2 	0	-1	0	0	50	-3	0	0	0	0	0	0	0	

#Ages pattern 11	
# 0	1	0.1	0.1	0	50	-2	0	0	0	0	0	0	0	
# 1	14	14	14	0	50	-3	0	0	0	0	0	0	0	

# 0	1	0.1	0.1	0	50	-2	0	0	0	0	0	0	0	
# 1	14	14	14	0	50	-3	0	0	0	0	0	0	0	

# 0	1	0.1	0.1	0	50	-2	0	0	0	0	0	0	0	
# 1	14	14	14	0	50	-3	0	0	0	0	0	0	0	

# 0	1	0.1	0.1	0	50	-2	0	0	0	0	0	0	0	
# 1	14	14	14	0	50	-3	0	0	0	0	0	0	0	

# 0	1	0.1	0.1	0	50	-2	0	0	0	0	0	0	0	
# 1	14	14	14	0	50	-3	0	0	0	0	0	0	0
	
1	# Selex block setup: 0=Read one line apply all, 1=read one line each parameter
# Lo	Hi	Init	Prior	P_type	SD	Phase
35	100	45	75	0	50	2
-6	4	0	0	0	50	3
31	100	40	55	0	99	3
0.1	1	0.9	0.9	0	99	3
35	100	45	75	0	50	3

1 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds)
0 # Tagging flag: 0=none,1=read parameters for tagging

### Likelihood related quantities ###
# variance/sample size adjustment by fleet
1 # Do variance adjustments
0  0  0  0  0   # const added to survey cv
0  0  0  0  0   # const added to discard sd
0  0  0  0  0   # const added to body weight sd
1  1  1  1  1   # mult scalar for length comps
.5  .5  1  1  1   # mult scalar for age comps
1  1  1  1  1   # mult scalar for length at age obs

30 	# DF discard fraction data t-distribution
30 	# DF mean body weight data t-distribution

1 	# Max N lambda phases: read this N values for each item below
1	# SD offset (CPUE, discard, mean body weight, recruitment devs): 0=omit log(s) term, 1=include

5 # N changes to default Lambdas = 1.0
# Component codes:  
#  1=survey
#  2=discard
#  3=mean body weight
#  4=length frequency
#  5=age frequency
#  6=Weight frequency
#  7=size at age
#  8=catch
#  9=initial equilibrium catch
#  10=rec devs
#  11=parameter priors
#  12=parameter deviations
#  13=Crash penalty
#  14=Morph composition
#  15=Tag composition
#  16=Tag return
# Component fleet/survey  phase  value  wtfreq_method
5	1	1	0	1
5	2	1	0	1
5	3	1	0	1
5	4	1	0	1
5	5	1	0	1

0 # extra SD pointer

999 # end of control file