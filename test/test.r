f <- function(bi, bis, nbis, e1, e2, e3, e4){
  pp <- c()
   
  pp[1] <-  bi*(1-e1)*(1-e2)    *bis*(1-e3)*(1-e4)     + bi*(1-e1)*(1-e2) *(1-bis)*e3*e4          + (1-bi)*e1*e2          *nbis*e3*e4         + (1-bi)*e1*e2         *(1-nbis)*(1-e3)*(1-e4)     # "1111"
  pp[2] <-  bi*e1*(1-e2)        *bis*(1-e3)*(1-e4)     + bi*e1*(1-e2)     *(1-bis)*e3*e4          + (1-bi)*(1-e1)*e2      *nbis*e3*e4         + (1-bi)*(1-e1)*e2     *(1-nbis)*(1-e3)*(1-e4)     # "0111"
  pp[3] <-  bi*(1-e1)*e2        *bis*(1-e3)*(1-e4)     + bi*(1-e1)*e2     *(1-bis)*e3*e4          + (1-bi)*e1*(1-e2)      *nbis*e3*e4         + (1-bi)*e1*(1-e2)     *(1-nbis)*(1-e3)*(1-e4)     # "1011"
  pp[4] <-  bi*e1*e2            *bis*(1-e3)*(1-e4)     + bi*e1*e2         *(1-bis)*e3*e4          + (1-bi)*(1-e1)*(1-e2)  *nbis*e3*e4         + (1-bi)*(1-e1)*(1-e2) *(1-nbis)*(1-e3)*(1-e4)     # "0011"
  pp[5] <-  bi*(1-e1)*(1-e2)    *bis*e3*(1-e4)         + bi*(1-e1)*(1-e2) *(1-bis)*(1-e3)*e4      + (1-bi)*e1*e2          *nbis*(1-e3)*e4     + (1-bi)*e1*e2         *(1-nbis)*e3*(1-e4)         # "1101"
  pp[6] <-  bi*e1*(1-e2)        *bis*e3*(1-e4)         + bi*e1*(1-e2)     *(1-bis)*(1-e3)*e4      + (1-bi)*(1-e1)*e2      *nbis*(1-e3)*e4     + (1-bi)*(1-e1)*e2     *(1-nbis)*e3*(1-e4)         # "0101"
  pp[7] <-  bi*(1-e1)*e2        *bis*e3*(1-e4)         + bi*(1-e1)*e2     *(1-bis)*(1-e3)*e4      + (1-bi)*e1*(1-e2)      *nbis*(1-e3)*e4     + (1-bi)*e1*(1-e2)     *(1-nbis)*e3*(1-e4)         # "1001"
  pp[8] <-  bi*e1*e2            *bis*e3*(1-e4)         + bi*e1*e2         *(1-bis)*(1-e3)*e4      + (1-bi)*(1-e1)*(1-e2)  *nbis*(1-e3)*e4     + (1-bi)*(1-e1)*(1-e2) *(1-nbis)*e3*(1-e4)         # "0001"
  pp[9] <-  bi*(1-e1)*(1-e2)    *bis*(1-e3)*e4         + bi*(1-e1)*(1-e2) *(1-bis)*e3*(1-e4)      + (1-bi)*e1*e2          *nbis*e3*(1-e4)     + (1-bi)*e1*e2         *(1-nbis)*(1-e3)*e4         # "1110"
  pp[10] <- bi*e1*(1-e2)        *bis*(1-e3)*e4         + bi*e1*(1-e2)     *(1-bis)*e3*(1-e4)      + (1-bi)*(1-e1)*e2      *nbis*e3*(1-e4)     + (1-bi)*(1-e1)*e2     *(1-nbis)*(1-e3)*e4         # "0110"
  pp[11] <- bi*(1-e1)*e2        *bis*(1-e3)*e4         + bi*(1-e1)*e2     *(1-bis)*e3*(1-e4)      + (1-bi)*e1*(1-e2)      *nbis*e3*(1-e4)     + (1-bi)*e1*(1-e2)     *(1-nbis)*(1-e3)*e4         # "1010"
  pp[12] <- bi*e1*e2            *bis*(1-e3)*e4         + bi*e1*e2         *(1-bis)*e3*(1-e4)      + (1-bi)*(1-e1)*(1-e2)  *nbis*e3*(1-e4)     + (1-bi)*(1-e1)*(1-e2) *(1-nbis)*(1-e3)*e4         # "0010"
  pp[13] <- bi*(1-e1)*(1-e2)    *bis*e3*e4             + bi*(1-e1)*(1-e2) *(1-bis)*(1-e3)*(1-e4)  + (1-bi)*e1*e2          *nbis*(1-e3)*(1-e4) + (1-bi)*e1*e2         *(1-nbis)*e3*e4             # "1100"
  pp[14] <- bi*e1*(1-e2)        *bis*e3*e4             + bi*e1*(1-e2)     *(1-bis)*(1-e3)*(1-e4)  + (1-bi)*(1-e1)*e2      *nbis*(1-e3)*(1-e4) + (1-bi)*(1-e1)*e2     *(1-nbis)*e3*e4             # "0100"
  pp[15] <- bi*(1-e1)*e2        *bis*e3*e4             + bi*(1-e1)*e2     *(1-bis)*(1-e3)*(1-e4)  + (1-bi)*e1*(1-e2)      *nbis*(1-e3)*(1-e4) + (1-bi)*e1*(1-e2)     *(1-nbis)*e3*e4             # "1000"
  pp[16] <- bi*e1*e2            *bis*e3*e4             + bi*e1*e2         *(1-bis)*(1-e3)*(1-e4)  + (1-bi)*(1-e1)*(1-e2)  *nbis*(1-e3)*(1-e4) + (1-bi)*(1-e1)*(1-e2) *(1-nbis)*e3*e4             # "0000" 
    return(pp)
}

bi   <- .3
bis  <- .4 
nbis <- .2
e1 <- .05
e2 <- .06
e3 <- .07
e4 <- .08

pp <- f(bi, bis, nbis, e1, e2, e3, e4)
pp

bi   <- .1
bis  <- .8 
nbis <- .4
e1 <- .10
e2 <- .04
e3 <- .02
e4 <- .03

pp <- f(bi, bis, nbis, e1, e2, e3, e4)
pp