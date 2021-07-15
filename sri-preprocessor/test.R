library(dplyr)
library(tidyr)
library(ggplot2)
library(pander)
library(forcats)


my.data <- data.frame(y=rnorm(5), 
                      x1=c(1:5), 
                      x2=c(TRUE, TRUE, FALSE, FALSE, FALSE),
                      X3=letters[1:5],
                      x4=c('Sri','krishna','Mahesh','Rag','Nandu'))

m<-str(my.data)

ms<-sapply(iris,summary)
ml<-lapply(iris,summary)
m1<-lapply(my.data,class)
colnames(my.data)


for(i in c){
  print(i)
}

m1<-na.omit(m)

m1 %>% filter(Var2==c[5])


n<- ''
for (i in ml) {
  
  n<-paste0(n,i)
}
