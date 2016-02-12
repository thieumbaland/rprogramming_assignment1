corr<-function(directory,threshold=0){
  library(readr)
  tmp<-complete(directory)
  id<-tmp$id[tmp$nobs>threshold]
  mycor<-{}
  for(x in 1:length(id)){
    my_x<-ifelse(id[x]<100,ifelse(id[x]<10,paste("00",id[x],sep=""),paste("0",id[x],sep="")),id[x])
    mydf<-read_csv(file=paste(directory,"/",my_x,".csv",sep=""))
    mydf<-na.omit(mydf)
    mydf$nitrate<-as.numeric(mydf$nitrate)
    mydf$sulfate<-as.numeric(mydf$sulfate)
    #print(x)
    mycor<-c(mycor,cor(mydf$sulfate,mydf$nitrate))
  }
  return(mycor)
}

source("complete.R")
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
head(cr)