context("Summmarize() MESSAGES")
source("EXS_Summarize.R")

test_that("Summarize(), formula method messages",{
  expect_error(Summarize(~f1,data=d1),"only works with a numeric variable")
  expect_error(Summarize(~c1,data=d1),"only works with a numeric variable")
  expect_error(Summarize(f1~1,data=d1),"only works with a numeric variable")
  expect_error(Summarize(c1~1,data=d1),"only works with a numeric variable")
  expect_error(Summarize(q1+q2~f1+f2,data=d1),"more than one variable on the LHS")
  expect_error(Summarize(q1~f1+f2+c1,data=d1),"may contain only one or two factors")
  expect_error(Summarize(q1~f1+f2+c1,data=d1),"may contain only one or two factors")
  expect_error(Summarize(~f1+f2,data=d1),"Must have one variable on LHS of formula")
  expect_error(Summarize(~q1+q2,data=d1),"Must have one variable on LHS of formula")
  expect_error(Summarize(f1~f2,data=d1),"numeric variable on LHS")
  expect_error(Summarize(c1~f2,data=d1),"numeric variable on LHS")
  expect_error(Summarize(~q1,data=d1,nvalid="derek"),"should be one of")
  expect_error(Summarize(~q1,data=d1,percZero="derek"),"should be one of")
})

test_that("Summarize(), default method, messages",{
  expect_error(Summarize(d1),"does not work with a data.frame")
  expect_error(Summarize(as.matrix(d1[,c("q1","q2")])),"does not work with matrices")
  expect_error(Summarize(as.matrix(d1[,c("f1","f2","c1")])),"does not work with matrices")
  expect_error(Summarize(d1$q1,nvalid="derek"),"should be one of")
  expect_error(Summarize(d1$q1,percZero="derek"),"should be one of")
})
