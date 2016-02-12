pollutantmean<-function(directory,pollutant,id=1:332){
  library(readr)
  df={}
  for(x in 1:length(id)){
    my_x<-ifelse(id[x]<100,ifelse(id[x]<10,paste("00",id[x],sep=""),paste("0",id[x],sep="")),id[x])
    #print(my_x)
    df<-rbind(df,read_csv(file=paste(directory,"/",my_x,".csv",sep="")))
  }
  df$nitrate<-as.numeric(df$nitrate)
  df$sulfate<-as.numeric(df$sulfate)
  mean(df[,which(colnames(df)==pollutant)],na.rm=T)
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
