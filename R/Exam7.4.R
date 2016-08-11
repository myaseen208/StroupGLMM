#' @title Example 7.4 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-226)
#' @name   Exam7.4
#' @docType data
#' @keywords datasets
#' @description Exam7.4 is factorial treatment desgin
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
#'    \code{\link{DataSet7.4}}
#' @import  car lsmeans
#' @examples
library(car)
library(lsmeans)
data(DataSet7.4)
DataSet7.4$X <- DataSet7.4$B
DataSet7.4$B <-  factor(x = DataSet7.4$B )
(Exam7.4fm1 <-                   
    summary(
      aov(
          formula = y~A + X + A*X + I(X^2) + I(X^2)*A + B + A*B
        , data    = DataSet7.4
        )
        ) )
##---Interaction plot
Exam7.4lm <-                   
     lm(
        formula = y~ A*B
      , data    = DataSet7.4
        ) 
Lsm7.4    <-
     lsmeans::lsmeans(
         object  = Exam7.4lm1
       , specs   = ~A|B
              )
            
(Plot <- 
    lsmip( 
       object  = Lsm7.4
     , formula = A~B
     , ylab    = "y Lsmeans"
     , main    = "Lsmeans for A*B"
      )
      )         
##-- Model given on page228
Exam7.4fm2<-
     lm(
        formula     = y ~ 0 + A + X%in%A + I(X^2)%in%A
      , data        = DataSet7.4
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
           
(quade1Vse2 <-          
    linearHypothesis( model             = Exam7.4fm2
                   ,  hypothesis.matrix = c("Ae1:I(X^2)-Ae2:I(X^2)=0" )
                   )
                   )
(quadcVSe1e2 <-
    linearHypothesis( model             = Exam7.4fm2
                    , hypothesis.matrix = c("2Ac:I(X^2)-Ae1:I(X^2)-Ae2:I(X^2)=0" )
                    )
                    ) 
NULL                    