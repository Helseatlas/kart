#' Convert map from UTM 33 projection to epsg:4326 projection
#'
#' @param map Map to be converted
#' @param sf If true: the map is of format sf. If false: the map is of format sp
#'
#' @return Converted map
#'
#' @export
#'
utm33_to_leaflet <- function(map, sf = TRUE) {
  # utm33 is "epsg:32633"
  # leaflet is "epsg:4326"

  if (sf) {
    map_transformed <- sf::st_transform(map, 4326)
  } else {
    suppressWarnings(sp::proj4string(map) <- sp::CRS("+init=epsg:32633"))
    new <- sp::CRS("+init=epsg:4326") # WGS 84
    map_transformed <- sp::spTransform(map, new)
  }

  return(map_transformed)
}
