#' @title Example 7.7 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-235)
#' @name   Exam7.7
#' @docType data
#' @keywords datasets
#' @description Exam7.7 is an explaination of segmented regression
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
#'    \code{\link{DataSet7.7}}
#' @import  splines ggplot2 
#' @examples
library(splines)
library(ggplot2)
DataSet7.7$a  <- factor( x =DataSet7.7$ a)

knots <- c(0,0,0,0,10,10,20,30,40,40,40,45,45,45,50,50,50)

bx  <-
 splineDesign(knots    = knots
            , x        = DataSet7.7$x
          # , ord      = 4
          # , derivs   = 0L
            , outer.ok = T
          # , sparse = FALSE
          )
         
Exam7.7fm <- 
     lm(
        formula     = y ~ a*bx
      , data        = DataSet7.7
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
         )
anova(Exam7.7fm)
Data  <-
         data.frame(a=DataSet7.7$ a,x=DataSet7.7$x,y=DataSet7.7$y,fit=Exam7.7fm$fit)
##---Estimated response surface by using segmented regression
Plot <-
     ggplot(data=Data , mapping = aes(x = x,y = y))+
     geom_point(mapping = aes(x = x,y = y,colour = a),data = Data)+
     geom_line( mapping = aes(x = x,y = fit,colour = a),size = 1,data = Data)+
     ggtitle("Response surface by using segmented regression")
            
print(Plot) 
NULL           
           