# uw_tutorial
## About
This is a tutorial for students at UW SAFS to learn the basics of Github. We're using this repository to test out collaborative aspects of Git.

##R code examples
This section contains a bunch of R code chunks you may copy in to your R files to test out Git.

The canonical "Hello world."

```{r}
print("Hello World!")
```
Make some nuisance graphs

```{r}
pdf("SimplePlot.pdf")
plot(1:10, 10:1)
dev.off()
```

```{r}
a <- 42
A <- a * 2  # R is case sensitive
print(a)
cat(A, "\n") # "84" is concatenated with "\n"
if(A>a) # true, 84 > 42
{
  cat(A, ">", a, "\n")
} 
```

```{r}
readinteger <- function()
{ 
  n <- readline(prompt="Enter an integer: ")
  if(!grepl("^[0-9]+$",n))
  {
    return(readinteger())
  }
  return(as.integer(n))
}

# real program start here
  
num <- round(runif(1) * 100, digits = 0)
guess <- -1

cat("Guess a number between 0 and 100.\n")

while(guess != num)
{ 
  guess <- readinteger()
  if (guess == num)
  {
    cat("Congratulations,", num, "is right.\n")
  }
  else if (guess < num)
  {
    cat("It's bigger!\n")
  }
  else if(guess > num)
  {
    cat("It's smaller!\n")
  }
}
```
