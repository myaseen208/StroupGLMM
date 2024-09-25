#' @title Example 3.2 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup(p-73)
#' @name   Exam3.2
#' @description Exam3.2 used binomial data, two treatment samples
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
#'    \code{\link{DataSet3.1}}
#'
#' @import parameters
#' @import emmeans
#' @importFrom phia testFactors
#' @importFrom stats glm summary.glm
#'
#' @examples
#' #-------------------------------------------------------------
#' ## Linear Model and results discussed in Article 1.2.1 after Table1.1
#' #-------------------------------------------------------------
#' data(DataSet3.1)
#' DataSet3.1$trt <- factor(x =  DataSet3.1$trt)
#' Exam3.2.glm <- glm(formula =  F/N~trt, family =  quasibinomial(link = "logit"), data =  DataSet3.1)
#' summary(Exam3.2.glm)
#' library(parameters)
#' model_parameters(Exam3.2.glm)
#'
#' #-------------------------------------------------------------
#' ## Individula least squares treatment means
#' #-------------------------------------------------------------
#' library(emmeans)
#' emmeans(object  = Exam3.2.glm, specs   = "trt")
#' emmeans(object  = Exam3.2.glm, specs   = "trt", type = "response")
#'
#' #---------------------------------------------------
#' ## Over all mean
#' #---------------------------------------------------
#' library(phia)
#' list3.2 <-   list(trt = c("0" = 0.5, "1" = 0.5 ))
#' testFactors(model  =  Exam3.2.glm, levels =  list3.2 )
#'
#' #---------------------------------------------------
#' ## Repairwise treatment means estimate
#' #---------------------------------------------------
#' contrast(emmeans(object  = Exam3.2.glm, specs   = "trt"))
#' contrast(emmeans(object  = Exam3.2.glm, specs   = "trt", type = "response"))
NULL
