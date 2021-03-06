context("addZeroCatch() OUTPUT")
test_that("addZeroCatch() test output types",{
  source("EXS_addZeroCatch.R")
  df1mod <- addZeroCatch(df1,eventvar="net",specvar="species",zerovar="catch")
  expect_is(df1mod,"data.frame")
  expect_equal(names(df1mod),names(df1mod))
  expect_true(nrow(df1mod)>nrow(df1))
  df2mod <- addZeroCatch(df2,eventvar="net",specvar="species",zerovar="catch")
  expect_is(df2mod,"data.frame")
  expect_equal(names(df2mod),names(df2mod))
  expect_true(nrow(df2mod)>nrow(df2))
  df3mod <- suppressWarnings(addZeroCatch(df3,eventvar="net",specvar="species",zerovar="catch"))
  expect_is(df3mod,"data.frame")
  expect_equal(names(df3mod),names(df3mod))
  expect_true(nrow(df3mod)==nrow(df3))
  df4mod <- addZeroCatch(df4,eventvar="net",specvar="species",zerovar=c("catch","recaps"))
  expect_is(df4mod,"data.frame")
  expect_equal(names(df4mod),names(df4mod))
  expect_true(nrow(df4mod)>nrow(df4))
  df5mod <- addZeroCatch(df5,eventvar="net",specvar=c("species","sex"),zerovar="catch")
  expect_is(df5mod,"data.frame")
  expect_equal(names(df5mod),names(df5mod))
  expect_true(nrow(df5mod)>nrow(df5))
})