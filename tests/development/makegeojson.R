convert_all_shp <- function(){

  name <- "barn"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID_4 <- NULL
  tmp$Shape_Area <- NULL
  tmp$Shape_Le_4 <- NULL
  tmp$bohf_str <- NULL
  tmp$bohf_num <- tmp$BoHF_ny2
  tmp$BoHF_ny2 <- NULL
  barn <- tmp
  usethis::use_data(barn, overwrite = TRUE)

  name <- "kols"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name), reduce_size = FALSE)
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID <- NULL
  tmp$Shape_Leng <- NULL
  tmp$Shape_Area <- NULL
  tmp$bohf_num <- as.integer(tmp$Opptaksomr)
  tmp$Opptaksomr <- NULL
  kols <- tmp
  usethis::use_data(kols, overwrite = TRUE)

  name <- "dagkir"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID <- NULL
  tmp$Shape_Leng <- NULL
  tmp$Shape_Area <- NULL
  tmp$bohf_str <- NULL
  tmp$BoHF <- NULL
  tmp$bohf_num <- tmp$BoHF_ny
  tmp$BoHF_ny <- NULL
  dagkir <- tmp
  usethis::use_data(dagkir, overwrite = TRUE)

  name <- "eldre"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name), reduce_size = FALSE)
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID <- NULL
  tmp$Shape_Leng <- NULL
  tmp$Shape_Area <- NULL
  tmp$bohf_str <- NULL
  tmp$bohf_num <- as.integer(tmp$BoHF)
  tmp$BoHF <- NULL
  eldre <- tmp
  usethis::use_data(eldre, overwrite = TRUE)

  name <- "nyfodt"
  # geojson
  kart::shp2geojson(shapefile = name,
                    folder = "shp",
                    geojson = paste0("geojson/", name),
                    reduce_size = TRUE,
                    amount = 0.5)
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID <- NULL
  tmp$Shape_Leng <- NULL
  tmp$Shape_Area <- NULL
  tmp$BoOmrNavn <- NULL
  tmp$bohf_num <- tmp$BoOmrID
  tmp$BoOmrID <- NULL
  nyfodt <- tmp
  usethis::use_data(nyfodt, overwrite = TRUE)

  name <- "dagkir2"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID <- NULL
  tmp$OBJECTID_1 <- NULL
  tmp$Shape_Leng <- NULL
  tmp$Shape_Le_1 <- NULL
  tmp$Shape_Area <- NULL
  tmp$bohf_num <- as.integer(tmp$BoHF_num)
  tmp$BoHF_num <- NULL
  dagkir2 <- tmp
  usethis::use_data(dagkir2, overwrite = TRUE)

  fodsel <- tmp
  usethis::use_data(fodsel, overwrite = TRUE)

  gyn <- tmp
  usethis::use_data(gyn, overwrite = TRUE)
}
