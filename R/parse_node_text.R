#' Parse HTML Node Text
#'
#' Uses rvest to extract the text from a node into a list.
#' @param xml_doc xmldocument object for which you want a node parsed and
#'     returned as text.
#' @param node_name Name of the node from which you wish to extract text.
#'
#' @return A list with each line of text that rvest parses
#' @keywords internal
#'

parse_node_text <- function(xml_doc, node_name){
  list(xml_doc %>%
         rvest::html_nodes(node_name) %>%
         rvest::html_text())
}
