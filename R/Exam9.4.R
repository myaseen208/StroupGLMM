#' @title Example 9.4 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-288)
#' @name   Exam9.4
#' @description Exam9.4 Relationship between BLUP and Fixed Effect Estimators
#' @author \enumerate{
#'          \item  Muhammad Yaseen (\email{myaseen208@@gmail.com})
#'          \item Adeela Munawar (\email{adeela.uaf@@gmail.com})
#'          }
#' @references \enumerate{
#' \item Stroup, W. W. (2012).
#'      \emph{Generalized Linear Mixed Models: Modern Concepts, Methods and Applications}.
#'        CRC Press.
#'  }
#'
#' @seealso
#'    \code{\link{DataSet9.4}}
#'
#' @import emmeans lmerTest
#'
#' @examples
#' data(DataSet9.4)
#' DataSet9.4$a <- factor(x = DataSet9.4$a)
#' DataSet9.4$b <- factor(x = DataSet9.4$b)
#'
#' library(lmerTest)
#' Exam9.4lmer <- lmer(y ~ a + (1|b) + (1|a/b), data = DataSet9.4)
#' summary(Exam9.4lmer)
#' library(emmeans)
#' emmeans(Exam9.4lmer, spec = ~a)
#'
NULL


