#used to execute code at R startup
#read more at https://rstats.wtf/r-startup.html
#
# Sys.setenv(PROJECT_DIR = "/projects/petar/fgf1/")
#necessary to set the renv directory for your project

options(renv.config.autoloader.enabled = FALSE)
# renv::load(Sys.getenv("PROJECT_DIR"))
#
# if on hogg, load default profile. otherwise, ygg
if (grepl("cbmrcomp01fl", Sys.info()['nodename'], fixed=TRUE)){
    renv::activate(project = Sys.getenv("PROJECT_DIR"),
                   profile = NULL)
} else {
    renv::activate(project = Sys.getenv("PROJECT_DIR"),
                   profile = "ygg") # make a conda based on this one and work with it on ygg
}
#use qs to save obj
#targets::tar_option_set(format = "qs")
#imports the Rprofile from your user dir
#source('~/.Rprofile')
