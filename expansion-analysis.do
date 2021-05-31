//**Positive Rates by Race
//**Finn Dobkin
//**May 28, 2021


//**Positive Tests by Race**//
//**Import data**/
global control "import delimited "/Users/finndobkin/Desktop/covidsurveyresponse.csv", encoding(UTF-8) clear" 

/*Asian ratio*/
gen ratio_asians = numberofpatientstestedpositiveas / numberofpatientstestedasiancalc
sort surveydate
collapse (mean) ratio_asians, by (surveydate)

/*Native Hawaiian*/
$control
gen ratio_hawaii = numberofpatientstestedpositivena / numberofpatientstestednativehawa
sort surveydate
collapse (mean) ratio_hawaii, by (surveydate)

/*American Indian/Alaska Native*/
$control
gen ratio_aian = numberofpatientstestedpositiveam / numberofpatientstestedamericanin
sort surveydate
collapse (mean) ratio_aian, by (surveydate)

/*Other Pacific Islander*/
$control
gen ratio_opi = numberofpatientstestedpositiveot / numberofpatientstestedotherpacif
sort surveydate
collapse (mean) ratio_opi, by (surveydate)

/*More than one race*/
$control
gen ratio_multi_race = numberofpatientstestedpositivemo / numberofpatientstestedmorethanon
sort surveydate
collapse (mean) ratio_multi_race, by (surveydate)

/*White*/
$control
gen ratio_white = numberofpatientstestedpositivewh / numberofpatientstestedwhitecalc
sort surveydate
collapse (mean) ratio_white, by (surveydate)

/*African American*/
$control
gen ratio_af_am = numberofpatientstestedpositiveaf / numberofpatientstestedafricaname
sort surveydate
collapse (mean) ratio_af_am, by (surveydate)

/*Hispanic*/
$control
gen ratio_hispanic = numberofpatientstestedpositivehi / numberofpatientstestedhispanicca
sort surveydate
collapse (mean) ratio_hispanic, by (surveydate)

/*All patients*/
gen ratio_total = alltestsnumberofpatientstestedpo / numberofpatientstested

//**Code Medicaid expansion**//
/*Import and import macro*/
global control "import delimited "/Users/finndobkin/Desktop/HC COVID Survey Response Data_04-10-2020 to 04-30-21 (3).csv", encoding(UTF-8) clear"
$control

/*Dummy Variable*/

/*Challenges administering vaccine*/
1 -- Vaccine Supply
2 -- Vaccine Storage
3 -- Staffing
4 -- Financial Reimbursement
5 -- Vaccine Confidence
6 -- Other
7 -- None

gen expansion = 1 if state_full == "California" | state_full == "Arizona" | state_full == "Arkansas" | state_full == "Colorado" | state_full == "Connecticut" | state_full == "Delaware" | state_full == "District of Columbia" | state_full == "Hawaii" | state_full == "Idaho" | state_full == "Illinois" | state_full == "Indiana" | state_full == "Iowa" | state_full == "Kentucky" | state_full == "Louisiana" | state_full == "Maine" | state_full == "Maryland" | state_full == "Massachusetts" | state_full == "Michigan" | state_full == "Minnesota" | state_full == "Montana" | state_full == "Nebraska" | state_full == "Nevada" | state_full == "New Hampshire" | state_full == "New Jersey" | state_full == "New Mexico" | state_full == "New York" | state_full == "North Dakota" | state_full == "New York" | state_full == "North Dakota" | state_full == "Ohio" | state_full == "Oklahoma" | state_full == "Oregon" | state_full == "Pennsylvania" | state_full == "Rhode Island" | state_full == "Utah" | state_full == "Vermont" | state_full == "Virginia" | state_full == "Washington" | state_full == "West Virginia"
replace expansion = 0 if state_full == "Alabama" | state_full == "Florida" | state_full == "Georgia" | state_full == "Kansas" | state_full == "Mississippi" | state_full == "North Carolina" | state_full == "South Carolina" | state_full == "South Dakota" | state_full == "Tennessee" | state_full == "Texas" | state_full == "Wisconsin" | state_full == "Wyoming" | state_full == "Missouri" | state_full == "Oklahoma"
drop if expansion == .

gen covidtestcap = 1 if covid19testingcapacity == "Yes"
replace covidtestcap = 0 if covid19testingcapacity == "No"

gen vaccinechallenge = 1 if challengesdeployingcovidvaccinev == "Yes" 
replace vaccinechallenge = 2 if v323 == "Yes" 
replace vaccinechallenge = 3 if challengesdeployingcovidvaccines == "Yes" 
replace vaccinechallenge = 4 if challengesdeployingcovidvaccinef == "Yes"
replace vaccinechallenge = 5 if v326 == "Yes" 
replace vaccinechallenge = 6 if challengesdeployingcovidvaccineo == "Yes" 
replace vaccinechallenge = 7 if challengesdeployingcovidvaccinen == "Yes" 

/*COVID Testing capacity*/
sort expansion 
collapse (mean) covidtestcap, by (expansion surveydate)
 
/*Percent Weekly Visits compared*/
sort expansion
collapse (mean) percentaverageweeklyvisitscompar, by (expansion surveydate)
$control

/*Percent positive by expansion and date*/
gen percent_positive = numberofpatientstestedpositive / numberofpatientstested
sort expansion
collapse (mean) percent_positive, by(expansion)
