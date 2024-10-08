#' @title Example 2.B.3 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup(p-55)
#' @name   Exam2.B.3
#' @description Exam2.B.3 is used to illustrate one way treatment design with Gaussian observations.
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
#'    \code{\link{DataExam2.B.3}}
#'
#' @import parameters
#' @importFrom stats lm summary.lm
#'
#' @examples
#' #-----------------------------------------------------------------------------------
#' ## Means Model  discussed in Example 2.B.3 using DataExam2.B.3
#' #-----------------------------------------------------------------------------------
#' Exam2.B.3.lm1 <- lm(formula = y ~ trt, data = DataExam2.B.3)
#' summary(Exam2.B.3.lm1)
#'
#' #-----------------------------------------------------------------------------------
#' ## Effectss Model  discussed in Example 2.B.3 using DataExam2.B.3
#' #-----------------------------------------------------------------------------------
#' Exam2.B.3.lm2 <- lm(formula = y ~ 0 + trt, data = DataExam2.B.3)
#' summary(Exam2.B.3.lm2)
#' library(parameters)
#' model_parameters(Exam2.B.3.lm2)
NULL
