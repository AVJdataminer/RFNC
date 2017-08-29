calcenMM <- function(data,minX,maxX){
	ll <- length(data);
        data <- data[is.finite(data)]
	en<-0
	if(max(data)>min(data)){
		dd <- density(data,from=minX,to=maxX);
		ddy <- dd$y/sum(dd$y);
		ddyv <- which(ddy>0)
		en <- sum(ddy[ddyv]*log2(ddy[ddyv]))#/length(dd$y);
	}else{	
		en <- 0;
	}

	if(en=="NaN"){
	en <- 0
	}
	en <- abs(en)
        en
}
