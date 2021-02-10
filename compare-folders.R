args <- commandArgs(trailingOnly = TRUE)

path_1 <- args[1]
path_2 <- args[2]
out    <- args[3]
addr   <- as.logical(args[4])

require(magrittr, quietly = TRUE)

ga_compare_folders <- function(path_1, path_2, out, add_roots = addr) {

  stopifnot(rlang::is_scalar_character(path_1))
  stopifnot(rlang::is_scalar_character(path_2))
  stopifnot(rlang::is_scalar_character(out))
  stopifnot(rlang::is_scalar_logical(add_roots))

  res <- fiderent::compare_folders(path_1, path_2) %>%
    dplyr::filter(!identical) %>%
    dplyr::pull(files)

  message("add roots is:", str(add_roots))
  if (add_roots) {
    to_add <- vapply(
      res[grepl("/index.html$", res, ignore.case = TRUE)],
      function(x) {
        gsub("/index.html$", "/", x, ignore.case = TRUE)
      },
      character(1),
      USE.NAMES = FALSE
    )
    res <- unname(c(res, to_add))
  }

  if (length(res) > 0) {
    cat(res, sep = " ", file = out)
  }

  res

}

ga_compare_folders(path_1, path_2, out)
