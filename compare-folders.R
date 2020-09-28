args <- commandArgs(trailingOnly = TRUE)

path_1 <- args[1]
path_2 <- args[2]
out    <- args[3]

require(magrittr, quietly = TRUE)

ga_compare_folders <- function(path_1, path_2, out) {

  stopifnot(rlang::is_scalar_character(path_1))
  stopifnot(rlang::is_scalar_character(path_2))
  stopifnot(rlang::is_scalar_character(out))

  comparer::compare_folders(path_1, path_2) %>%
    dplyr::filter(!identical) %>%
    dplyr::pull(files) %>%
    cat(sep = "\n", file = out)

}

ga_compare_folders(path_1, path_2, out)
