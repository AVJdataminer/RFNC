Train_testMG<-function(modelpath){
  setwd(modelpath)
 
  theta=read.csv("NA_filled.csv")

  modeldata=theta

  #modeldata=select(modeldata,-Contract.Number)
  in_train <- createDataPartition(modeldata$code, p = percent, list = FALSE)
  if(percent==1){train=modeldata} else{train=modeldata[in_train,]}
  if(percent==1){test=dplyr::sample_frac(modeldata,0.1,replace=T)}else{test=modeldata[-in_train,]}
  write.csv(train, "training.csv", row.names = F)
  write.csv(test, "testing.csv",row.names = F)
  
}