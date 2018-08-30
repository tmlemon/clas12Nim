#!/bin/csh -f


set detectors = (svt)
set currentDir = `pwd`


foreach d ($detectors)
	# make sure the style files are common
	cp *.sty $d
	echo
	echo Detector: $d
	cd $currentDir/$d
	echo Compiling $d"..."
	scons
	scp $d.pdf ftp:/group/clas/www/clasweb/html/12gev/nims
	echo $d published
end
