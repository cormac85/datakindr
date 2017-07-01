context("Number of Results")

test_that("typical search returns a single number", {
  mockery::stub(get_num_search_results, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_garda.rds") %>%
                  httr::content("text") %>% xml2::read_html()) # How

  expect_is(get_num_search_results("garda"),"numeric")
  expect_length(get_num_search_results("garda"),1)
})

# test_that("no response fails gracefully.", {
#   mockery::stub(get_num_search_results, # Where
#                 "get_httr_html_content",  # What
#                 readRDS("./mocked_data/httr_html_junk_query.rds")) # How
#
#   expect_is(get_num_search_results("a;lsdfj;dajsf"),"numeric")
# })

#
# req <- create_cso_search_url("a;lsdfj;dajsf", 0)
# res <- get_httr_html_content(req)
#
# saveRDS(res, "./tests/testthat/mocked_data/httr_html_junk_query.rds")

