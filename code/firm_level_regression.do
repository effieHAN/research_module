clear all
set more off
// cd "/Users/mengxi/Desktop/financial research"
cd "/Users/effie/Desktop/term3/research_module"


insheet using "/Users/effie/Desktop/term3/research_module/data/clean/frim_data1208.csv"
 

gen post_affected = year_post*bank_affected
* reg ln_no_emp post_affected year_post bank_affected ln_assets capital, cluster(firm_id)


encode bvdid_firm, gen(id)
xtset id year
// xtreg ln_empl post_affected i.year,fe cluster(bvdid_firm)

// * ssc install reghdfe 

// reghdfe ln_empl post_affected ln_toas capital,absorb(id year) vce(cluster small#year)

// // * ssc install outreg2,replace
// // outreg2 using huigui.doc,replace

// reghdfe ln_empl post_affected ,absorb (year sector) vce(robust)

// reghdfe ln_loan post_affected ,absorb (year sector) vce(robust)
// reghdfe cash post_affected ,absorb (year sector) vce(robust)
reghdfe ln_empl post_affected ln_toas capital,absorb(sector year) vce(robust)

reghdfe ln_empl post_affected ln_toas capital,absorb(bvdid_firm  year) vce(robust)
// outreg2 using huigui.doc,replace
