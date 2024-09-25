#' @title Example 4.1 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup(p-138)
#' @name   Exam4.1
#' @description Exam4.1 REML vs ML criterion is used keeping block effects random
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
#'    \code{\link{DataSet4.1}}
#'
#' @import parameters
#' @import lmerTest
#'
#' @examples
#'
#' DataSet4.1$trt   <- factor(x =  DataSet4.1$trt)
#' DataSet4.1$block <- factor(x =  DataSet4.1$block)
#'
#' #---REML estimates on page 138(article 4.4.3.3)
#' library(lmerTest)
#'
#' Exam4.1REML  <- lmer(formula = y~ trt +( 1|block ), data = DataSet4.1)
#' library(parameters)
#' model_parameters(Exam4.1REML)
#' print(VarCorr(x = Exam4.1REML), comp = c("Variance"))
#'
#' ##---ML estimates on page 138(article 4.4.3.3)
#' Exam4.1ML  <- lmer(formula = y ~ trt + (1|block), data = DataSet4.1, REML = FALSE)
#' model_parameters(Exam4.1ML)
#' print(VarCorr(x =  Exam4.1ML), comp = c("Variance"))
#'
#' Exam4.1.lm <- lm(formula  = y~ trt + block, data = DataSet4.1)
#' anova(object = Exam4.1.lm)
NULL
