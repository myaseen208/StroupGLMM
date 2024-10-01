#' @title Example 8.2 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-252)
#' @name   Exam8.2
#' @description Exam8.2 Incomplete strip-plot
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
#'    \code{\link{DataSet8.2}}
#'
#' @import emmeans lmerTest
#' @examples
#'
#' data(DataSet8.2)
#' DataSet8.2$block <- factor(x = DataSet8.2$block)
#' DataSet8.2$a <- factor(x = DataSet8.2$a)
#' DataSet8.2$b <- factor(x = DataSet8.2$b)
#'
#' library(lmerTest)
#'
#' Exam8.2lmer <-
#'           lmer(
#'                  formula = y ~ a*b + (1|block) + (1|block:a) + (1|block:b)
#'                , data    = DataSet8.2
#'                )
#' anova(Exam8.2lmer,ddf="Kenward-Roger")
#'
#' library(emmeans)
#' emmeans(object  = Exam8.2lmer, specs = ~a|b)
#' emmip(
#'        object  = emmeans(object  = Exam8.2lmer, specs = ~a|b)
#'      , formula = a~b
#'      , ylab    = "y Lsmeans"
#'      , main    = "Lsmeans for a*b"
#'       )
#'
#' ##---Simple effect comparisons of a*b Least Squares Means by a ( page # 254)
#' emmeans(Exam8.2lmer, pairwise ~ b|a)
#'
#'
NULL
