#' @title Example 7.6.2.1 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-231)
#' @name   Exam7.6.2.1
#' @docType data
#' @keywords datasets
#' @description Exam7.6.2.1 Nonlinear Mean Models ( Quantitative by quantitative models)
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
#'    \code{\link{DataSet7.6}}
#' @import  scatterplot3d plot3D
#' @examples
library(scatterplot3d)
library(plot3D)
data(DataSet7.6)
attach(DataSet7.6)
logx1<- NULL
for(i in 1:length(x1))
{
if(x1[i]==0)
(logx1[i]<-(log(x1[i]+0.1)))
 else
(logx1[i]<-(log(x1[i])))
}
logx2<- NULL
for(i in 1:length(x2))
{
if(x2[i]==0)
(logx2[i]<-(log(x2[i]+0.1)))
 else
(logx2[i]<-(log(x2[i])))
}
 DataSet7.6$logx1 <- logx1 
 DataSet7.6$logx2 <- logx2 
Exam7.6.2.1.lm <-
     lm(
        formula     = response ~ x1*x2 + logx1*logx2 
      , data        = DataSet7.6
   #  , subset
   #  , weights
   #  , na.action
      , method      = "qr"
      , model       = TRUE
   #  , x           = FALSE
   #  , y           = FALSE
      , qr          = TRUE
      , singular.ok = TRUE
      , contrasts   = NULL
   #  , offset
   #  , ...
       )
 summary( Exam7.6.2.1.lm )
##---3D Scatter plot ( page#232) 
(ScatterPlot1 <-
   scatter3D(
             x           = x1
           , y           = x2
           , z           = response
           , colvar      = response
           , phi         = 0
           , theta       = 25
           , ticktype   = "detailed"
           , type        = "h"
           , col         = NULL
           , bty         = "b2"
           , add         = FALSE
           , plot        = TRUE
           , main        = " 3D Scatter plot of response"))
##--- scatter plot with regression plane by using Hoerl function ( page#233) 
grid.lines <-  5
x1.pred <- seq(min(x1), max(x1), length.out = grid.lines)
x2.pred <- seq(min(x2), max(x2), length.out = grid.lines)
x1x2    <- expand.grid( x = x1.pred, y = x2.pred)

z.pred  <- matrix(data = predict(Exam7.6.2.1.lm, newdata = x1x2), 
                  nrow = grid.lines
                , ncol = grid.lines)
(ScatterPlot2 <-
   scatter3D(
             x           = x1
           , y           = x2
           , z           = response
           , pch         = 20
           , phi         = 25
           , theta       = 30
           , ticktype   = "detailed"
           , xlab       =  "x1"
           , ylab       =  "x2"
           , zlab       = "response"
           , bty         = "b2"
           , add         = FALSE
           , surf        = list(x      = x1.pred ,
                                y      = x2.pred ,
                                z      = z.pred  ,
                                facets = NA 
                                )
           , plot        = TRUE
           , main        = "Fitted Response Surface by Hoerl Function"
           )
           )
NULL           
    
          
