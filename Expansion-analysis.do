//**Generate variable and t-test
//**June 2, 2021
//**Finn Dobkin

global control "import delimited "/Users/finndobkin/Desktop/weeklycovid.csv", clear "

//**Code Expansion and test cap**//
gen expansion = 1 if state_full == "California" | state_full == "Arizona" | state_full == "Arkansas" | state_full == "Colorado" | state_full == "Connecticut" | state_full == "Delaware" | state_full == "District of Columbia" | state_full == "Hawaii" | state_full == "Idaho" | state_full == "Illinois" | state_full == "Indiana" | state_full == "Iowa" | state_full == "Kentucky" | state_full == "Louisiana" | state_full == "Maine" | state_full == "Maryland" | state_full == "Massachusetts" | state_full == "Michigan" | state_full == "Minnesota" | state_full == "Montana" | state_full == "Nebraska" | state_full == "Nevada" | state_full == "New Hampshire" | state_full == "New Jersey" | state_full == "New Mexico" | state_full == "New York" | state_full == "North Dakota" | state_full == "New York" | state_full == "North Dakota" | state_full == "Ohio" | state_full == "Oklahoma" | state_full == "Oregon" | state_full == "Pennsylvania" | state_full == "Rhode Island" | state_full == "Utah" | state_full == "Vermont" | state_full == "Virginia" | state_full == "Washington" | state_full == "West Virginia"
replace expansion = 0 if state_full == "Alabama" | state_full == "Florida" | state_full == "Georgia" | state_full == "Kansas" | state_full == "Mississippi" | state_full == "North Carolina" | state_full == "South Carolina" | state_full == "South Dakota" | state_full == "Tennessee" | state_full == "Texas" | state_full == "Wisconsin" | state_full == "Wyoming" | state_full == "Missouri" | state_full == "Oklahoma"
drop if expansion == .

//**Generate complete survey date positive test rates**//
/*American Indian*/
gen amin_test_number = v30 + v32
gen amin_positive_number = v31 + v33
egen amin_total = rowtotal(amin_test_number numberofpatientstestedamericanin)
egen amin_positive = rowtotal(amin_positive_number numberofpatientstestedpositiveam)
gen ratio_amin = amin_positive / amin_total
ttest ratio_amin, by(expansion)
sort surveydate expansion
collapse (mean) ratio_amin, by (expansion surveydate)

/*Native Hawaiian*/
$control
gen hawaii_test_number = v36 + v38
gen hawaii_positive_number = v37 + v39
egen hawaii_total = rowtotal(hawaii_test_number numberofpatientstestednativehawa)
egen hawaii_positive = rowtotal(hawaii_positive_number numberofpatientstestedpositivena)
gen ratio_haw = hawaii_positive / hawaii_total
ttest ratio_amin, by(expansion)
sort surveydate expansion
collapse (mean) ratio_haw, by (expansion surveydate)

/*Other Pacific Islander*/
$control
gen pacisl_test_number = v42 + v44
gen pacisl_positive_number = v43 + v45
egen pacisl_total = rowtotal(pacisl_test_number numberofpatientstestedotherpacif)
egen pacisl_positive = rowtotal(pacisl_positive_number numberofpatientstestedpositiveot)
gen pacisl_ratio = pacisl_positive / pacisl_total
ttest pacisl_ratio, by(expansion)
sort surveydate expansion
collapse (mean) pacisl_ratio, by (expansion surveydate)

/*Multiple Race*/
$control
gen multi_test_number = v54 + v56
gen multi_positive_number = v49 + v51
egen multi_total = rowtotal(multi_test_number numberofpatientstestedmorethanon)
egen multi_positive = rowtotal(numberofpatientstestedpositivemo multi_positive_number)
gen multi_ratio = multi_positive / multi_total
ttest multi_ratio, by(expansion)
sort surveydate expansion
collapse (mean) multi_ratio, by (expansion surveydate)

/*White*/
gen white_test_number = v54 + v56
gen white_positive_number = v55 + v57
egen white_total = rowtotal(white_test_number numberofpatientstestedwhitecalc)
egen white_positive = rowtotal(numberofpatientstestedpositivewh white_positive_number)
gen white_ratio = white_positive / white_total
ttest white_ratio, by(expansion)
sort surveydate expansion
collapse (mean) white_ratio, by (expansion surveydate)

/*African American*/
gen afam_test_number = v60 + v62
gen afam_positive_number = v61 + v63
egen afam_total = rowtotal(afam_test_number numberofpatientstestedafricaname)
egen afam_positive = rowtotal(afam_positive_number numberofpatientstestedpositiveaf)
gen afam_ratio = afam_positive / afam_total
ttest afam_ratio, by(expansion)
sort surveydate expansion
collapse (mean) afam_ratio, by (expansion surveydate)

/*Hispanic*/
gen hispanic_test_number = v78 + v80
gen hispanic_positive_number = v79 + v81
egen hispanic_total = rowtotal(hispanic_test_number numberofpatientstestedhispanicca)
egen hispanic_positive = rowtotal(hispanic_positive_number numberofpatientstestedpositivehi )
gen hispanic_ratio = hispanic_positive / hispanic_total
ttest hispanic_ratio, by(expansion)
sort surveydate expansion
collapse (mean) hispanic_ratio, by (expansion surveydate)
