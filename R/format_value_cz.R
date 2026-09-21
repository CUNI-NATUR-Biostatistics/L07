#----------------------------------------------------------#
#
#
#                         L07
#
#           Format computed values for Czech slides
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#' Format a computed value for Czech slide text or equations
#'
#' @param x Numeric vector to format.
#' @param digits Number of digits after the decimal mark.
#' @param signed Logical scalar. Show an explicit plus sign for positive values.
#' @param math Logical scalar. Use a LaTeX-safe decimal comma.
#'
#' @return A character vector containing consistently formatted values.
format_value_cz <- function(x, digits, signed = FALSE, math = FALSE) {
  vec_value <-
    formatC(
      x = x,
      format = "f",
      digits = digits,
      flag = if (signed) "+" else ""
    )

  if (math) {
    vec_value <-
      stringr::str_replace_all(
        string = vec_value,
        pattern = stringr::fixed("."),
        replacement = "{,}"
      )
  } else {
    vec_value <-
      vec_value |>
      stringr::str_replace_all(
        pattern = stringr::fixed("."),
        replacement = ","
      ) |>
      stringr::str_replace(
        pattern = "^-",
        replacement = "−"
      )
  }

  return(vec_value)
}
