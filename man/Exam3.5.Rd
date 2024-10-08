% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Exam3.5.R
\name{Exam3.5}
\alias{Exam3.5}
\title{Example 3.5 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup(p-85)}
\description{
Exam3.5 fixed location, factorial treatment structure, Gaussian response
}
\examples{
data(DataSet3.2)
DataSet3.2$A <- factor(x = DataSet3.2$A)
DataSet3.2$B <- factor(x = DataSet3.2$B)
DataSet3.2$loc <- factor(x = DataSet3.2$loc, level = c(8, 1, 2, 3, 4, 5, 6, 7))

Exam3.5.lm <- lm(formula =  Y~ A + B +loc, data =  DataSet3.2)
Exam3.5.lm

##---a0 marginal mean
library(emmeans)
contrast(
       object = emmeans(object  = Exam3.5.lm, specs   = ~ B)
     , list(trt = c(1, 0))
     )
library(phia)
testFactors(model = Exam3.5.lm, levels =  list(B = c("0" = 1,"1" = 0) ))

##---b0 marginal mean
testFactors(model = Exam3.5.lm, levels=list(B = c("0" = 1, "1" = 0)))

##---Simple effect of A on B0
testInteractions(model  =  Exam3.5.lm, custom =  list(B = c("0" = 1,"1" = 0)), across =  "B")

##---Simple effect of B on A0
testInteractions(model = Exam3.5.lm, custom =  list(A = c("0" = 1, "1" = 0)), across =  "A")

##---Simple Effect of A over B
testInteractions(model = Exam3.5.lm, fixed = "A", across = "B")

##---Simple Effect of B over A
testInteractions(model = Exam3.5.lm, fixed = "B", across = "A")

#-------------------------------------------------------------
## Individula least squares treatment means
#-------------------------------------------------------------
emmeans(object = Exam3.5.lm, specs = ~A*B)
}
\references{
\enumerate{
\item Stroup, W. W. (2012).
     \emph{Generalized Linear Mixed Models: Modern Concepts, Methods and Applications}.
       CRC Press.
 }
}
\seealso{
\code{\link{DataSet3.2}}
}
\author{
\enumerate{
         \item  Muhammad Yaseen (\email{myaseen208@gmail.com})
         \item Adeela Munawar (\email{adeela.uaf@gmail.com})
         }
}
