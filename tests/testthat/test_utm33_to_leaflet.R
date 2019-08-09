context("utm33_to_leaflet")

test_that("utm33_to_leaflet with sp", {
  # Unit test that map can be converted from utm33 to leaflet projection
  map <- geojsonio::geojson_read("data/test.geojson", what = "sp")
  expect_equal_to_reference(utm33_to_leaflet(map, sf = FALSE), "data/utm33_to_leaflet.rds", tolerance = 1e-4)
  expect_error(utm33_to_leaflet(map))
})

test_that("utm33_to_leaflet with sf", {
  # Unit test that map can be converted from utm33 to leaflet projection
  map <- fodsel
  map$area_name <- NULL
  expect_equal_to_reference(utm33_to_leaflet(map), "data/utm33_to_leaflet2.rds", tolerance = 1e-4)
  expect_error(utm33_to_leaflet(map, sf = FALSE))
})
