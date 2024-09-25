#' @title Example 5.3 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup(p-172)
#' @name   Exam5.3
#' @description Exam5.3 Inference using empirical standard error with different Bias connection
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
#' @import parameters lmerTest
#'
#'
#' @examples
#'
#' data(DataSet4.1)
#' DataSet4.1$trt   <- factor(x = DataSet4.1$trt)
#' DataSet4.1$block <- factor( x = DataSet4.1$block)
#'
#' ##---REML estimates on page 172
#' library(lmerTest)
#' Exam5.3REML <-  lmerTest::lmer(formula = y ~ trt + (1|block), data = DataSet4.1, REML = TRUE)
#' Exam5.3REML
#' library(parameters)
#' model_parameters(Exam5.3REML)
#' ##---Standard Error Type "Model Based" with no Bias Connection
#' anova(object = Exam5.3REML)
#' anova(object = Exam5.3REML, ddf = "Satterthwaite")
#'
#'
#' ##---Standard Error Type "Model Based" with "Kenward-Roger approximation" Bias Connection
#' anova(object = Exam5.3REML, ddf = "Kenward-Roger")
#'
#' ##---ML estimates on page 172
#' Exam5.3ML <- lmerTest::lmer(formula = y ~ trt + ( 1|block ), data = DataSet4.1, REML = FALSE)
#' Exam5.3ML
#' library(parameters)
#' model_parameters(Exam5.3ML)
#'
#' ##---Standard Error Type "Model Based" with no Bias Connection
#' anova(object = Exam5.3ML )
#' anova(object = Exam5.3ML, ddf = "Satterthwaite")
#'
NULL
