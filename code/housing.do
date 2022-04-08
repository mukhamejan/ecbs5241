clear
import delimited "/Users/mukhamejan/Desktop/ecbs5241/Housing.csv", encoding(ISO-8859-1)

foreach var of varlist mainroad guestroom basement hotwaterheating airconditioning prefarea {
    replace `var' = strtrim(strproper(`var'))
    replace `var' = ".m" if !inlist(`var', "No", "Yes") // or: assert inlist(`var', "No", "Yes")
    replace `var' = "0" if `var' == "No"
    replace `var' = "1" if `var' == "Yes"
}
destring mainroad guestroom basement hotwaterheating airconditioning prefarea, replace
