#' Retrieves a list of CSO Statbank dataset descriptions and dataset codes.
#' These codes can be used with get_cso_dataset in this package.
#'
#' @param search_term A search term used to get CSO datasets.
#' @param max_num_results The maximum number of results to return.
#' @return A data frame with two columns, \code{dataset_code} &
#' \code{dataset_desc}. Codes can be used to retrieve Statbank datasets.
#' @examples
#' \dontrun{search_statbank_datasets("employment 2002")}
#' \dontrun{search_statbank_datasets("age", 1001)}
#' @export
#' @importFrom magrittr %>% %<>%
#'

search_statbank_datasets <- function(search_term, max_num_results = 500){
  offset <- 0
  results_per_page <- 15
  node_name <- ""
  num_results <- get_num_search_results(search_term)
  validate_search_term(search_term, num_results, max_num_results)
  search_offsets <- seq(0, num_results, results_per_page)
  combined_dataset_names <- vector("list", length(search_offsets) + 1)

  # Store all the results from search term
  for (offset in search_offsets) {

    current_index <- (offset / results_per_page + 1)
    print(paste("Requesting", current_index, "out of", length(search_offsets)))
    req <- create_cso_search_url(search_term, offset)
    res <- get_httr_html_content(req)

    is_mainref_class_present <-
      (res %>% parse_node_text(".mainref"))[[1]] %>% length()

    if(is_mainref_class_present == 0) {
      node_name <- ".SearchHeadCell"
      combined_dataset_names[current_index] <-
        parse_node_text(res, node_name)
    } else {
      node_name <- ".mainref"
      combined_dataset_names[current_index] <-
        (parse_node_text(res, node_name)[[1]] %>%
        stringi::stri_trim_both())[1]
    }

  }
  search_results_to_dataframe(combined_dataset_names)
}
