library(grid)

here::i_am("R/render_pollslive_assets.R")

source_path <- here::here("pollslive", "source", "l06-palmer_penguins.csv")
output_dir <- here::here("pollslive", "assets")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

expected_hashes <- c(
  "pollslive/source/l06-palmer_penguins.csv" =
    "1b70d6eabdcefe166cc0357734fb7c1b1cc1cb9682c0dd16e97f2693bc849fdf",
  "pollslive/assets/l06-three-species-means.png" =
    "0c2cc9c10223440035d6311d54fefda1ab21465f3f04577d2087d9a457a8216a",
  "pollslive/assets/l06-f-distribution-showcase.png" =
    "0e62fda07472cddc04f38d28ea4b30c093d62fbd3c1326b6d9a6bfd3511c27f1"
)

for (relative_path in names(expected_hashes)) {
  absolute_path <- here::here(relative_path)
  stopifnot(
    file.exists(absolute_path),
    identical(
      digest::digest(file = absolute_path, algo = "sha256"),
      unname(expected_hashes[[relative_path]])
    )
  )
}

penguins <- readr::read_csv(source_path, show_col_types = FALSE) |>
  dplyr::mutate(
    druh = factor(druh, levels = c("Adelie", "Chinstrap", "Gentoo"))
  )

model_species <- stats::lm(hmotnost_tela_g ~ druh, data = penguins)
model_terms <- broom::tidy(model_species) |>
  dplyr::select(term, estimate)
estimates <- setNames(model_terms$estimate, model_terms$term)

stopifnot(
  identical(names(estimates), c("(Intercept)", "druhChinstrap", "druhGentoo")),
  isTRUE(all.equal(unname(estimates), unname(stats::coef(model_species)))),
  abs(estimates[["(Intercept)"]] - 3700.66225) < 0.01,
  abs(estimates[["druhGentoo"]] - 1375.35401) < 0.01
)

colours <- c(
  parchment = "#F4F1EC",
  white = "#FFFFFF",
  indigo = "#5D2890",
  graphite = "#2E2E2E",
  olive = "#8A8A8A",
  orange = "#F3A712",
  pale = "#E9DFEF"
)

number_cz <- function(value, digits = 0) {
  formatC(value, format = "f", digits = digits, decimal.mark = ",", big.mark = " ")
}

output_path <- here::here(output_dir, "l06-species-coefficients.png")
grDevices::png(
  filename = output_path,
  width = 1600,
  height = 700,
  res = 160,
  type = "cairo",
  bg = colours[["parchment"]]
)
grid.newpage()

grid.text(
  "Co říkají koeficienty o hmotnosti?",
  x = 0.06, y = 0.91, just = "left",
  gp = gpar(col = colours[["indigo"]], fontsize = 31, fontface = "bold")
)
grid.text(
  "Model: hmotnost těla podle druhu · reference: Adélie",
  x = 0.06, y = 0.80, just = "left",
  gp = gpar(col = colours[["graphite"]], fontsize = 19)
)

grid.roundrect(
  x = 0.19, y = 0.48, width = 0.27, height = 0.49,
  r = unit(0.025, "npc"),
  gp = gpar(fill = colours[["white"]], col = colours[["pale"]], lwd = 2)
)
grid.text(
  "Adélie · reference",
  x = 0.095, y = 0.63, just = "left",
  gp = gpar(col = colours[["graphite"]], fontsize = 21, fontface = "bold")
)
grid.text(
  paste0(number_cz(estimates[["(Intercept)"]]), " g"),
  x = 0.095, y = 0.49, just = "left",
  gp = gpar(col = colours[["indigo"]], fontsize = 34, fontface = "bold")
)
grid.text(
  "odhadnutý průměr",
  x = 0.095, y = 0.39, just = "left",
  gp = gpar(col = colours[["graphite"]], fontsize = 18)
)

grid.roundrect(
  x = 0.665, y = 0.48, width = 0.57, height = 0.49,
  r = unit(0.025, "npc"),
  gp = gpar(fill = colours[["white"]], col = colours[["pale"]], lwd = 2)
)
grid.text(
  "Koeficienty druhu (g)",
  x = 0.42, y = 0.66, just = "left",
  gp = gpar(col = colours[["graphite"]], fontsize = 21, fontface = "bold")
)

axis_start <- 0.58
axis_end <- 0.79
map_x <- function(value) axis_start + (axis_end - axis_start) * value / 1600
for (tick in c(0, 500, 1000, 1500)) {
  x <- map_x(tick)
  grid.lines(x = c(x, x), y = c(0.34, 0.58), gp = gpar(col = colours[["pale"]], lwd = 1.5))
  grid.text(number_cz(tick), x = x, y = 0.31, gp = gpar(col = colours[["olive"]], fontsize = 13))
}

species_rows <- data.frame(
  label = c("Chinstrap", "Gentoo"),
  term = c("druhChinstrap", "druhGentoo"),
  y = c(0.52, 0.41),
  colour = c(colours[["olive"]], colours[["indigo"]])
)
for (row in seq_len(nrow(species_rows))) {
  item <- species_rows[row, ]
  value <- estimates[[item$term]]
  grid.text(item$label, x = 0.42, y = item$y, just = "left",
            gp = gpar(col = colours[["graphite"]], fontsize = 18))
  grid.lines(x = c(axis_start, map_x(value)), y = rep(item$y, 2),
             gp = gpar(col = item$colour, lwd = 7, lend = "round"))
  grid.circle(x = map_x(value), y = item$y, r = unit(0.009, "npc"),
              gp = gpar(fill = item$colour, col = item$colour))
  grid.text(paste0("+", number_cz(value), " g"), x = 0.92, y = item$y,
            just = "right", gp = gpar(col = item$colour, fontsize = 19, fontface = "bold"))
}

grid.text(
  "Odhady z modelu použitého v L06.",
  x = 0.06, y = 0.14, just = "left",
  gp = gpar(col = colours[["graphite"]], fontsize = 17)
)
grDevices::dev.off()
