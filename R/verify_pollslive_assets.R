#----------------------------------------------------------#
# Verify approved local evidence for the L07 retrieval quiz
#----------------------------------------------------------#

library(here)

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering them can change their
# bytes across R sessions and therefore makes immutable synchronization
# unreliable. R/render_pollslive_assets.R stays as their reproducible source;
# local PollsLive preparation verifies the approved bytes instead.
approved_assets <-
  c(
    "l06-three-species-means.png" =
      "0c2cc9c10223440035d6311d54fefda1ab21465f3f04577d2087d9a457a8216a",
    "l06-species-coefficients.png" =
      "21b0a1f5a3d690e32bcdb8ee624f51b784ef5e28edc450f76f34cceb05b1b2e2",
    # Byte-identical copy of L06 Presentation/Materials/
    #   posthoc_species_intervals.png
    "l06-posthoc-species-intervals.png" =
      "b2869410240f7c855a03cc089918d82747004db3a6fe03460e23ec303214036a"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (length(missing_assets) > 0L) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    paste(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  unname(
    vapply(
      asset_paths,
      digest::digest,
      character(1),
      algo = "sha256",
      file = TRUE
    )
  )

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (length(changed_assets) > 0L) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    paste(changed_assets, collapse = ", ")
  )
}
