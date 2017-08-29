#ftp.root <- "http://www.wcc.nrcs.usda.gov/ftpref/data/snow/snotel/cards/montana/"
#dropbox.root <- "/Users/aidenjohnson/dropbox/TCEF_Stoy"

#=====================================================================
#   Function that downloads files from URL
#=====================================================================

fdownload <- function(sourcelink) { 

  targetlink <- paste(dropbox.root, substr(sourcelink, nchar(ftp.root)+1, 
nchar(sourcelink)), sep = '')

  # list of contents
  filenames <- getURL(sourcelink, ftp.use.epsv = FALSE, dirlistonly = TRUE)
  filenames <- strsplit(filenames, "\n")
  filenames <- unlist(filenames)

  files <- filenames[grep('\\.', filenames)]  
  dirs <- setdiff(filenames, files)
  if (length(dirs) != 0) {
    dirs <- paste(sourcelink, dirs, '/', sep = '')
  }  

  # files
  for (filename in files) {

    sourcefile <- paste(sourcelink, filename, sep = '')
    targetfile <- paste(targetlink, filename, sep = '')

    download.file(sourcefile, targetfile)
  }
 # subfolders
  for (dirname in dirs) {

    fdownload(dirname)
  }
}
