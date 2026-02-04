# Load rmarkdown
library(rmarkdown)

# Set base directory
base_dir <- "*MyWork"  # <- adjust this if the folder is named differently

# Find all Rmd files recursively in subdirectories
rmd_files <- list.files(
  path = base_dir,
  pattern = "\\.Rmd$",
  recursive = TRUE,
  full.names = TRUE
)

# Render each Rmd file to HTML
for (file in rmd_files) {
  tryCatch({
    render(input = file, output_format = "html_document")
    message("✅ Rendered: ", file)
  }, error = function(e) {
    message("❌ Error in: ", file, "\n", e)
  })
}