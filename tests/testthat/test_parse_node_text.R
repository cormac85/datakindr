context("Parsing HTTP Response: XML -> List")

test_that("xml doc object is parsed into list correctly.", {
  xml_doc <-
    readRDS("./mocked_data/httr_response_garda.rds") %>%
    httr::content("text") %>%
    xml2::read_html()

  expect_is(parse_node_text(xml_doc,".SearchHeadCell"), "list")
  expect_length(parse_node_text(xml_doc,".SearchHeadCell"), 1)
  expect_is(parse_node_text(xml_doc,".SearchHeadCell")[[1]], "character")
  expect_length(parse_node_text(xml_doc,".SearchHeadCell")[[1]], 15)
  expect_length(parse_node_text(xml_doc,".afdgdlj")[[1]], 0)
})
