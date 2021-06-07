/*Recode HealthCenterSiteInfo*/
//**Grant ID Info & BHCMISID**//
encode grantnumber, gen(grantid)
encode bhcmisid, gen(bhcid)

//Expansion**//
gen expansion = 0 if healthcenterstate == "AL" | healthcenterstate == "FL" | healthcenterstate == "GA" | healthcenterstate == "KS" | healthcenterstate == "MS" | healthcenterstate == "NC" | healthcenterstate == "SC" | healthcenterstate == "SD" | healthcenterstate == "MO" | healthcenterstate == "OK" | healthcenterstate == "TN" | healthcenterstate == "TX" | healthcenterstate == "WI" | healthcenterstate == "WY"
replace expansion = 1 if healthcenterstate != "AL" | healthcenterstate != "FL" | healthcenterstate != "GA" | healthcenterstate != "KS" | healthcenterstate != "MS" | healthcenterstate != "NC" | healthcenterstate != "SC" | healthcenterstate != "SD" | healthcenterstate != "MO" | healthcenterstate != "OK" | healthcenterstate != "TN" | healthcenterstate != "TX" | healthcenterstate != "WI" | healthcenterstate !="WY"

//**Dummy Variable for Site Status**//
generate sitestat = 0
replace sitestat = 1 if sitestatus == "Active"
replace sitestat = . if missing(sitestatus) /*107 observations missing*/

//**Dummy Variable for Site Type **//
generate sitetyp = 1 if sitetype == "Administrative/Service Delivery Site "
replace sitetyp = 0 if sitetype == "Service Delivery Site"
replace sitetyp = . if missing(sitetype) /*0 observations missing*/

//**Dummy Variable for Location Type**//
generate location = 1 if locationtype == "Mobile Van"
replace location = 2 if locationtype == "Permanent"
replace location = 3 if locationtype == "Seasonal"
replace location = . if missing(locationtype) /*0 missing observations*/

//**Dummy Variable for Location Setting**//
generate setting = 1 if locationsetting == "All Other Clinic Types"
replace setting = 2 if locationsetting == "Correctional Facility"
replace setting = 3 if locationsetting == "Domestic Violence"
replace setting = 4 if locationsetting == "Hospital"
replace setting = 5 if locationsetting == "Nursing Home"
replace setting = 6 if locationsetting == "School"
replace setting = . if missing(locationsetting) /*0 missing observations*/

//**Dummy Variable for Operational Setting**//
generate operateschedule = 1 if operationalschedule == "Full-Time"
replace operateschedule = 0 if operationalschedule == "Part-Time"
replace operateschedule = . if missing(operationalschedule) /*0 missing observations*/

//**Dummy Variable for Calendar Schedule**//
generate calschedule = 1 if calendarschedule == "Seasonal"
replace calschedule = 2 if calendarschedule == "Year-Round"
replace calschedule = . if missing(calendarschedule) /*0 missing observations*/

//**Dummy Variable for Service Area Population**//
generate areapopulation = 1 if serviceareapopulation == "Rural"
replace areapopulation = 2 if serviceareapopulation == "Urban"
replace areapopulation = . if missing(serviceareapopulation) /*0 missing observations*/

//**Dummy Variable for Site Operated By**//
generate serviceoperator = 1 if siteoperatedby == "Contractor"
replace serviceoperator = 2 if siteoperatedby == "Health Center/Applicant"
replace serviceoperator = 3 if siteoperatedby == "Subrecipient"
replace serviceoperator = . if missing(siteoperatedby) /*0 missing observations*/

//**Dummy Variable for State**//
generate state = 1 if sitestate == "AK"
replace state = 2 if sitestate == "AL"
replace state = 3 if sitestate == "AR"
replace state = 4 if sitestate == "AS"
replace state = 5 if sitestate == "AZ"
replace state = 6 if sitestate == "CA"
replace state = 7 if sitestate == "CO"
replace state = 8 if sitestate == "CT"
replace state = 9 if sitestate == "DC"
replace state = 10 if sitestate == "DE"
replace state = 11 if sitestate == "FL"
replace state = 12 if sitestate == "FM"
replace state = 13 if sitestate == "GA"
replace state = 14 if sitestate == "GU"
replace state = 15 if sitestate == "HI"
replace state = 16 if sitestate == "IA"
replace state = 17 if sitestate == "ID"
replace state = 18 if sitestate == "IL"
replace state = 19 if sitestate == "IN"
replace state = 20 if sitestate == "KS"
replace state = 21 if sitestate == "KY"
replace state = 22 if sitestate == "LA"
replace state = 23 if sitestate == "MA"
replace state = 24 if sitestate == "MD"
replace state = 25 if sitestate == "ME"
replace state = 26 if sitestate == "MH"
replace state = 27 if sitestate == "MI"
replace state = 28 if sitestate == "MN"
replace state = 29 if sitestate == "MO"
replace state = 30 if sitestate == "MP"
replace state = 31 if sitestate == "MS"
replace state = 32 if sitestate == "MT"
replace state = 33 if sitestate == "NC"
replace state = 34 if sitestate == "ND"
replace state = 35 if sitestate == "NE"
replace state = 36 if sitestate == "NH"
replace state = 37 if sitestate == "NJ"
replace state = 38 if sitestate == "NM"
replace state = 39 if sitestate == "NV"
replace state = 40 if sitestate == "NY"
replace state = 41 if sitestate == "OH"
replace state = 42 if sitestate == "OK"
replace state = 43 if sitestate == "OR"
replace state = 44 if sitestate == "PA"
replace state = 45 if sitestate == "PR"
replace state = 46 if sitestate == "PW"
replace state = 47 if sitestate == "RI"
replace state = 48 if sitestate == "SC"
replace state = 49 if sitestate == "SD"
replace state = 50 if sitestate == "TN"
replace state = 51 if sitestate == "TX"
replace state = 52 if sitestate == "UT"
replace state = 53 if sitestate == "VA"
replace state = 54 if sitestate == "VI"
replace state = 55 if sitestate == "VT"
replace state = 56 if sitestate == "WA"
replace state = 57 if sitestate == "WI"
replace state = 58 if sitestate == "WV"
replace state = 59 if sitestate == "WY"
replace state = . if missing(sitestate) /*0 missing observations*/

/*Generate excel*/
 export excel using "/Users/finndobkin/Desktop/healthcenter.xlsx", firstrow(variables)
 
 
 //**Recode HealthCenterInfo**//
 import delimited "/Users/finndobkin/Desktop/Book8.csv", encoding(UTF-8) clear 
 
 /*Dummy Variable for FundingCHC*/
 generate fundchc = 1 if fundingchc == "TRUE"
 replace fundchc = 0 if fundingchc == "FALSE"
 replace fundchc = . if missing(fundingchc) /*0 missing observations*/
 
 /*Dummy Variable for FundingMHC*/
 generate fundmhc = 1 if fundingmhc == "TRUE"
 replace fundmhc = 0 if fundingmhc == "FALSE"
 replace fundchc = . if missing(fundingmhc) /*0 missing observations*/
 
 /*Dummy Variable for FundingHO*/
 generate fundho = 1 if fundingho == "TRUE"
 replace fundho = 0 if fundingho == "FALSE"
 replace fundho = . if missing(fundingho) /*0 missing observations*/
 
 /*Dummy Variable for Fundingph*/
 generate fundph = 1 if fundingph == "TRUE"
 replace fundph = 0 if fundingph == "FALSE"
 replace fundph = . if missing(fundingph) /*0 missing observations*/
 
 /*Dummy Variable for urbanruralflag*/
 generate ruralurbanflag = 1 if urbanruralflag == "Rural"
 replace ruralurbanflag = 0 if urbanruralflag == "Urban"
 replace ruralurbanflag = . if missing(urbanruralflag) /*0 missing observations*/
 
 /*Dummy Variable for nmhcselfidentifyflag*/
 generate nmhcidentifyflag = 1 if nmhcselfidentifyflag == "Yes"
 replace nmhcidentifyflag = 0 if nmhcselfidentifyflag == "No"
 replace nmhcidentifyflag = . if missing(nmhcselfidentifyflag) /*0 missing observations*/
  
  //**Dummy Variable for State**//
generate state = 1 if healthcenterstate == "AK"
replace state = 2 if healthcenterstate == "AL"
replace state = 3 if healthcenterstate == "AR"
replace state = 4 if healthcenterstate == "AS"
replace state = 5 if healthcenterstate == "AZ"
replace state = 6 if healthcenterstate == "CA"
replace state = 7 if healthcenterstate == "CO"
replace state = 8 if healthcenterstate == "CT"
replace state = 9 if healthcenterstate == "DC"
replace state = 10 if healthcenterstate == "DE"
replace state = 11 if healthcenterstate == "FL"
replace state = 12 if healthcenterstate == "FM"
replace state = 13 if healthcenterstate == "GA"
replace state = 14 if healthcenterstate == "GU"
replace state = 15 if healthcenterstate == "HI"
replace state = 16 if healthcenterstate == "IA"
replace state = 17 if healthcenterstate == "ID"
replace state = 18 if healthcenterstate == "IL"
replace state = 19 if healthcenterstate == "IN"
replace state = 20 if healthcenterstate == "KS"
replace state = 21 if healthcenterstate == "KY"
replace state = 22 if healthcenterstate == "LA"
replace state = 23 if healthcenterstate == "MA"
replace state = 24 if healthcenterstate == "MD"
replace state = 25 if healthcenterstate == "ME"
replace state = 26 if healthcenterstate == "MH"
replace state = 27 if healthcenterstate == "MI"
replace state = 28 if healthcenterstate == "MN"
replace state = 29 if healthcenterstate == "MO"
replace state = 30 if healthcenterstate == "MP"
replace state = 31 if healthcenterstate == "MS"
replace state = 32 if healthcenterstate == "MT"
replace state = 33 if healthcenterstate == "NC"
replace state = 34 if healthcenterstate == "ND"
replace state = 35 if healthcenterstate == "NE"
replace state = 36 if healthcenterstate == "NH"
replace state = 37 if healthcenterstate == "NJ"
replace state = 38 if healthcenterstate == "NM"
replace state = 39 if healthcenterstate == "NV"
replace state = 40 if healthcenterstate == "NY"
replace state = 41 if healthcenterstate == "OH"
replace state = 42 if healthcenterstate == "OK"
replace state = 43 if healthcenterstate == "OR"
replace state = 44 if healthcenterstate == "PA"
replace state = 45 if healthcenterstate == "PR"
replace state = 46 if healthcenterstate == "PW"
replace state = 47 if healthcenterstate == "RI"
replace state = 48 if healthcenterstate == "SC"
replace state = 49 if healthcenterstate == "SD"
replace state = 50 if healthcenterstate == "TN"
replace state = 51 if healthcenterstate == "TX"
replace state = 52 if healthcenterstate == "UT"
replace state = 53 if healthcenterstate == "VA"
replace state = 54 if healthcenterstate == "VI"
replace state = 55 if healthcenterstate == "VT"
replace state = 56 if healthcenterstate == "WA"
replace state = 57 if healthcenterstate == "WI"
replace state = 58 if healthcenterstate == "WV"
replace state = 59 if healthcenterstate == "WY"
replace state = . if missing(healthcenterstate) /*0 missing observations*/

 /*Generate excel*/
  export excel using "/Users/finndobkin/Desktop/healthcenter2.xlsx", firstrow(variables)
 
/**Descriptive Analysis**//
/*Import data*/
import delimited "/Users/finndobkin/Desktop/healthcentersiteinfo.csv", clear 

/*Site status by physical environment and state*/
sort state
by state : tabulate sitestat areapopulation

/*Import Table 3A & 5*/
import excel "/Users/finndobkin/Desktop/patient_physican.xlsx", sheet("Sheet2") firstrow ///
case(lower) clear

 /*Dummy Variable for urbanruralflag*/
 generate ruralurbanflag = 1 if serviceareapopulation == "Rural"
 replace ruralurbanflag = 0 if serviceareapopulation == "Urban"
 replace ruralurbanflag = . if missing(serviceareapopulation) /*0 missing observations*/
 
 /*Drop bad columns*/
 drop e f g h i j k l m n o p q r s t u v 
 
/*Generate labels patients*/
label variable t3b_l8_ca total_hispanic
label variable t3b_l8_cb total_nonhispanic
label variable t3b_l8_cc total_unreported
label variable t3b_l8_cd total_all
/*Generate labels physicians*/
label variable t5_l8_ca physician_fte
label variable t5_l8_cb physician_clinic_visit
label variable t5_l8_cb2 physician_virtual_visit
/*Generate labels NPs, PAs, CNMs*/
label variable t5_l10a_ca nppacnm_fte
label variable t5_l10a_cb nppacnm_clinic_visit
label variable t5_l10a_cb2 nppacnm_virtual_visit
/*Generate labels Nurses, Other Medical Personnell, Lab Personnell, and X-rays*/
label variable t5_l15_ca
label variable t5_l15_cb
label variable t5_l15_cb2
/*Generate labels Enabling Services*/
label variable t5_l29_ca enabling_service_fte
label variable t5_l29_cb enabling_service_clinic_visit
label variable t5_l29_cb2 enabling_service_virtual_visit
/*Generate labels Non-Clinical Staff*/
label variable t5_l33_ca total_facility_fte 

/*Generate physician ratio variable*/
gen patient_physician_ratio = t3b_l8_cd / t5_l8_ca

/*Estimate physician ratio averages across states rural*/
collapse (mean) patient_physician_ratio, by(healthcenterstate ruralurbanflag)

/*Macro for data import*/
global control "import excel "/Users/finndobkin/Desktop/patient_physican.xlsx", sheet("Sheet2") firstrow case(lower) clear"

/*Reimport*/
$control

/*Generate patient NP, PA, CNM ratio variable*/
gen patient_nppacnm_ratio = t3b_l8_cd / t5_l10a_ca 

/*Estimate nurse practicioner ratio averages across states rural*/
collapse (mean) patient_nppacnm_ratio, by(healthcenterstate ruralurbanflag)

/*Reimport*/
$control

/*Generate patient nursing staff ratio*/
gen patient_nursingstaff = t3b_l8_cd / t5_l15_ca

/*Estimate nurse practicioner ratio averages across states rural*/
collapse (mean) patient_nursingstaff, by(healthcenterstate ruralurbanflag)

//**Estimate size of center**//
/*Descritive analysis*/
summarize t5_l8_ca, detail

/*Generate variable for center size by physician FTE*/
gen center_size = 1 if t5_l8_ca > 0 & t5_l8_ca <= 2.17
replace center_size = 2 if t5_l8_ca > 2.17 & t5_l8_ca <= 5.18
replace center_size = 3 if t5_l8_ca > 5.18 & t5_l8_ca <= 11.88
replace center_size = 4 if t5_l8_ca > 11.88

/*Generate physician ratio variable*/
gen patient_physician_ratio = t3b_l8_cd / t5_l8_ca

/*Estimate average ppr by center size*/
sort state
by state : tabulate center_size 

/*Generate new center size variable*/
drop center_size 
gen center_size = 1 if t5_l8_ca > 0 & t5_l8_ca <= 2
replace center_size = 2 if t5_l8_ca > 2 & t5_l8_ca <= 5
replace center_size = 3 if t5_l8_ca > 5 & t5_l8_ca <= 11
replace center_size = 4 if t5_l8_ca > 11

//**Other Data Elements**//
/*Macro for data import*/
global control " import delimited "/Users/finndobkin/Desktop/healthcenter.csv", case(preserve) clear"

/*Reimport*/
$control

/*Label variables*/
label variable Tode_L1a_Ca "Number of physicians, CNPs, and PAs with DATA waiver to treat opioid use disorder" --x
label variable Tode_L1b_Ca "Number of patients received medication assisted treatment for opioid use disorder" --x
label variable Tode_L2a1_Ca "Did your organization use telemedicine to provide remote clinical services?" --x 
label variable Tode_L2a2_Ca "Who did you use telemdicine to communicate with?" 
label variable Tode_L2a3_Ca "What primary telemedicine services were used at your organization"
label variable Tode_L2a3_Other "Other primary telemedicine services used at your organization?"
label variable Tode_L2b_Ca "If you did not have telemdedicine services, please comment why?"
label variable Tode_L2b_Other "Other policy barriers."
label variable Tode_L2b0_Ca "Broadmand/telecommunication barriers"
label variable Tode_L2b0_Other "Other broadband/telecommunication barriers."
label variable Tode_L2b1_Ca "Lacked telemedicine because unfamiliar with telehealth services options"
label variable Tode_L2b1_Other "Other"
label variable Tode_L3_Ca "Number of assists provided during the past year"
label variable Tode_L2_Ca "Did your organization use telemedicine to provide remote services"

/*Recode Tode_L1a_Ca */
gen opioid_treat_physicians = Tode_L1a_Ca

/*Recode Tode_L1b_Ca*/
gen patient_opioid_meds = Tode_L1b_Ca

/*Recode Tode_L2a1_Ca*/
encode Tode_L2a1_Ca, gen(remote_telehealth_services)

/*Recode Tode_L2_Ca*/
gen telehealth_services_dummy = 1 if Tode_L2_Ca == "Yes"
replace telehealth_services_dummy = 0 if Tode_L2_Ca == "No"

/*Estimate number of centers using telehealth services*/
sort telehealth_services_dummy
by telehealth_services_dummy : tabulate state

/*Filter centers that don't access telemedicine*/
drop if telehealth_services_dummy == 1 
