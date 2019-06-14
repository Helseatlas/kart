convert_all_shp <- function(){

  name <- "barn"
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  tmp <- geojsonio::geojson_read(paste0("geojson/", name, ".geojson"), what = "sp")
  barn <- shinymap::utm33_to_leaflet(map = tmp)
  usethis::use_data(barn, overwrite = TRUE)

  name <- "kols"
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name), reduce_size = FALSE)
  tmp <- geojsonio::geojson_read(paste0("geojson/", name, ".geojson"), what = "sp")
  kols <- shinymap::utm33_to_leaflet(map = tmp)
  usethis::use_data(kols, overwrite = TRUE)

  name <- "dagkir"
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  tmp <- geojsonio::geojson_read(paste0("geojson/", name, ".geojson"), what = "sp")
  dagkir <- shinymap::utm33_to_leaflet(map = tmp)
  usethis::use_data(dagkir, overwrite = TRUE)

  name <- "eldre"
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name), reduce_size = FALSE)
  tmp <- geojsonio::geojson_read(paste0("geojson/", name, ".geojson"), what = "sp")
  eldre <- shinymap::utm33_to_leaflet(map = tmp)
  usethis::use_data(eldre, overwrite = TRUE)

  name <- "nyfodt"
  kart::shp2geojson(shapefile = name,
                    folder = "shp",
                    geojson = paste0("geojson/", name),
                    reduce_size = TRUE,
                    amount = 0.5)
  tmp <- geojsonio::geojson_read(paste0("geojson/", name, ".geojson"), what = "sp")
  nyfodt <- shinymap::utm33_to_leaflet(map = tmp)
  usethis::use_data(nyfodt, overwrite = TRUE)

  name <- "dagkir2"
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  tmp <- geojsonio::geojson_read(paste0("geojson/", name, ".geojson"), what = "sp")
  dagkir2 <- shinymap::utm33_to_leaflet(map = tmp)
  usethis::use_data(dagkir2, overwrite = TRUE)

  fodsel <- shinymap::utm33_to_leaflet(map = tmp)
  usethis::use_data(fodsel, overwrite = TRUE)

  gyn <- shinymap::utm33_to_leaflet(map = tmp)
  usethis::use_data(gyn, overwrite = TRUE)
}
