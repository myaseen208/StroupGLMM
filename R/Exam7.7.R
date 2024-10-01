#' @title Example 7.7 from Generalized Linear Mixed Models: Modern Concepts, Methods and Applications by Walter W. Stroup (p-235)
#' @name   Exam7.7
#' @description Exam7.7 is an explaination of segmented regression
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
#'    \code{\link{DataSet7.7}}
#' @import  splines ggplot2
#' @examples
#'
#' library(splines)
#' library(ggplot2)
#'
#' DataSet7.7$a  <- factor(x = DataSet7.7$a)
#' knots <- c(0, 0, 0, 0, 10, 10, 20, 30, 40, 40, 40, 45, 45, 45, 50, 50, 50)
#'
#' bx <- splineDesign(knots = knots, x = DataSet7.7$x, outer.ok = TRUE)
#'
#' Exam7.7fm <- lm(formula = y ~ a*bx, data  = DataSet7.7)
#' anova(Exam7.7fm)
#'
#' Data  <- data.frame(DataSet7.7, fit = Exam7.7fm$fit)
#' ##---Estimated response surface by using segmented regression
#' Plot <-
#'      ggplot(data = Data , mapping = aes(x = x, y = y, colour = a)) +
#'      geom_point() +
#'      geom_line(linewidth = 1) +
#'      ggtitle("Response surface by using segmented regression")
#'
#' print(Plot)
NULL
