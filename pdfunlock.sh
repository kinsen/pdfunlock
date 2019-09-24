#!/bin/bash

if [[ -z $1 ]];then
  echo "You should input one parameter"
elif [[ ! -f "$1" ]]; then
  echo "path $1 not found."
elif [[ "$1" != *.pdf ]]; then
  echo "only except pdf."
else
	ABSPATH=$(realpath "$1")
	DIR=$(dirname "${ABSPATH}")
	FILENAME=$(basename "$1")
	OUTPUT="${DIR}/${FILENAME//.pdf/_unlock.pdf}"

	echo "OUTPUT -> ${OUTPUT}"

	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="${OUTPUT}" -c .setpdfwrite -f "${ABSPATH}"

	echo "DONE"

fi
