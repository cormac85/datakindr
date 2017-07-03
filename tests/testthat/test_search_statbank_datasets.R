context("Retrieving Statbank Dataset Names")

test_that("A single-word query term will return with correct format", {
  mockery::stub(search_statbank_datasets, # Where
                "get_num_search_results",  # What
                79) # How
  mockery::stub(search_statbank_datasets, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_garda.rds") %>%
                  httr::content("text") %>%
                  xml2::read_html()) # How

  invisible(capture.output(expect_is(search_statbank_datasets("garda"),
                                     "data.frame")))
  invisible(capture.output(expect_length(search_statbank_datasets("garda"),
                                         2)))
  invisible(capture.output(expect_length(search_statbank_datasets("garda")[[1]],
                                         90)))
})

# test_that("A multiple word query term will return with correct format", {
#   mockery::stub(search_statbank_datasets, # Where
#                 "get_num_search_results",  # What
#                 8) # How
#   mockery::stub(search_statbank_datasets, # Where
#                 "get_httr_html_content",  # What
#                 readRDS("./mocked_data/httr_content_marriage_form.rds")) # How
#
#   invisible(capture.output(expect_is(search_statbank_datasets("marriage form"),
#                                      "data.frame")))
#   invisible(capture.output(expect_length(search_statbank_datasets("garda"),
#                                          2)))
#   invisible(capture.output(expect_length(search_statbank_datasets("garda")[[1]],
#                                          8)))
# })
