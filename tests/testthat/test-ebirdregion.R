context("ebirdregion")

test_that("ebirdregion works correctly", {
  skip_on_cran()
  
  out <- ebirdregion(loc = 'US', species = 'btbwar', max = 50)
  expect_is(out, "data.frame")
  expect_equal(ncol(out), 13)
  expect_is(out$comName, "character")
  expect_is(out$howMany, "integer")

  expect_equal(dim(ebirdregion('US-OH', max=10, provisional=TRUE, hotspot=TRUE)), c(10,13))
  
  res <- ebirdregion(loc = 'US-CA', max = 10)
  expect_equal(ncol(res), 13)
  
  expect_equal(ncol(ebirdregion(loc = 'US', species = 'coohaw')), 13)
  expect_gte(ncol(ebirdregion(loc = 'L109339', species = 'amecro', simple = FALSE)), 26)
})
