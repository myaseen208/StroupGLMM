#' @title Example 8.1 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-250)
#' @name   Exam8.1
#' @description Exam8.1 Nested factorial structure
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
#'    \code{\link{DataSet8.1}}
#'
#' @import emmeans lmerTest
#' @examples
#'
#' data(DataSet8.1)
#' DataSet8.1$block <- factor(x = DataSet8.1$block)
#' DataSet8.1$set <- factor(x = DataSet8.1$set)
#' DataSet8.1$trt <- factor(x = DataSet8.1$trt)
#'
#' library(lmerTest)
#' Exam8.1Lmer <- lmer(y ~ set + trt %in% set + (1|set/block), DataSet8.1)
#' summary(Exam8.1Lmer)
#' anova(Exam8.1Lmer)
#'
#' library(emmeans)
#' emmeans(object  = Exam8.1Lmer, specs = ~trt|set)
#' contrast(emmeans(object  = Exam8.1Lmer, specs = ~trt|set), method = "pairwise", by = "set")
#'
NULL
