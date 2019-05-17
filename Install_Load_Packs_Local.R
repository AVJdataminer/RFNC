Install_Load_packs<-function(local_repo){
  
  # List of packages for session
  .packages = c("ggplot2","shiny","shinythemes","dygraphs","lubridate","xts",
                "caret","dplyr","plotly","RColorBrewer","partykit","tidyverse","purrr")
  
  # Install CRAN packages (if not already installed)
  .inst <- .packages %in% installed.packages()
  if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst], repos = local_repo , Dependencies = True)
  
  # Load packages into session 
  lapply(.packages, require, character.only=TRUE)
  
}

#Install_Load_packs("N:/Apps/miniCRAN/src/contrib/")
