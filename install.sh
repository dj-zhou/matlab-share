#!/bin/bash
# this file only support for MATLAB R2019a, and suppose it was installed to a default location

matlab_folder=/usr/local/MATLAB/R2019a

if [ -d $matlab_folder ] ; then
    sudo cp startup.m $matlab_folder/toolbox/local/
fi

