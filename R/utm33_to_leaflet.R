#' Convert map from UTM 33 projection to epsg:4326 projection
#'
#' @param map map to be converted
#'
#' @return Converted map
#'
#' @export
#'
utm33_to_leaflet <- function(map) {
  # utm33 is "epsg:32633"
  # leaflet is "epsg:4326"

  suppressWarnings(sp::proj4string(map) <- sp::CRS("+init=epsg:32633"))
  new <- sp::CRS("+init=epsg:4326") # WGS 84
  map_transformed <- sp::spTransform(map, new)
  return(map_transformed)
}
