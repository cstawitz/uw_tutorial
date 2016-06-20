# uw_tutorial
## About
This is a tutorial for students at UW SAFS to learn the basics of Github. We're using this repository to test out collaborative aspects of Git.

##To do
This section contains a bunch of R code chunks you may copy in to your R files to test out Git.

```{r}
print("Hello World!")
```

```{r}
pdf("SimplePlot.pdf")
plot(1:10, 10:1)
dev.off()
```

```{r}
pubchoice <- function(rainlimit=0.05,lightlimit=40,minutes=10){
  file <- 'http://www.atmos.washington.edu/cgi-bin/latest_uw.cgi'
  alldat <- readLines(file)
  skip <- grep("mbar",alldat)+1
  maxminutes <- length(alldat)-14
  if(maxminutes<minutes){
    minutes <- maxminutes
    cat(" It must be shortly after midnight UTC, so you only get",minutes,"minutes of data.\n")
  }
  dat <- read.table(file,skip=skip,nrows=minutes)
  rain <- sum(dat$V7)
  radiation <- round(mean(dat$V8),1)
  wet <- rain > rainlimit
  dark <- radiation < lightlimit
  cat(" In the past",minutes,"minutes it has been",
      ifelse(wet,"WET","DRY"),"and",ifelse(dark,"DARK.","SUNNY."),"\n",
      "(total rainfall is",rain,"inches, which is",
      ifelse(wet,"above","below"),"the",rainlimit,"limit,\n",
      "and mean light level is",radiation,"watts per square meter,\n",
      "which is",ifelse(radiation>lightlimit,"above","below"),"the",lightlimit,"limit).\n\n",
      "Go drink at",ifelse(wet|dark,"the College Inn!","the Big Time!"),"\n")
}
pubchoice()
```