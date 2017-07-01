context("Creating searc URL")

test_that("URL is correctly created with 1 valid string argument", {
  search_url <- create_cso_search_url("garda",0)
  expect_identical(search_url, "http://www.cso.ie/px/pxeirestat/statire/search2003/searchresult.asp?place=statbank&Planguage=0&searchin=1&searchtext=garda&forward=true&offset=0&showand=true")
})
