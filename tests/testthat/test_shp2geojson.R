context("shp2geojson")

test_that("shp2geojson with default", {
  expect_equal_to_reference(
    suppressWarnings(shp2geojson(
      folder = "data",
      shapefile = "shapefile1",
      geojson = NULL
    )),
    "data/shp2geojson1.geojson"
  )
})

test_that("shp2geojson with reduce_size = FALSE", {
  expect_equal_to_reference(
    shp2geojson(
      folder = "data",
      shapefile = "shapefile1",
      geojson = NULL,
      reduce_size = FALSE
    ),
    "data/shp2geojson2.geojson"
  )
})

test_that("shp2geojson with geojson != NULL", {
  suppressWarnings(shp2geojson(
      folder = "data",
      shapefile = "shapefile1",
      geojson = "tmp"))

  expect_equal_to_reference("tmp.geojson", "data/shp2geojson.geojson")
  file.remove("tmp.geojson")
})
