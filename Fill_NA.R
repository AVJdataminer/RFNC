Fill_NA<-function(x,home,modelpath){
  setwd(modelpath)
  if(nrow(x)<1){x<-read.csv(list.files(pattern = "indata_file.csv"))}	
  #split into numeric and non-numeric
  require(PCAmixdata)
  ds=splitmix(x)
 
  impute.med <- function(x) {
    z <- median(x, na.rm = TRUE)
    x[is.na(x)] <- z
    return(x)
  }
  
  #treat numeric NA's
  dat2 <- data.frame(sapply(ds$X.quanti, function(x){
    if(is.numeric(x) & any(is.na(x))){
      impute.med(x)
    } else {
      x
    } 
  }
  ))
  #treat factor or character Na's
  df1=lapply(ds$X.quali,fct_explicit_na)
  #paste two df's back together
  out1=cbind(dat2,df1)

  #create a state lookup and recode
  #stnl=state.abb #state name abreviations
  #out1$NAME_STATE=as.character(out1$NAME_STATE)
  #out1$NAME_STATE=ifelse(out1$NAME_STATE%in% stnl,out1$NAME_STATE, "UN")
  write.csv(out1, "Na_filled.csv", row.names = F)
  return(out1)
setwd(codein)
}
#need to add in a function to deal with logical data types before fct_explicit