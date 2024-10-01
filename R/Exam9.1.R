#' @title Example 9.1 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-273)
#' @name   Exam9.1
#' @description Exam9.1 One-way random effects only model
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
#'    \code{\link{DataSet9.1}}
#' @import emmeans lmerTest phia
#' @examples
#'
#' data(DataSet9.1)
#' DataSet9.1$a <- factor(x = DataSet9.1$a)
#'
#' ##---Random effects model
#' library(lmerTest)
#' Exam9.1lmer <- lmer( y ~ 1 + (1|a), data = DataSet9.1)
#' summary(Exam9.1lmer)
#'
#' ##---fixed effects model
#' Exam9.1lmer2 <- lm(y ~ a, data = DataSet9.1)
#' summary(Exam9.1lmer2)
#'
#'  #---------------------------------------------------
#'  ## Over all mean narrow( page # 274)
#'  #---------------------------------------------------
#' library(emmeans)
#' library(phia)
#' list9.1 <- list(a = c( "1" = 1/12,"2" = 1/12
#'                       , "3" = 1/12,"4" = 1/12
#'                       , "5" = 1/12,"6" = 1/12
#'                       , "7" = 1/12,"8" = 1/12
#'                       , "9" = 1/12,"10" = 1/12
#'                       , "11" = 1/12,"12" = 1/12
#'                       ))
#' phia::testFactors(model = Exam9.1lmer2, levels = list9.1)
#'
#'
#' #---BLUP Estimates (Table 9.1)
#' coef <- unlist(ranef(Exam9.1lmer))
#' BLUPa <- NULL
#' for( i in 1:length(coef)) {
#'   BLUPa[i] <- (mean(DataSet9.1$y)+coef[i])
#'   }
#' print(BLUPa)
#'
NULL
