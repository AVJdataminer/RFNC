Calc_T<-function(nomin){
  for (n in nomin){
    setwd(filepath<-file.path(paste(home,"/", n, sep="")))
    
    pdata<-read.csv(list.files(path=".",pattern = ".csv"))
    pdata=pdata[which(pdata$FinalTotal > 1000),]
    
    Id =1:nrow(pdata)
    YY=as.numeric(substring(pdata$YYYY_MM, 1,4))
    MM=as.numeric(substring(pdata$YYYY_MM, 6,7))
    Date = as.POSIXct(pdata$T4.Sale.Date,format="%m/%d/%Y")
    
    
    SP.FV.Ratio=pdata$SalePrice/pdata$FinalTotal
    vis_ratio=data.frame(Id,SP.FV.Ratio,Date)
    names(vis_ratio)
    MMm=aggregate(vis_ratio,by=list(MM, YY), FUN=mean)
    numd=as.numeric(paste(MMm$Group.2,".",MMm$Group.1, sep =""))
    
    h1=ggplot(MMm,  aes(x=numd, y=SP.FV.Ratio)) +geom_line(color="red")+stat_smooth()
    print(h1)
    return(h1)
  }}

#     range(numd)
#     N=length(Id)
#     ##equation for R-squared
#     y=MMm$SP.FV.Ratio
#     x=numd
#     df=data.frame(x,y)
#     lm_eqn = function(df){
#       m = lm(y ~ x, df);
#       eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
#                        list(a = format(coef(m)[1], digits = 2), 
#                             b = format(coef(m)[2], digits = 2), 
#                             r2 = format(summary(m)$r.squared, digits = 3)))
#       as.character(as.expression(eq)); 
#       
#     }
#     
#     p1 = h1 + geom_text(aes(x = 2005, y = 1.7, label = lm_eqn(df)), parse = TRUE)+
#       labs(title="Ratio of Sale Price to Final Value in Valley County 1995-2015 by Months")+
#       geom_hline(yintercept =1)+
#       ylim(-1.0, 2.5)+scale_size_area() + 
#       ylab("Sale Price to Final Value Ratio") +
#       xlab("Date") 
#     
#     print(p1)
#     return(p1)
#     
#   }
# }
