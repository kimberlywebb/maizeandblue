# Code for `maizeandblue` R package.
# Code is adopted from Cianna Bedford-Peterson's `inauguration` R package.
# Source code: https://github.com/ciannabp/inauguration
# Please find the copyright description from Cianna Bedford-Peterson's R package at the end of this file.


#' List of color palettes.
#'
#' Use \code{\link{render_umich_colors}} to construct palettes of desired length.
#'
#' @export
umich_palettes <- list(
  signature = c("#FFCb05", "#00274C", "#FFFFFF"),
  secondary = c("#9A3324", "#D86018", "#75988d", "#A5A508", "#00B2A9",
                "#2F65A7", "#702082", "#575294", "#CFC096", "#9B9A6D",
                "#989C97", "#655A52", "#131516"),
  bills_beer_garden = c("#416047", "#70B77E", "#E4DDAB",),
  frita_batidos = c("#63DAF6", "#A5A7A8", "#FFFFFF", "#FAEC21")
)

#' UMich colors palette rendering
#'
#' @param n Number of colors desired. Most palettes have 3-13 colors. Most color
#'   schemes are derived from \href{https://brand.umich.edu/design-resources/colors/}.
#'   If omitted, uses all colors.
#' @param name Name of color palette. Choices are:
#'   \code{signature}, \code{secondary}, \code{bills_beer_garden}.
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#' render_umich_colors("signature")
#' render_umich_colors("secondary", 5)
render_umich_colors <- function(name, n) {

  pal <- umich_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (n > length(pal)) {
    stop("Number of colors requested is larger than the chosen palette can provide.")
  }

  out <- pal[1:n]

  structure(out, class = "palette", name = name)
}


#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, col = "#32373D")
}


# MIT License

# Copyright (c) 2021 Cianna Bedford-Petersen

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
