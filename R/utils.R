add_trailing_slash <- function(string) {

  if (tail(strsplit(string, "")[[1]], 1) != "/") {
    paste0(string, "/")
  } else {
    string
  }

}
