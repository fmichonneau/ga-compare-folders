args <- commandArgs(trailingOnly = TRUE)

path_1 <- args[1]
path_2 <- args[2]
out    <- args[3]
addr   <- args[4]

str(args)
require(magrittr, quietly = TRUE)

ga_compare_folders <- function(path_1, path_2, out, add_roots = c("true", "false")) {

  add_roots <- match.arg(add_roots)
  add_roots <- as.logical(add_roots)

  stopifnot(rlang::is_scalar_character(path_1))
  stopifnot(rlang::is_scalar_character(path_2))
  stopifnot(rlang::is_scalar_character(out))
  stopifnot(rlang::is_scalar_logical(add_roots))

  res <- fiderent::compare_folders(path_1, path_2) %>%
    dplyr::filter(!identical) %>%
    dplyr::pull(files)

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

ga_compare_folders(path_1, path_2, out, addr)
