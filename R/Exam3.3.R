#' @title Example 3.3 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup(p-77)
#' @name   Exam3.3
#' @description Exam3.3 use RCBD data with fixed location effect and different forms of estimable functions are shown in this example.
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
#'    \code{\link{DataSet3.2}}
#'
#' @import parameters
#' @import emmeans
#' @importFrom phia testFactors
#' @importFrom stats glm summary.glm
#' @importFrom mutoss sidak
#'
#' @examples
#' #-----------------------------------------------------------------------------------
#' ## linear model for Gaussian data
#' #-----------------------------------------------------------------------------------
#' data(DataSet3.2)
#' DataSet3.2$trt <- factor(x = DataSet3.2$trt, level = c(3,0,1,2))
#' DataSet3.2$loc <- factor(x = DataSet3.2$loc, level = c(8, 1, 2, 3, 4, 5, 6, 7))
#'
#' levels(DataSet3.2$trt)
#' levels(DataSet3.2$loc)
#'
#' Exam3.3.lm1 <- lm(formula = Y~ trt + loc, data = DataSet3.2)
#' summary( Exam3.3.lm1 )
#'
#' #-------------------------------------------------------------
#' ## Individual least squares treatment means
#' #-------------------------------------------------------------
#' library(emmeans)
#' (Lsm3.3 <- emmeans(object  = Exam3.3.lm1, specs = ~trt))
#'
#' #---------------------------------------------------
#' ## Pairwise treatment means estimate
#' #---------------------------------------------------
#' contrast(object = Lsm3.3 , method = "pairwise")
#'
#' #---------------------------------------------------
#' ## Revpairwise treatment means estimate
#' #---------------------------------------------------
#' contrast(object = Lsm3.3, method = "revpairwise")
#' #-------------------------------------------------------
#' ## LSM Trt0 (This term is used in Walter Stroups' book)
#' #-------------------------------------------------------
#' contrast(
#'        object = emmeans(object  = Exam3.3.lm1, specs   = ~ trt)
#'      , list(trt = c(0, 1, 0, 0))
#'      )
#'
#' library(phia)
#' testFactors(model  =  Exam3.3.lm1, levels =  list(trt = c("0" = 1)))
#'
#'
#' #-------------------------------------------------------
#' ## LSM Trt0 alt(This term is used in Walter Stroups' book)
#' #-------------------------------------------------------
#' # contrast(
#' #        object = emmeans(object  = Exam3.3.lm1, specs   = ~ trt + loc)
#' #      , list(
#' #         trt = c(0, 1, 0, 0)
#' #       , loc = c(1, 0, 0, 0, 0, 0, 0, 0)
#' #        )
#' #      )
#' #
#' #
#' # list3.3.2 <-
#' #   list(
#' #         trt = c("0" = 1 )
#' #       , loc = c("1" = 0, "2" = 0,"3" = 0,"4" = 0,"5" = 0,"6" = 0,"7" = 0)
#' #   )
#' # testFactors(model  =  Exam3.3.lm1, levels =  list3.3.2)
#'
#' #-------------------------------------------------------
#' ##  Trt0 Vs Trt1
#' #-------------------------------------------------------
#' contrast(
#'     emmeans(object  = Exam3.3.lm1, specs = ~trt)
#'   , list(trt = c(0, 1, -1, 0))
#'   )
#'
#' testFactors(model  =  Exam3.3.lm1, levels =  list(trt = c("0" = 1, "1" = -1)))
#'
#' #-------------------------------------------------------
#' ##  average Trt0 + Trt1
#' #-------------------------------------------------------
#' contrast(
#'     emmeans(object  = Exam3.3.lm1, specs = ~trt)
#'   , list(trt = c(0, 1/2, 1/2, 0))
#'   )
#'
#' testFactors(model  =  Exam3.3.lm1, levels =  list(trt = c("0" = 0.5 , "1" = 0.5)))
#'
#' #-------------------------------------------------------
#' ##  average Trt0+2+3
#' #-------------------------------------------------------
#' contrast(
#'     emmeans(object  = Exam3.3.lm1, specs = ~trt)
#'   , list(trt = c(1/3, 1/3, 0, 1/3))
#'   )
#'
#' testFactors(model  =  Exam3.3.lm1, levels = list(trt = c("0" = 1/3,"2" = 1/3,"3" = 1/3)))
#'
#' #-------------------------------------------------------
#' ##  Trt 2 Vs 3 difference
#' #-------------------------------------------------------
#' contrast(
#'     emmeans(object  = Exam3.3.lm1, specs = ~trt)
#'   , list(trt = c(-1, 0, 0, 1))
#'   )
#'
#' testFactors(model = Exam3.3.lm1, levels = list(trt = c("2" = 1,"3" = -1)))
#'
#' #-------------------------------------------------------
#' ##  Trt 1 Vs 2 difference
#' #-------------------------------------------------------
#' contrast(
#'     emmeans(object  = Exam3.3.lm1, specs = ~trt)
#'   , list(trt = c(0, 0, 1, -1))
#'   )
#' testFactors(model = Exam3.3.lm1, levels = list(trt = c("1" = 1,"2" = -1)))
#'
#' #-------------------------------------------------------
#' ##  Trt 1 Vs 3 difference
#' #-------------------------------------------------------
#' contrast(
#'     emmeans(object  = Exam3.3.lm1, specs = ~trt)
#'   , list(trt = c(-1, 0, 1, 0))
#'   )
#' testFactors(model = Exam3.3.lm1, levels = list(trt = c("1" = 1,"3" = -1)))
#'
#' #-------------------------------------------------------
#' ##  Average trt0+1  vs Average Trt2+3
#' #-------------------------------------------------------
#' contrast(
#'     emmeans(object  = Exam3.3.lm1, specs = ~trt)
#'   , list(trt = c(-1/2, 1/2, 1/2, -1/2))
#'   )
#' testFactors(model = Exam3.3.lm1, levels = list(trt = c("0" = 0.5,"1" = 0.5,"2" = -0.5,"3" = -0.5)))
#'
#' #-------------------------------------------------------
#' ##  Trt1  vs Average Trt0+1+2
#' #-------------------------------------------------------
#' contrast(
#'     emmeans(object  = Exam3.3.lm1, specs = ~trt)
#'   , list(trt = c(1/3, 1/3, -1, 1/3))
#'   )
#' testFactors(model = Exam3.3.lm1, levels = list(trt = c("0" = 1/3,"1" = -1,"2" = 1/3,"3" = 1/3)))
#'
NULL
