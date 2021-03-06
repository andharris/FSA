context("fit and residual plots MESSAGES")
source("EXS_fitResidPlots.R")

test_that("fitPlot() errors and warnings",{
  ## Tried to fit a model with more than 1 response
  tmp <- lm(y1+y2~x1,data=df)
  #expect_error(fitPlot(tmp),"Multiple linear regression")
  # does not err yet
  ## Tried to fit an MLR
  expect_error(fitPlot(lm(y1~x1*x2,data=df)),"Multiple linear regression")
  expect_error(fitPlot(lm(y1~x1*x2*x3,data=df)),"Multiple linear regression")
  
  #### SLR
  ## bad intervals
  tmp <- lm(y1~x1,data=df)
  expect_error(fitPlot(tmp,interval="derek"),"should be one of")
  ## bad colors
  expect_warning(fitPlot(tmp,col.pt=c("red","blue")),"first color used for points")
  expect_warning(fitPlot(tmp,col.mdl=c("red","blue")),"first color used for the model")

  #### POLY, which uses SLR
  ## bad intervals
  tmp <- lm(y1~x1+I(x1^2),data=df)
  expect_error(fitPlot(tmp,interval="derek"),"should be one of")
  ## bad colors
  expect_warning(fitPlot(tmp,col.pt=c("red","blue")),"first color used for points")
  expect_warning(fitPlot(tmp,col.mdl=c("red","blue")),"first color used for the model")
  
  #### IVR
  ## Tried to fit a non-conforming IVR
  expect_error(fitPlot(lm(y1~x1*x2*z1*z2,data=df)),"covariate in an IVR")
  expect_error(fitPlot(lm(y1~x1*x2*x3*z1,data=df)),"covariate in an IVR")
  expect_error(fitPlot(lm(y1~x1*z1*z2*z3,data=df)),"factors in an IVR")
  expect_error(fitPlot(lm(y1~x1*x2*z1*z2*z3,data=df)),"covariate in an IVR")
  ## Bad colors, points, or line types for one-way IVR
  tmp <- lm(y1~x1*z1,data=df)
  expect_warning(fitPlot(tmp,col=c("orange","green")),"Fewer colors sent then levels")
  expect_warning(fitPlot(tmp,col="rich",pch=17:18),"Fewer pchs sent then levels")
  expect_warning(fitPlot(tmp,col="rich",lty=1:2),"Fewer ltys sent then levels")
  expect_warning(fitPlot(tmp,col="black",lty=1),"difficult to see groups")
  expect_warning(fitPlot(tmp,col="black",pch=1),"difficult to see groups")
  expect_warning(fitPlot(tmp,col="rich",pch=1,lty=1),"difficult to see groups")
  expect_warning(fitPlot(tmp,col="black",lty=1,pch=1),"difficult to see groups")
  expect_warning(fitPlot(tmp,lty=1),"difficult to see groups")
  expect_warning(fitPlot(tmp,pch=1),"difficult to see groups")
  ## Bad colors, points, or line types for two-way IVR
  tmp <- lm(y1~x1*z1*z3,data=df)
  expect_warning(fitPlot(tmp,col=c("orange","green")),"Fewer colors sent then levels")
  expect_warning(fitPlot(tmp,col="rich",pch=17:18),"Fewer pchs sent then levels")
  expect_warning(fitPlot(tmp,col="rich",lty=1:2),"Fewer ltys sent then levels")

  #### ONE-WAY ANOVA
  tmp <- lm(y1~z3,data=df)
  ## bad colors
  expect_warning(fitPlot(tmp,col=c("red","blue")),"Only first color used")
  expect_warning(fitPlot(tmp,col.ci=c("red","blue")),"Only first color used")
  expect_warning(fitPlot(tmp,col=c("blue","red"),col.ci=c("red","blue")),"Only first color used")
  
  #### TWO-WAY ANOVA
  tmp <- lm(y1~z3*z1,data=df)
  ## bad colors
  expect_warning(fitPlot(tmp,col=c("orange","green")),"Fewer colors sent then levels")
  expect_warning(fitPlot(tmp,col="rich",pch=17:18),"Fewer pchs sent then levels")
  expect_warning(fitPlot(tmp,col="rich",lty=1:2),"Fewer ltys sent then levels")
  
  #### Non-logistic regression GLM
  expect_error(fitPlot(glm(z1~x1,data=df,family=quasibinomial)),
               "only logistic regression GLM")
  expect_error(fitPlot(glm(x1~z1,data=df,family=gaussian)),
               "only logistic regression GLM")
  expect_error(fitPlot(glm(abs(x1)~z1,data=df,family=Gamma)),
               "only logistic regression GLM")
  expect_error(fitPlot(glm(round(10*abs(x1),0)~z1,data=df,family=poisson)),
               "only logistic regression GLM")  
})

test_that("residPlot() errors and warnings",{
  ## Tried to fit a non-conforming IVR
  expect_error(residPlot(lm(y1~x1*x2*z1*z2,data=df)),"covariate in an IVR")
  expect_error(residPlot(lm(y1~x1*x2*x3*z1,data=df)),"covariate in an IVR")
  expect_error(residPlot(lm(y1~x1*z1*z2*z3,data=df)),"factors in an IVR")
  expect_error(residPlot(lm(y1~x1*x2*z1*z2*z3,data=df)),"covariate in an IVR")
  ## Bad colors, points, or line types for one-way IVR
  tmp <- lm(y1~x1*z1,data=df)
  expect_warning(residPlot(tmp,col=c("orange","green")),"Fewer colors sent then levels")
  expect_warning(residPlot(tmp,col="rich",pch=17:18),"Fewer pchs sent then levels")
  ## Bad colors, points, or line types for two-way IVR
  tmp <- lm(y1~x1*z1*z3,data=df)
  expect_warning(residPlot(tmp,col=c("orange","green")),"Fewer colors sent then levels")
  expect_warning(residPlot(tmp,col="rich",pch=17:18),"Fewer pchs sent then levels")
  
  ## Wrong residual types for nls and nlme
  tmp <- nls(y1~a*exp(b*x2),data=df,start=c(a=1,b=1))
  expect_error(residPlot(tmp,resid.type="studentized"),"cannot be 'studentized'")
})
