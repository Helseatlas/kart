context("utm33_to_leaflet")

test_that("utm33_to_leaflet is OK", {
  # Unit test that map can be converted from utm33 to leaflet projection
  map <- geojsonio::geojson_read("data/test.geojson", what = "sp")
  expect_equal_to_reference(utm33_to_leaflet(map), "data/utm33_to_leaflet.rds", tolerance = 1e-4)
})
