#' @title Example 7.3 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-223)
#' @name   Exam7.3
#' @docType data
#' @keywords datasets
#' @description Exam7.3 explains multifactor models with some factors qualitative and some quantitative(Unequal slopes ANCOVA)
#' @author \enumerate{
#'          \item  Muhammad Yaseen (\email{myaseen208@@gmail.com})
#'          \item Adeela Munawar (\email{adeela.uaf@@gmail.com})
#'          }
#' @references \enumerate{
#' \item Stroup, W. W. (2012).
#'      \emph{Generalized Linear Mixed Models: Modern Concepts, Methods and Applications}.
#'        CRC Press.
#'  }
#' @seealso
#'    \code{\link{DataSet7.3}}
#' @import lsmeans car ggplot2
#' @examples
library(lsmeans)
library(car)
library(ggplot2)
data(DataSet7.3)
DataSet7.3$trt <- factor(x = DataSet7.3$trt )
##----ANCOVA(Unequal slope Model)
Exam7.3fm1 <-
    aov(
        formula = y ~ trt*x
      , data    = DataSet7.3
      )
car::Anova( mod = Exam7.3fm1 , type="III")
Plot <-
   ggplot( 
          data    = DataSet7.3
        , mapping = aes(x= factor(trt), y=x)
         )                 +
   geom_boxplot(width=0.5) +
   coord_flip()            +
   geom_point()            +
   stat_summary(
         fun.y    = "mean"
       , geom     = "point"
       , shape    =  23
       , size     =  2
       , fill     = "red"
       )                   + 
   theme_bw()              +
   ggtitle("Covariate by treatment Box Plot") +
   xlab("Treatment")
print(Plot) 
##----ANCOVA(Unequal slope Model without intercept at page 224)
(Exam7.3fm2 <-
     lm(
        formula     = y ~ 0 + trt/x
      , data        = DataSet7.3
    # , subset
    # , weights
    # , na.action
      , method      = "qr"
      , model       = TRUE
    # , x           = FALSE
    # , y           = FALSE
      , qr          = TRUE
      , singular.ok = TRUE
      , contrasts   = NULL
    # , offset
    # , ...
         )  )
summary(Exam7.3fm2)
##--Lsmeans treatment at x=7 & 12 at page 225 
( Lsm7.3    <-
     lsmeans::lsmeans(
         object  = Exam7.3fm2
       , specs   = ~trt|x
       , at      = list(x=c(7,12))
     )
   ) 
NULL
