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
  "pollslive/assets/l06-posthoc-species-intervals.png" =
    "b2869410240f7c855a03cc089918d82747004db3a6fe03460e23ec303214036a"
)

# The L06 Tukey interval figure is copied byte for byte from the L06
#   repository when it is available next to this one.
path_l06_posthoc <-
  here::here(
    "..", "L06", "Presentation", "Materials", "posthoc_species_intervals.png"
  )

if (
  file.exists(path_l06_posthoc)
) {
  res_copy <-
    file.copy(
      from = path_l06_posthoc,
      to = here::here(output_dir, "l06-posthoc-species-intervals.png"),
      overwrite = TRUE
    )
}

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

# Question 1 shows the L06 model code and the coef() output it prints, so that
#   students see the coefficients as R reports them. Re-rendering can change
#   the bytes; R/verify_pollslive_assets.R pins the approved image.
code_lines <-
  c(
    "mod_tri <-",
    "  lm(",
    "    formula = hmotnost_tela_g ~ druh,",
    "    data = data_penguins",
    "  )",
    "coef(object = mod_tri)"
  )
output_lines <-
  utils::capture.output(
    print(stats::coef(model_species))
  )

output_path <- here::here(output_dir, "l06-species-coefficients.png")
grDevices::png(
  filename = output_path,
  width = 1300,
  height = 700,
  res = 160,
  type = "cairo",
  bg = colours[["parchment"]]
)
grid.newpage()

grid.text(
  "Model z minulé lekce · reference: Adélie",
  x = 0.05, y = 0.92, just = "left",
  gp = gpar(col = colours[["indigo"]], fontsize = 26, fontface = "bold")
)

line_step <- 0.076

# Code block
code_top <- 0.82
code_height <- line_step * length(code_lines) + 0.04
grid.rect(
  x = 0.05, y = code_top, width = 0.90, height = code_height,
  just = c("left", "top"),
  gp = gpar(fill = colours[["white"]], col = colours[["pale"]], lwd = 2)
)
grid.rect(
  x = 0.05, y = code_top, width = 0.008, height = code_height,
  just = c("left", "top"),
  gp = gpar(fill = colours[["indigo"]], col = NA)
)
for (i in seq_along(code_lines)) {
  grid.text(
    code_lines[[i]],
    x = 0.08, y = code_top - 0.02 - line_step * (i - 0.5), just = "left",
    gp = gpar(col = colours[["graphite"]], fontsize = 21, fontfamily = "Consolas")
  )
}

# Output block
output_top <- code_top - code_height - 0.04
output_height <- line_step * length(output_lines) + 0.04
grid.rect(
  x = 0.05, y = output_top, width = 0.90, height = output_height,
  just = c("left", "top"),
  gp = gpar(fill = colours[["pale"]], col = NA)
)
for (i in seq_along(output_lines)) {
  grid.text(
    output_lines[[i]],
    x = 0.08, y = output_top - 0.02 - line_step * (i - 0.5), just = "left",
    gp = gpar(col = colours[["graphite"]], fontsize = 21, fontfamily = "Consolas")
  )
}
grDevices::dev.off()
