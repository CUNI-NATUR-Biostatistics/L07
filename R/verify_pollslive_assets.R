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
      "9a1a646b366ab56f60e71914321306b272491bec759e1a3635fe461c3dff2b4c",
    # Byte-identical copy of L06 Presentation/Materials/
    #   posthoc_species_intervals.png
    "l06-posthoc-species-intervals.png" =
      "efd1659c9c4e29e8b9c45dd9a27326a0451fb3048c0131307913a90a6f2d0896"
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
