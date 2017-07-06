context("Retrieving Statbank Dataset Names")

test_that("a single-word query term will return with correct format", {
  mockery::stub(search_statbank_datasets, # Where
                "get_num_search_results",  # What
                79) # How
  mockery::stub(search_statbank_datasets, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_garda.rds") %>%
                  httr::content("text") %>%
                  xml2::read_html()) # How

  invisible(capture.output(
    search_statbank_datasets("garda") %>% expect_is("data.frame")))
  invisible(capture.output(
    search_statbank_datasets("garda") %>% expect_length(2)))
  invisible(capture.output(
    search_statbank_datasets("garda")[[1]] %>% expect_length(90)))
})

test_that("a multiple-word query term will return with correct format", {
  mockery::stub(search_statbank_datasets, # Where
                "get_num_search_results",  # What
                8) # How
  mockery::stub(search_statbank_datasets, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_marriage_form.rds") %>%
                  httr::content("text") %>%
                  xml2::read_html()) # How

  invisible(capture.output(
    search_statbank_datasets("marriage form") %>% expect_is("data.frame")))
  invisible(capture.output(
    search_statbank_datasets("marriage form") %>% expect_length(2)))
  invisible(capture.output(
    search_statbank_datasets("marriage form")[[1]] %>% expect_length(8)))
})

test_that("a query with no results will fail gracefully", {
  mockery::stub(search_statbank_datasets, # Where
                "get_num_search_results",  # What
                0) # How
  mockery::stub(search_statbank_datasets, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_purple_astronaut.rds") %>%
                  httr::content("text") %>%
                  xml2::read_html()) # How

  invisible(capture.output(
    search_statbank_datasets("purple astronaut") %>% expect_is("data.frame")))
  invisible(capture.output(
    search_statbank_datasets("purple astronaut") %>% expect_length(2)))
  invisible(capture.output(
    search_statbank_datasets("purple astronaut")[[1]] %>% expect_length(0)))
})
