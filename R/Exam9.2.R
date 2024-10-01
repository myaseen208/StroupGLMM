#' @title Example 9.2 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-276)
#' @name   Exam9.2
#' @description Exam9.2 Two way random effects nested model
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
#'    \code{\link{DataSet9.2}}
#'
#' @import lmerTest phia
#' @examples
#'
#' data(DataSet9.2)
#' DataSet9.2$a <- factor(x = DataSet9.2$a)
#' DataSet9.2$b <- factor(x = DataSet9.2$b)
#'
#' library(lmerTest)
#' Exam9.2lmer <- lmer(y ~ (1|b/a), data = DataSet9.2)
#' summary(Exam9.2lmer)
#'
#' Exam9.2lmer2 <- lm(y ~ a + b %in% a, data = DataSet9.2)
#' summary(Exam9.2lmer2)
#'
#' ##--- Over all mean
#' library(phia)
#' list9.2 <- list(a = c("1" = 1/7,"2" = 1/7
#'                     , "3" = 1/7,"4" = 1/7
#'                     , "5" = 1/7,"6" = 1/7
#'                     , "7" = 1/7
#'                      ))
#' phia::testFactors(model = Exam9.2lmer2, levels = list9.2)
#'
#' #---BLUP Estimates
#' coef <- unlist(ranef(Exam9.2lmer)$a)
#' BLUPa <- NULL
#' for(i in 1:length(coef)){
#'   BLUPa[i] <- (mean(DataSet9.2$y) + coef[i])
#'   }
#' print(BLUPa)
#'
#' #---BLUP Estimates Narrow
#' BLUPaNar <- NULL
#' for( i in 1:length(coef)) {
#'   BLUPaNar[i] <- (mean(DataSet9.2$y) + coef[i])
#' }
#'
#' BLUPaNar
#'
NULL
