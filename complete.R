complete<-function(directory,id=1:332){
  library(readr)
  df=data.frame("id"=id,"nobs"=0)
  for(x in 1:length(id)){
    my_x<-ifelse(id[x]<100,ifelse(id[x]<10,paste("00",id[x],sep=""),paste("0",id[x],sep="")),id[x])
    mydf<-read_csv(file=paste(directory,"/",my_x,".csv",sep=""))
    df$nobs[x]<-sum(complete.cases(mydf))
  }
  return(df)
}

directory<-"C:/Users/mwauters/Documents/Private/coursera/Introduction to R Programming/Week 2/Assignment/specdata/"
complete("specdata",1) 
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
