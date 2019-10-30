#' Function to convert a shapefile to geojson
#'
#' @param shapefile The basename of shapefile to be converted to geojson
#' @param folder The folder where the shapefile is
#' @param geojson The name of the geojson file to be created
#' @param reduce_size Should the file size be reduced?
#'
#' @export
#'
shp2geojson <- function(shapefile = "eldre",
                        folder = ".",
                        geojson = NULL,
                        reduce_size = TRUE) {


  # Read shapefile
  original_map <- sf::st_read(dsn = paste0(folder, "/", shapefile, ".shp"))

  # Reduce file size
  if (reduce_size) {
    original_map <- sf::st_simplify(original_map, preserveTopology = TRUE, dTolerance = 1000)
  }

  # Convert to geojson
  geojson_map <- geojsonsf::sf_geojson(sf = original_map)

  # Save geojson file to disk
  if (is.null(geojson)) {
    return(geojson_map)
  } else {
    geojsonio::geojson_write(geojson_map, file = paste0(geojson, ".geojson"))
  }

}
