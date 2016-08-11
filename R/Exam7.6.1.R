#' @title Example 7.6.1 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-229)
#' @name   Exam7.6.1
#' @docType data
#' @keywords datasets
#' @description Exam7.4 explains Multifactor:All factors quantitative model
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
#'    \code{\link{DataSet7.4rsm}}
#' @import  
#' @examples
data(DataSet7.4rsm)
DataSet7.4rsm$xa <- 10*( DataSet7.4rsm$a )
DataSet7.4rsm$xb <- 10*( DataSet7.4rsm$b )
DataSet7.4rsm$a  <-  factor(x = DataSet7.4rsm$a )
DataSet7.4rsm$b  <-  factor(x = DataSet7.4rsm$b )

(Exam7.6fm1 <-
    aov(
        formula = response~xa*xb+I(xa^2)+I(xb^2)+b:a
      , data    = DataSet7.4rsm
       ) 
       )
NULL       
       

