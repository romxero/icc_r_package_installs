#!/bin/bash

#lets test this installation right here 

#make directory
mkdir -p $HOME/.R/

#backup file 
mv $HOME/.R/Makevars $HOME/.R/Makevars_$(date +%F_%H_%M_%S)_bak

#touch a file
touch $HOME/.R/Makevars

#purge modules
ml purge

#load the modules
ml load system devel viz cmake x11 mesa java/11.0.11 netcdf/4.4.1.1 openmpi/4.1.2 R/4.1.2 icc/2019 ifort/2019

#create the file 
cat << EOF > $HOME/.R/Makevars
CXX11=$(which icpc)
CC=$(which icc)
CXX=$(which icpc)
CFLAGS=-std=gnu99
CXXFLAGS=-std=gnu++11
EOF

 

#Clean installation.. remove the directory
rm -rf R/x86_64-pc-linux-gnu-library/4.1/

# now load R, and install:

#pkgToInstall <- c("ggplot2", "tidyverse", "fields", "raster", "graphics", "ggpubr", "RColorBrewer", "colorRamps", "geosphere") 

#install.packages(pkgToInstall, repos='http://cran.us.r-project.org', Ncpus=4)
