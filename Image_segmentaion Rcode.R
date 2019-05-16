##build an image classification for cars
#source("http://bioconductor.org/biocLite.R")
#biocLite("EBImage")
require(EBImage)
setwd("C:/Users/")
imgcol = readImage("p90081936.jpg")
display(imgcol)
logo_label = watershed(imgcol)
display( colorLabels(logo_label) )


require(shiny)
setwd("C:/Users/cra987/Dropbox/Data Projects/Vitamin D and Sunny time")
runApp('Vit_D')
