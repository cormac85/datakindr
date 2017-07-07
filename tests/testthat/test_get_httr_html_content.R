context("Getting HTTP Response")

test_that("httr request is successfully parsed into xml document.", {
  mockery::stub(get_httr_html_content, # Where
                "httr::GET",  # What
                readRDS("./mocked_data/httr_response_garda.rds")) # How
  expect_is(get_httr_html_content(create_cso_search_url("garda", 0)),
            "xml_document")
})
