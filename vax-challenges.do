//**Challenges by state
//**Finn Dobkin
//**June 5, 2021
/*Import macro*/
global control "import delimited "/Users/finndobkin/Desktop/covidresponse.csv", encoding(UTF-8)"
$control

/*Dummy variable for expansion*/
gen expansion = 1 if state_full == "California" | state_full == "Arizona" | state_full == "Arkansas" | state_full == "Colorado" | state_full == "Connecticut" | state_full == "Delaware" | state_full == "District of Columbia" | state_full == "Hawaii" | state_full == "Idaho" | state_full == "Illinois" | state_full == "Indiana" | state_full == "Iowa" | state_full == "Kentucky" | state_full == "Louisiana" | state_full == "Maine" | state_full == "Maryland" | state_full == "Massachusetts" | state_full == "Michigan" | state_full == "Minnesota" | state_full == "Montana" | state_full == "Nebraska" | state_full == "Nevada" | state_full == "New Hampshire" | state_full == "New Jersey" | state_full == "New Mexico" | state_full == "New York" | state_full == "North Dakota" | state_full == "New York" | state_full == "North Dakota" | state_full == "Ohio" | state_full == "Oklahoma" | state_full == "Oregon" | state_full == "Pennsylvania" | state_full == "Rhode Island" | state_full == "Utah" | state_full == "Vermont" | state_full == "Virginia" | state_full == "Washington" | state_full == "West Virginia"
replace expansion = 0 if state_full == "Alabama" | state_full == "Florida" | state_full == "Georgia" | state_full == "Kansas" | state_full == "Mississippi" | state_full == "North Carolina" | state_full == "South Carolina" | state_full == "South Dakota" | state_full == "Tennessee" | state_full == "Texas" | state_full == "Wisconsin" | state_full == "Wyoming" | state_full == "Missouri" | state_full == "Oklahoma"
drop if expansion == .

/*Dummy variables for challenges*/
gen vax_supply = 1 if challengesdeployingcovidvaccinev == "Yes"
replace vax_supply = 0 if challengesdeployingcovidvaccinev == "No"

gen vax_storage = 1 if v10 == "Yes"
replace vax_storage = 0 if v10 == "No"

gen vax_staffing = 1 if challengesdeployingcovidvaccines == "Yes"
replace vax_staffing = 0 if challengesdeployingcovidvaccines == "No" 

gen vax_reimbusement = 1 if challengesdeployingcovidvaccinef == "Yes"
replace vax_reimbusement = 0 if challengesdeployingcovidvaccinef == "No"

gen vax_confidence = 1 if v13 == "Yes"
replace vax_confidence = 0 if v13 == "No"

gen vax_other = 1 if challengesdeployingcovidvaccineo == "Yes"
replace vax_other = 0 if challengesdeployingcovidvaccineo == "No"

gen vax_no = 1 if challengesdeployingcovidvaccinen == "Yes"
replace vax_no = 0 if challengesdeployingcovidvaccinen == "No"

/*Total vaccine challenges*/
tabulate vax_no expansion, chi2
tabulate vax_staffing expansion, chi2
tabulate vax_supply expansion, chi2
tabulate vax_reimbursement expansion, chi2

#Test Results Turnaround time
gen testtime = 1 if testresultsturnaroundtime == "<1 hour"
replace testtime = 2 if testresultsturnaroundtime == "12 hours or less"
replace testtime = 3 if testresultsturnaroundtime == "1-24 hours"
replace testtime = 4 if testresultsturnaroundtime == "24 hrs"
replace testtime = 5 if testresultsturnaroundtime == ">24 hrs"
replace testtime = 6 if testresultsturnaroundtime == "2-3 days"
replace testtime = 7 if testresultsturnaroundtime == "4-5 days"
replace testtime = 8 if testresultsturnaroundtime == "More than 5 days"

median testtime, by(expansion) medianties(below)

/*Testing Capacity*/
$control
gen test_cap = 1 if covid19testingcapacity == "Yes"
replace test_cap = 0 if covid19testingcapacity == "No"

ttest test_cap, by(expansion)
