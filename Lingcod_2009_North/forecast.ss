# Forecast specifications
# lingcod in SS v3.x
# North Model

1 	# Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt); 4=F(endyr); 5=Ave F (enter yrs); 6=read Fmult
2000 	# First year for averaging selex to use in forecast (e.g. 2004; or use -x to be rel endyr)
2008 	# Last year for averaging selex to use in forecast 
1	# Benchmarks:0=skip, 1=calc Fspr, Fbtgt, Fmsy
1 	# MSY: 0=none,1=F(SPR),2=calc F(MSY),3=F(Btgt),4=set to F(endyr) 
0.45 	# SPR target (e.g. 0.40)
0.40 	# Biomass target (e.g. 0.40)
10 	# Number of forecast years 
1     # Read advanced options add indents below if 1
0 	# Puntalyzer output: 0=no,1=yes 
1999 	# Rebuilder:  first year catch could have been set to zero (Ydecl)
2009 	# Rebuilder:  year for current age structure (Yinit)
1 	# Control rule method (1=west coast adjust catch; 2=adjust F) 
0.4 	# Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40) 
0.1 	# Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10) 
1 	# Control rule fraction of Flimit (e.g. 0.75) 
-1 	# maximum annual catch during forecast (not coded yet)
0 	# 0= no implementation error; 1=use implementation error in forecast (not coded yet)
0.1 	# stddev of log(realized F/target F) in forecast (not coded yet)
2 	# fleet allocation (in terms of F) (1=use endyr pattern, no read; 2=read below)
1.0 0.5	# relative F for forecast when using F;  seasons; fleets within season
0 # Number of manual forecast catches to input
# basis for forecatch:  1=retained catch; 2=total dead catch (if line above > 0)
# Year Seas Fleet Catch

999 # end of forecast file	