// describe data and its type
describe 
bysort bedrooms: sum price
// summary statistics on all variables
eststo clear
estpost summarize airconditioning area basement bathrooms bedrooms furnishingstatus guestroom hotwaterheating mainroad parking prefarea price stories
esttab using "output/summary.rtf", cells("count mean sd min max") noobs label replace title("Descriptive statistics")
// summary statistics on house prices by number of bedrooms
eststo clear
bysort bedrooms: eststo: estpost summarize price 
esttab  using "output/summary.rtf", cells("mean sd") label nodepvar append title("Price by number of bedrooms")