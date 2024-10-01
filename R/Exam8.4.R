#' @title Example 8.4 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-259)
#' @name   Exam8.4
#' @description Exam8.4 Multifactor treatment and Multilevel design structures
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
#'    \code{\link{DataSet8.4}}
#'
#' @import emmeans lmerTest
#'
#' @examples
#'
#' data(DataSet8.4)
#' DataSet8.4$block <- factor(x = DataSet8.4$block)
#' DataSet8.4$a <- factor(x = DataSet8.4$a)
#' DataSet8.4$b <- factor(x = DataSet8.4$b)
#'
#' library(lmerTest)
#' Exam8.4lmer   <-
#'            lmer(
#'                 y ~ a + b %in% a +
#'                     (1|block) + (1|block:a) + (1|block:b)
#'               , data = DataSet8.4
#'               )
#' anova(Exam8.4lmer, ddf = "Kenward-Roger")
#'
#' library(emmeans)
#' emmeans(object = Exam8.4lmer, specs = ~a|b)
NULL
