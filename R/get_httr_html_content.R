#' Internal convenience wrapper to get the inner HTML content given a
#' valid URL request.
#'
#' @param request A completed httr request.
#' @return The inner HTML content of the httr request.
#' @keywords internal
#' @importFrom magrittr %>% %<>%
#'

get_httr_html_content <- function(request, content_encoding = "ISO-8859-1") {
  request %>%
    httr::GET() %>%
    httr::content("text", encoding = content_encoding) %>%
    xml2::read_html()
}
