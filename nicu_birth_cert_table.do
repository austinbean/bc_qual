* Birth Certificates don't diagnose nicu visits properly.  
	

log using "/Users/austinbean/Desktop/nicu_table.log", replace

foreach yr of numlist 2005(1)2010{

 quietly{
 
use "/Users/austinbean/Google Drive/Restricted Linked Birth Cohort Records/LinkCO`yr'US/`yr'Denominator.dta", clear

keep if ostate == "TX"
count 
local total_birth_`yr' = `r(N)'

count if brthwgt > 2500 & ab_nicu == "N"
local total_g25_na_`yr' = `r(N)'

count if brthwgt > 2500 & ab_nicu == "Y"
local total_g25_a_`yr' = `r(N)'

count if brthwgt > 2500 & !(ab_nicu == "Y" | ab_nicu == "N")
local total_g25_u_`yr' = `r(N)'

count if brthwgt <= 2500 & ab_nicu == "N"
local total_l25_na_`yr' = `r(N)'

count if brthwgt <= 2500 & ab_nicu == "Y"
local total_l25_a_`yr' = `r(N)'

count if brthwgt <= 2500 & !(ab_nicu == "Y" | ab_nicu == "N")
local total_l25_u_`yr' = `r(N)'

count if brthwgt <= 1500 & ab_nicu == "N"
local total_l15_na_`yr' = `r(N)'

count if brthwgt <= 1500 & ab_nicu == "N" & infant_death_number == .
local total_l15_nad_`yr' = `r(N)'

count if brthwgt <= 1500 & ab_nicu == "N" & infant_death_number != .
local total_l15_nadd_`yr' = `r(N)'

count if brthwgt <= 1500 & ab_nicu == "Y"
local total_l15_a_`yr' = `r(N)'

count if brthwgt <= 1500 & !(ab_nicu == "Y" | ab_nicu == "N")
local total_l15_u_`yr' = `r(N)'
}
di "   "
di "   "
di " ----------------- YEAR  `yr' ---------------------- "
di "TOTAL BIRTHS              : `total_birth_`yr''"
di " "
di "> 2500 GRAMS, NOT ADMITTED: `total_g25_na_`yr''"
di "> 2500 GRAMS, ADMITTED    : `total_g25_a_`yr'' "
di "> 2500 GRAMS, UNKNOWN     : `total_g25_u_`yr'' "
di " "
di "LBW, NOT ADMITTED         : `total_l25_na_`yr''"
di "LBW, ADMITTED             : `total_l25_a_`yr''"
di "LBW, UNKNOWN              : `total_l25_u_`yr'' "
di " "
di "VLBW, NOT ADMITTED        : `total_l15_na_`yr''"
di " OF NOT AD., ALIVE 1 YR   : `total_l15_nad_`yr''  "
di " OF NOT AD., DTH W/N 1 YR : `total_l15_nadd_`yr''  "
di "VLBW, ADMITTED            : `total_l15_a_`yr''"
di "VLBW, UNKNOWN             : `total_l15_u_`yr'' "
di "(BIRTH CERTIFICATE DATA)"


}


frame create inpatient 
frame change inpatient

quietly {
local whereami = "austinbean" 
global file_p = "/Users/`whereami'/Desktop/programs/volumeoutcome/"
global data_p = "/Users/`whereami'/Google Drive/Texas PUDF Zipped Backup Files/"
global maplocation "/Users/`whereami'/Google Drive/Choice Model with Fixed Effects/"




    quietly do "${data_p}Do Files/make_birth_data.do"
	gen DATE = quarterly(DISCHARGE, "YQ")
	format DATE %tq
	gen YEAR = yofd(dofq(DATE))
	
	keep if YEAR >= 2005 & YEAR <= 2010
	keep if TYPE_OF_ADMISSION == 4  
	}
	
	foreach yr of numlist 2005(1)2010{
	quietly{
	count if YEAR == `yr'
	local total_birth_`yr' = `r(N)'

	count if BWT_G2500 == 1 & ADMN_NICU == 0 & YEAR == `yr'
	local total_g25_na_`yr' = `r(N)'

	count if BWT_G2500 == 1 & ADMN_NICU == 1 & YEAR == `yr'
	local total_g25_a_`yr' = `r(N)'
	
	count if BWT_G2500 == 1 & !(ADMN_NICU == 1 | ADMN_NICU == 0) & YEAR == `yr'
	local total_g25_u_`yr' = `r(N)'

	count if LBW == 1 & ADMN_NICU == 0 & YEAR == `yr'
	local total_l25_na_`yr' = `r(N)'

	count if LBW == 1 & ADMN_NICU == 1 & YEAR == `yr'
	local total_l25_a_`yr' = `r(N)'
	
	count if LBW == 1 & !(ADMN_NICU == 1 | ADMN_NICU == 0) & YEAR == `yr'
	local total_g25_u_`yr' = `r(N)'

	count if VLBW == 1 & ADMN_NICU == 0 & YEAR == `yr'
	local total_l15_na_`yr' = `r(N)'
	
	count if VLBW == 1 & ADMN_NICU == 0 & YEAR == `yr' & (PATIENT_STATUS == 1)
	local total_l15_nad_`yr' = `r(N)'
	
	count if VLBW == 1 & ADMN_NICU == 0 & YEAR == `yr' & (PATIENT_STATUS == 20 | PATIENT_STATUS == 40 | PATIENT_STATUS == 41 | PATIENT_STATUS == 42 | PATIENT_STATUS == 43 )
	local total_l15_nadd_`yr' = `r(N)'

	count if VLBW == 1 & ADMN_NICU == 1 & YEAR == `yr'
	local total_l15_a_`yr' = `r(N)'
	
	count if VLBW == 1 & !(ADMN_NICU == 1 | ADMN_NICU == 0) & YEAR == `yr'
	local total_g25_u_`yr' = `r(N)'
	}
	
	di "   "
	di "   "
	di " ----------------- YEAR  `yr' ---------------------- "
	di "TOTAL BIRTHS              : `total_birth_`yr''"
	di " "
	di "> 2500 GRAMS, NOT ADMITTED: `total_g25_na_`yr''"
	di "> 2500 GRAMS, ADMITTED    : `total_g25_a_`yr'' "
	di "> 2500 GRAMS, UNKNOWN     : `total_g25_u_`yr'' "
	di " "
	di "LBW, NOT ADMITTED         : `total_l25_na_`yr''"
	di "LBW, ADMITTED             : `total_l25_a_`yr''"
	di "LBW, UNKNOWN              : `total_l25_u_`yr'' "
	di " "
	di "VLBW, NOT ADMITTED        : `total_l15_na_`yr''"
	di "  OF THOSE, DISC. NORMAL  : `total_l15_nad_`yr''"
	di "  OF THOSE, DEATHS        : `total_l15_nadd_`yr''"
	di "VLBW, ADMITTED            : `total_l15_a_`yr''"
	di "VLBW, UNKNOWN             : `total_l15_u_`yr'' "
	di "(INPATIENT DATA)"

	}

	
/*
THREE NUMBERS NEED CORRECTING SINCE THEY APPEAR AS ZEROS

*/

foreach nm of numlist 2006 2009 2010{
quietly{
use "/Users/austinbean/Google Drive/Restricted Linked Birth Cohort Records/LinkCO`nm'US/`nm'Numerator.dta", clear

keep if ostate == "TX"
}
di "`nm'"
count if brthwgt <= 1500 & ab_nicu == "N"

}
	
log close
	
	


