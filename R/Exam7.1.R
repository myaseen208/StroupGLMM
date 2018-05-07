#' @title Example 7.1 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-213)
#' @name   Exam7.1
#' @docType data
#' @keywords datasets
#' @description Exam7.1 explains multifactor models with all factors qualitative
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
#'    \code{\link{DataSet7.1}}
#'    
#' @importFrom lsmeans lsmeans contrast lsmip
#' @importFrom phia testInteractions
#' @importFrom car linearHypothesis
#' 
#' @examples
#' 
#' library(lsmeans)
#' library(car)
#' data(DataSet7.1)
#' 
#' DataSet7.1$a <- factor(x = DataSet7.1$a)
#' DataSet7.1$b <- factor(x = DataSet7.1$b)
#' 
#' Exam7.1.lm1 <-
#'      lm(
#'         formula     = y ~ a + b + a*b
#'       , data        = DataSet7.1
#'     # , subset
#'     # , weights
#'     # , na.action
#'       , method      = "qr"
#'       , model       = TRUE
#'     # , x           = FALSE
#'     # , y           = FALSE
#'       , qr          = TRUE
#'       , singular.ok = TRUE
#'       , contrasts   = NULL
#'     # , offset
#'     # , ...
#'          )
#' 
#' summary( Exam7.1.lm1 )                                   
#' anova(Exam7.1.lm1)
#' ##---Result obtained as in SLICE statement in SAS for a0 & a1 
#' library(phia)
#' a0 <- list(a=c("0"=1))
#' phia::testInteractions(Exam7.1.lm1, custom=a0, across="b")
#' a1 <- list(a=c("1"=1))
#' phia::testInteractions(Exam7.1.lm1, custom=a1, across="b")
#' 
#'  
#' ##---Interaction plot
#' lsmip( 
#'        object  = Exam7.1.lm1
#'      , formula = a~b
#'      , ylab    = "y Lsmeans"
#'      , main    = "Lsmeans for a*b"
#'       )
#' #-------------------------------------------------------------
#' ## Individula least squares treatment means 
#' #-------------------------------------------------------------
#' Lsm7.1 <-
#'      lsmeans::lsmeans(
#'          object  = Exam7.1.lm1
#'        , specs   = ~a*b
#'      # , ...
#'      )
#' 
#' Lsm7.1
#' ##---Simpe effects comparison of interaction by a 
#' ##   (but it doesn't give the same p-value as in article 7.4.2 page#215)
#' SimpleEff7.1 <-
#'  lsmeans::lsmeans(
#'          object  = Exam7.1.lm1
#'        , specs   = pairwise~b|a
#'      # , ...
#'      )$contrasts
#' 
#' SimpleEff7.1
#' 
#' ##---Alternative method of pairwise comparisons by applying contrast
#' ##   coefficient (gives the same p-value as in 7.4.2)
#' ContrastLsm7.1 <-
#'     lsmeans::contrast(
#'               Lsm7.1
#'             , list (
#'                     c1 = c(1,0,-1,0,0,0)
#'                   , c2 = c(1,0,0,0,-1,0)
#'                   , c3 = c(0,0,1,0,-1,0)
#'                   , c4 = c(0,1,0,-1,0,0)
#'                   , c5 = c(0,1,0,0,0,-1)
#'                   , c6 = c(0,1,0,0,-1,0)
#'                   ) 
#'       )
#'  
#' ContrastLsm7.1
#' 
#' ##---Nested Model (page 216)----
#' Exam7.1.lm2 <-
#'      lm(
#'         formula     = y ~ a + a %in% b
#'       , data        = DataSet7.1
#'     # , subset
#'     # , weights
#'     # , na.action
#'       , method      = "qr"
#'       , model       = TRUE
#'     # , x           = FALSE
#'     # , y           = FALSE
#'       , qr          = TRUE
#'       , singular.ok = TRUE
#'       , contrasts   = NULL
#'     # , offset
#'     # , ...
#'    )
#' 
#' summary( Exam7.1.lm2 )                                   
#' anova(Exam7.1.lm2)
#' 
#' ContrastA0lm2 <- car::linearHypothesis(Exam7.1.lm2, c("a0:b1=a0:b2"))
#' ContrastA0lm2
#' ContrastA1lm2 <- car::linearHypothesis(Exam7.1.lm2,c("a1:b1=a1:b2"))
#' ContrastA1lm2
#' 
#'  ##---Bonferroni's adjusted p-values
#' SimpleEff7.1B <-
#'  lsmeans::lsmeans(
#'          object  = Exam7.1.lm2
#'        , specs   = pairwise~b|a
#'        , adjust  = "bonferroni"
#'      )$contrasts
#' 
#' SimpleEff7.1B
#' 
#' ##---Alternative method of pairwise comparisons by applying contrast coefficient with Bonferroni adjustment
#' Bonferroni7.1 <-
#'     lsmeans::contrast(
#'           Lsm7.1
#'         , list(
#'             c1 = c(1,0,-1,0,0,0)
#'           , c2 = c(1,0,0,0,-1,0)
#'           , c3 = c(0,0,1,0,-1,0)
#'           , c4 = c(0,1,0,-1,0,0)
#'           , c5 = c(0,1,0,0,0,-1)
#'           , c6 = c(0,1,0,0,-1,0)
#'               )
#'         , adjust="bonferroni" 
#'          )
#' Bonferroni7.1
NULL                                 
       