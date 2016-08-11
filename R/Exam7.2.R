#' @title Example 7.2 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-219)
#' @name   Exam7.2
#' @docType data
#' @keywords datasets
#' @description Exam7.2 explains multifactor models with some factors qualitative and some quantitative(Equal slopes ANCOVA)
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
#'    \code{\link{DataSet7.2}}
#' @import lsmeans car ggplot2
#' @examples
library(lsmeans)
library(car)
library(ggplot2)
data(DataSet7.2)
DataSet7.2$trt <- factor( x = DataSet7.2$trt )
##----ANCOVA(Equal slope Model)
Exam7.2fm1 <-
    aov( 
        formula = y ~ trt*x
      , data    = DataSet7.2
        )

car::Anova( mod = Exam7.2fm1 , type="III")

##---ANCOVA(without interaction because of non significant slope effect)
Exam7.2fm2 <-
    aov( 
        formula = y ~ trt + x
      , data    = DataSet7.2
        )
       
car::Anova(mod = Exam7.2fm2 , type="III")
##---Ls means for 2nd model
( Lsm7.2    <-
     lsmeans::lsmeans(
         object  = Exam7.2fm2
       , specs   = ~trt
     # , ...
     )
   ) 
##---Anova without covariate
Exam7.2fm3 <-
    aov( 
        formula = y ~ trt 
      , data    = DataSet7.2
        )
       
car::Anova( mod = Exam7.2fm3,type="III") 
##---Ls means for 3rd model
 ( Lsm7.2    <-
     lsmeans::lsmeans(
         object  = Exam7.2fm3
       , specs   = ~trt
     # , ...
     )
   ) 
##---Box Plot of Covariate by treatment   
Plot <-
   ggplot( 
          data    = DataSet7.2
        , mapping = aes(x= factor(trt), y=x)
         )                 +
   geom_boxplot(width=0.5) +
   coord_flip()            +
   geom_point()            +
   stat_summary(
         fun.y    = "mean"
       , geom     = "point"
       , shape    =  23
       , size     =  2
       , fill     = "red"
       )                   + 
   theme_bw()              +
   ggtitle("Covariate by treatment Box Plot") +
   xlab("Treatment")
print(Plot) 

NULL 
   
 
