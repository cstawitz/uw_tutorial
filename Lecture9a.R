ff <- function(x,y) {exp(-(x+1)^2/2)*exp(-(y+2)^2/2) }

Lecture9a <- function()
{
  par(mfrow=c(1,1))
 x <- seq(from=-5,to=4,by=0.5)
 y <- seq(from=-5,to=4,by=0.5)
 z <- outer(x,y,ff)
 par(bg="white")
 Res <- persp(x,y,z,theta=-45,phi=15,ltheta=100,scale=T,zlim=c(0,2),xlab="x",ylab="y",shade=0.5,
       zlab="Posterior density")
 DoMCMC1(Res,ff,c(-4,-4),"darkred")
 DoMCMC1(Res,ff,c(3,-4),"forestgreen")
 DoMCMC1(Res,ff,c(-2,4),"darkblue")
}

# ==============================================================================

DoMCMC1 <- function(basis,func,Xinit,TheCol,Nsim=100)
{
 Ndim <- length(Xinit)
 print(func)
 Xcurr <- Xinit
 Fcurr <- log(func(Xcurr[1],Xcurr[2]))                                       # Log-likelihood
 Outs <- matrix(0,nrow=Nsim,ncol=(Ndim+1))
 Ipnt <- 0; Icnt <- 0
 for (Isim in 1:Nsim)
  {
   for (Ipar in 1:Ndim)
    {
     Xnext <- Xcurr
     Xnext[Ipar] <- Xcurr[Ipar] + runif(1,-0.5,0.5)
     Fnext <- log(func(Xnext[1],Xnext[2]))
     Rand1 <- log(runif(1,0,1))
     if (Fnext > Fcurr+Rand1)
      {Fcurr <- Fnext; Xcurr <- Xnext }   
    } 
   Outs[Isim,1:Ndim] <- Xcurr
   Outs[Isim,Ndim+1] <- Fcurr 
  } 
 print(Outs) 
 lines(trans3d(Outs[,1],Outs[,2],exp(Outs[,3]), basis), col = TheCol, lwd = 2)
 points(trans3d(Outs[,1],Outs[,2],exp(Outs[,3]), basis), col = TheCol, pch=16)



}


# ==============================================================================

Lecture9a()
