convert_all_shp <- function(){

  name <- "barn"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID_4 <- NULL
  tmp$Shape_Area <- NULL
  tmp$Shape_Le_4 <- NULL
  tmp$area_name <- tmp$bohf_str
  tmp$bohf_str <- NULL
  tmp$area_num <- tmp$BoHF_ny2
  tmp$BoHF_ny2 <- NULL
  barn <- sf::st_simplify(tmp, preserveTopology = TRUE, dTolerance = 1000)
  barn <- sf::st_transform(barn, 32633)
  usethis::use_data(barn, overwrite = TRUE)

  name <- "kols"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name), reduce_size = FALSE)
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID <- NULL
  tmp$Shape_Leng <- NULL
  tmp$Shape_Area <- NULL
  tmp$area_num <- as.integer(tmp$Opptaksomr)
  tmp$Opptaksomr <- NULL
  sf::st_crs(tmp) <- 32633
  kols <- tmp
  kols <- sf::st_transform(kols, 32633)
  usethis::use_data(kols, overwrite = TRUE)

  name <- "dagkir"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID <- NULL
  tmp$Shape_Leng <- NULL
  tmp$Shape_Area <- NULL
  tmp$area_name <- tmp$bohf_str
  tmp$bohf_str <- NULL
  tmp$BoHF <- NULL
  tmp$area_num <- tmp$BoHF_ny
  tmp$BoHF_ny <- NULL
  dagkir <- sf::st_simplify(tmp, preserveTopology = TRUE, dTolerance = 1000)
  dagkir <- sf::st_transform(dagkir, 32633)
  usethis::use_data(dagkir, overwrite = TRUE)

  name <- "eldre"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name), reduce_size = FALSE)
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$Shape_Leng <- NULL
  tmp$Shape_Area <- NULL
  tmp$area_name <- tmp$bohf_str
  tmp$bohf_str <- NULL
  tmp$area_num <- as.integer(tmp$OBJECTID)
  tmp$OBJECTID <- NULL
  tmp$BoHF <- NULL
  sf::st_crs(tmp) <- 32633
  eldre <- tmp
  eldre <- sf::st_transform(eldre, 32633)
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
  tmp$area_name <- tmp$BoOmrNavn
  tmp$BoOmrNavn <- NULL
  tmp$area_num <- tmp$BoOmrID
  tmp$BoOmrID <- NULL
  nyfodt <- tmp
  nyfodt <- sf::st_transform(nyfodt, 32633)
  usethis::use_data(nyfodt, overwrite = TRUE)

  name <- "dagkir2"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$OBJECTID <- NULL
  tmp$Shape_Leng <- NULL
  tmp$Shape_Le_1 <- NULL
  tmp$Shape_Area <- NULL
  tmp$area_num <- as.integer(tmp$OBJECTID_1)
  tmp$OBJECTID_1 <- NULL
  tmp$BoHF_num <- NULL
  dagkir2 <- sf::st_simplify(tmp, preserveTopology = TRUE, dTolerance = 1000)
  dagkir2 <- sf::st_transform(dagkir2, 32633)
  usethis::use_data(dagkir2, overwrite = TRUE)

  fodsel <- sf::st_simplify(tmp, preserveTopology = TRUE, dTolerance = 1000)
  fodsel <- sf::st_transform(fodsel, 32633)
  usethis::use_data(fodsel, overwrite = TRUE)

  gyn <- sf::st_simplify(tmp, preserveTopology = TRUE, dTolerance = 1000)
  gyn <- sf::st_transform(gyn, 32633)
  usethis::use_data(gyn, overwrite = TRUE)

  
  name <- "ortopedi"
  # geojson
  kart::shp2geojson(shapefile = name, folder = "shp", geojson = paste0("geojson/", name))
  # sf object
  tmp <- sf::st_read(dsn = paste0("shp/", name, ".shp"))
  tmp$area_num <- as.integer(tmp$boomr_O1al)
  tmp$boomr_O1al <- NULL
  tmp$area_name <- tmp$BoområdeK
  tmp$BoområdeK <- NULL
  tmp$BoområdeN <- NULL
  ortopedi <- sf::st_simplify(tmp, preserveTopology = TRUE, dTolerance = 1000)
  ortopedi <- sf::st_transform(ortopedi, 32633)
  ortopedi$area_num <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
  usethis::use_data(ortopedi, overwrite = TRUE)
}
