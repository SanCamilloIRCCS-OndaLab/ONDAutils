test_that("cn returns the column names as a one-column matrix", {
  dat <- data.frame(a = 1:2, b = 3:4, c = 5:6)
  res <- cn(dat)
  expect_true(is.matrix(res))
  expect_equal(dim(res), c(3L, 1L))
  expect_equal(res[, 1], c("a", "b", "c"))
})
