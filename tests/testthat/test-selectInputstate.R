test_that("select states", {
  
  expect_error(selectInputstate(id=NULL))
  expect_error(selectInputstate(id=""))
  
  id <- c("state","STATE","State")
  expect_equal(
    "Australian Capital Territory",
    "New South Wales", 
    "Northern Territory",
    "Queensland", 
    "South Australia", 
    "Tasmania",
    "Victoria", 
    "Western Australia"
  )
 
})
