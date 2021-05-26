//**Pulse Data COVID-19 Behavior Analysis
//**Finn Dobkin
//**May 26, 2021

global control "import delimited "/Users/finndobkin/Desktop/pulse2021_puf_28.csv""
$control

rename scram record_identifier
rename week week_interivew
rename est_st state
rename est_msa msa
rename region region 
rename hweight hh_weight
rename pweight ind_weight
rename rrace race
rename egender gender
rename eeduc educ_attainmen
rename thhld_numper total_number_hh
rename thhld_numkid number_kids_hh
rename thhld_numadlt number_adults_hh
rename actvduty1 no_active
rename actvduty2 self_active
rename actvduty3 active_natguard
rename actvduty4 spouse_active
rename actvduty5 spouse_natguard
rename recvdvacc received_vaccine 
rename doses all_doses
rename getvacrv intention_vaccine
rename whynot1 side_effects
rename whynot2 efficacy
rename whynot3 dont_need
rename whynot4 dont_like
rename whynot5 no_recommendation
rename whynot6 get_later
rename whynot7 other_need 
rename whynot8 cost
rename whynot9 dont_trust_vaccine
rename whynot10 dont_trust_government
rename whynot11 other
rename whynotb1 already_covid
rename whynotb2 no_risk
rename whynotb3 use_mask
rename whynotb4 covid_serious
rename whynotb5 no_benefit
rename whynotb6 other
rename covprvnt covid_prevent
rename hadcovid covid_history
rename wrklossrv hh_job_loss
rename expctloss expect_job_loss
rename anywork employ_status
rename kindwork employ_sector
rename snap_yn snap_use
rename setting work_setting
rename evict chance_evict
rename forclose chance_foreclose
rename intrntrv4 broadband_available
rename income income
rename childfood child_nutrition
rename mortconf confidence_mortgage
rename mortcur caughtup_mortgage
rename rentcur caughtup_rent
rename livqtrrv housing_situation
rename tenure housing_tenure
rename mobility mobility_limitations

label variable record_identifier "Record Identifier"
label variable week "Week of interview"
label variable "State of residence--see data dictionary for values"
label variable msa "Metropolitan Statistical Area of residence--see data dictionary for values"
label variable region "1 -- Northeast, 2 -- South, 3 -- Midwest, 4 -- West"
label variable hh_weight "Household survey weight"
label variable ind_weight "Individual survey weight"
label variable race "1 -- White Alone, 2 -- Black Alone, 3 -- Asian Alone, 4 -- Any Other"
label variable gender -- "1 -- Male, 2 -- Female"
label variable educ_attainmen -- "1 -- Less than High School, 2 -- Some High School, 3 -- High School/GED, 4 -- Some college, 5 -- Associates, 6 -- Bachelors, 7 -- Graduate degree"
label variable total_number_hh "Total individuals in household"
label variable number_kids_hh "Total number of kids in household"
label variable number_adults_hh "Total number of adults in household"
label variable no_active "Spouse or them not serving in US Armed Forces"
label variable self_active "They serving on active duty"
label variable active_natguard "They serving in Reserve or National Guard"
label variable spouse_active "Spouse serving in active duty"
label variable received_vaccine "1 -- Yes, 2 -- No, -99 -- Question seen but category not selected, -88 missing/did not report"
label variable all_doses "1 -- Yes, 2 -- No, Question seen but category not selected, -88 missing/did not report"
label variable intention_vaccine "1 -- Definetly get vaccine, 2 -- Probably get vaccine, 3 -- Unsure about getting vaccine, 4 -- Probably not getting vaccine, 5 -- Definetly not getting vaccine, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable side_effects "1 -- I am concerned about the side effect, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable efficacy "1 -- I don't know if the vaccine will work, -99 Question seen but category not selected, -88 Missing/Did not report'"
label variable dont_need "1 -- I don't believe the vaccine will work, -99 Question seen but category not selected, -88 Missing/Did not report'"
label variable dont_like "1 -- I don't like vaccines, -99 Question seen but category not selected, -88 Missing/Did not report'"
label variable no_recommendation "1 -- My doctor has not recommended that I get a vaccine, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable get_later "1 -- I plan to wait and see if it is save and may get it later, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable other_need "1 -- Other people need it more than me, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable cost "1 -- I am concerned about the cost, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable dont_trust_government "1 -- I don't trust the government, -99 Question seen but category not selected, -88 Missing/Did not report'"
label variable already_covid "1 -- I already had covid, , -99 Question seen but category not selected, -88 Missing/Did not report"
label variable no_risk "1 -- I am not high risk, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable use_mask "1 -- I plan to use masks and other precautions instead, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable covid_serious "I don't believe that COVID is serious, -99 Question seen but category not selected, -88 Missing/Did not report'"
label variable no_benefit "I don't think vaccines are beneficials, -99 Question seen but category not selected, -88 Missing/Did not report'"
label variable other "1 -- Other, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable covid_prevent "Since getting a COVID vaccine, 1 -- I have decrease prevention behaviors, 2 -- I have not changed my behavior, 3 -- I have increase prevention behaviors, -99 Question seen but category not selected, -88 Missing/Did not report"
label variable covid_history "Doctor or provider told you that you have COVID, 1 -- Yes, 2 -- No, 3 -- Not Sure, -99 Question seen but not selected, -88 -- Missing/Did not report"
label variable hh_job_loss "Over the past 4 weeks, has anyone in your household experienced loss of income 1 -- Yes, 2 -- No, -99 Question seen but category not selected, -88 -- Missing/Did not report"
label variable expect_job_loss "In the next four weeks, do you expect anyone in your household to experience loss of employment due to COVID? 1 -- Yes, 2 -- No, -99 Question seen but category not selected, -88 -- Missing/Did not Report"
label variable employ_status "Over the past 7 days, did you do any work for pay or profit? 1 -- Yes, 2 -- No, -99 Question seen but category not selected, -88 -- Missing/Did not Report"
label variable employ_sector "1 -- Government, 2 -- Private Company, 3 -- Nonprofit, 4 -- Self-employed, 5 -- Family Business, -99 Question seen but category not selected, -88 -- Missing/Did not Report"
label variable snap_use "During the past 7 days, has anyone in your househoold received benefits from SNAP, 1 -- Yes, 2 -- No, -99 Question seen but category not selected, -88 -- Missing/Did not Report"
label variable work_setting "1 -- Healthcare, 2 -- Social Service, 3 -- Preschool, 4-- K-12, 5 -- Other schools, 6 -- First response, 7 -- Death care, 8 -- Correctional facility, 9 -- Food and beverage store, 10 -- Agriculture, forestry, hunting, or fishing, 11 -- Food manufacturing, 12 -- Non-food manufacturing, 13 -- Public transit, 14 -- Postal Service, 15 -- Other job deemed essential during pandemic, 16 -- None of the above, -99 -- Question seen but category not selected, -88 Missing/Did not report"
label variable chance_evict "In the next two months, will you have to leave your apartment because of eviction. 1 -- Very likely, 2 -- Somewhat likely, 3 -- Not very likely, 4 -- Not likely at all, -99 Question seen but category not selected, -88 -- Missing/Did not Report"
label variable chance_foreclose "In the next two months, will you likely have to leave your household because of foreclosure?  1 -- Very likely, 2 -- Somewhat likely, 3 -- Not very likely, 4 -- Not likely at all, -99 Question seen but category not selected, -88 -- Missing/Did not Report"
label variable income "Total household income 1 -- less than $25000, 2 -- $25000--$34999, 3 -- $35000--$49999, 4 -- $50000--$74999, 5 -- $75000--$99999, 6 -- $100000--$149999, 7 -- $150000--$199999, 8 -- $200000 and above, -99 -- Question seen but category not selected, -88 -- Missing/Did not report"
label variable child_nutrition "Can household afford food for children? 1 -- Often true, 2 -- Sometimes true, 3 -- Never true, -99 -- Question seen but category not selected, -88 Missing/Did not report"
label variable confidence_mortgage "Confidence in ability to pay next rent or mortgage on time?  1 -- Not at all confident, 2 -- Slightly confident, 3 -- Moderately confident, 4 -- Highly confident, 5 -- Payment is/will be deferred, -99 -- Question seen but category not selected, -88 -- Missing/Did not report"
label variable caughtup_mortgage "Is the household caught up on mortgage payments?  1 -- Yes, 2 -- No, -99 -- Question seen but category not selected, -88 Missing/Did not report"
label variable caughtup_rent "Is the household caught up on rent? 1 -- Yes, 2 -- No, -99 -- Question seen but category not selected, -88 Missing/Did not report"
label variable housing_situation "Which best describes your home? 1 -- Mobile home, 2 -- A one family house detached from any other house, 3 -- A one family house attached to one or more houses, 4 -- A building with 2 apartments, 5 -- A building with 3 or 4 apartments, 6 -- A building with 5 or more apartments, 7 -- Boat, RV, van, etc., -99 -- Question seen but category not selected, -88 -- Missing/Did not report"
label variable housing_tenure "Is your household or apartment..? 1 -- Owned by you or someone in this household free and clear, 2 -- Owned by your or someone in this household with a mortgage or loan, 3 -- Rented, 4 -- Occupied without payment of rent, -99 -- Question seen but category not selected, -88 Missing/Did not report"
label variable mobility_limitations "Do you have difficult walking or climing stairs? 1 -- No difficulty, 2 -- some difficulty, 3 -- a lot of difficulty, 4 -- cannot do at all, -99 -- Question seen but category not selected, -88 Missing/Did not report"

drop if no_active != 1 

sort income 
by income : tabulate received_vaccine

sort income
by income:  tabulate all_doses

sort income
by income : tabulate side_effects

sort income
by income : tabulate efficacy

sort income
by income : tabulate dont_need

sort income 
by income : tabulate dont_like

sort income
by income : tabulate no_recommendation

sort income
by income : tabulate get_later 

sort income
by income: tabulate other_need

sort income
by income : tabulate cost

sort income
by income: tabulate dont_trust_vaccine

sort income
by income : tabulate dont_trust_government

sort income
by income: tabulate other

sort income 
by income : tabulate already_covid
