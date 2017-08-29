#aggregate for simulating different pixel resolutions
 r <- raster(TTK) 
  r[ ] <- 1:ncell(r)
 ra <- aggregate(r, 10)

  }

#my.file.rename <- function(from, to) {
    todir <- dirname(to)
    if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
   (from = from,  to = to)
}

my.file.rename(from <- "~/filename=paste(files_I_want[i],"_","rrc.tif", sep="")",
               to <- "~/rrc/filename=paste(files_I_want[i],"_","rrc.tif", sep="")