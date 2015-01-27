#!/usr/bin/env bash

# http://bower.io/docs/creating-packages/

######################################################################
## define
######################################################################
_sMyFile=${0}
_sCommand=${1}
_sProjectName=${2}
_sPackageLevel=${3}  # default/web

####################################################################
# define
####################################################################
_PREFIX_MESSAGE=[${_sMyFile}]
_WORKING_DIR=/c/projects/openalpr
_OPENALPR_ROOT=${PWD}
_TESSERACT_ROOT=${_OPENALPR_ROOT}/maketrain/tesseract
_MAKEOCR_ROOT=${_OPENALPR_ROOT}/maketrain/train_ocr

####################################################################
# export
####################################################################
#export OPENCV_ROOT=${_OPENALPR_ROOT}/maketrain/opencv_2.4.9/x64


####################################################################
# setp3_train_ocr
####################################################################
create_project()
{
	bower init
	
	if [ ${_sPackageLevel} = "default" ]; then
	  bower install jquery
		bower install jquery-ui
	elif [ ${_sPackageLevel} = "web" ]; then
	  
	else 
	  echo "${_PREFIX_MESSAGE} not support package level [${_sPackageLevel}]"
		exit 1
	fi 
}

####################################################################
# BUILD
####################################################################
main()
{
  cd ./${_sProjectName}
	
	if [ ${_sCmdName} = "-h" ]; then
    "${_PREFIX_MESSAGE} ./${_sMyFile}.sh _sLangName _sMyDataPath"
	elif [ ${_sCmdName} = "create" ]; then
    create_project
	else 
    echo "${_PREFIX_MESSAGE} not support command [${_sCommand}]"
	fi

	exit 1
}

main