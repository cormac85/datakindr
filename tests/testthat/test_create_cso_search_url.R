context("Creating search URL")

test_that("search URL is correctly created with 1 valid string argument", {
  expect_identical(create_cso_search_url("garda", 0),
                   "http://www.cso.ie/px/pxeirestat/statire/search2003/searchresult.asp?place=statbank&Planguage=0&searchin=1&searchtext=garda&forward=true&offset=0&showand=true")
  expect_identical(create_cso_search_url("garda 2012", 0),
                   "http://www.cso.ie/px/pxeirestat/statire/search2003/searchresult.asp?place=statbank&Planguage=0&searchin=1&searchtext=garda%202012&forward=true&offset=0&showand=true")
  expect_error(create_cso_search_url("", 0), "No search term supplied.")
  expect_error(create_cso_search_url("garda", -15), "Can't have a negative offset.")
  expect_equal(create_cso_search_url("garda age removal pants big small dog fluff abcdefghijklmnopqrstuvwxyz", 0),
                                     "http://www.cso.ie/px/pxeirestat/statire/search2003/searchresult.asp?place=statbank&Planguage=0&searchin=1&searchtext=garda%20age%20removal%20pants%20big%20small%20dog%20fluff%20abcdefghijklmnopqrstuvwxyz&forward=true&offset=0&showand=true")

})
