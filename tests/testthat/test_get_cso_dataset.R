context("Getting CSO Dataset")

test_that("dataframe is correctly returned from Statbank", {
  mockery::stub(get_cso_dataset, # Where
                "rjstat::fromJSONstat",  # What
                readRDS("./mocked_data/sample_statbank_dataset.rds")) # How
  expect_is(get_cso_dataset("ASR11"), "data.frame")
  expect_is(get_cso_dataset("ASR11")$sex, "character")

  blah <- rjstat::fromJSONstat(readLines(paste0(cso_base_url, cso_dataset_code)))
})
