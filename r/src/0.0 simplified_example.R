library(magrittr)

claims <- list('raw' = c(
  rep(x = 0, times = 92) #92% chance no event
  , 10000 # suspension part breaks during boarding, one passenger is jostled with minor injuries
  , 100e3 # plane skids off runway, several passengers injured
  , 1e6 # fire aboard plane, toxic fumes sickens most passengers
  , 10e6 # crash, most passengers survive
  , 100e6 # crash, most passengers do not survive
  , 300e6 # crash, no passengers survive
  , 500e6 # crash, minor ground impact
  , 1e9)) # crash, major ground impact

n_pass <- 300

risk_fare <- 10

claims$capital_impact_0 <- -claims$raw + n_pass * risk_fare

insured_claim <- function(x, ap, layer_width){
  pmax(pmin(x, ap + layer_width) - ap, 0)
}

claims$insurance <- insured_claim(x = claims$raw, ap = 250e6, layer_width = 500e6)
premium <- 10e6

claims$capital_impact_1 <- -claims$raw + claims$insurance - premium + n_pass * risk_fare



scales::comma(claims$raw)[85:100]
scales::comma(claims$insurance)[85:100]
scales::comma(claims$capital_impact_0)[85:100]
scales::comma(claims$capital_impact_1)[85:100]





