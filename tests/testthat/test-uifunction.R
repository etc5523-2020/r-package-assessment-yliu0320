test_that("check the date range", {
  expect_error(dateselection(starttime>endtime))
  
})
