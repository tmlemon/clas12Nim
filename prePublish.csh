#!/bin/csh -f


set detectors = (svt)
set currentDir = `pwd`

foreach d ($detectors)
	echo
	echo Detector: $d
	cd $currentDir/$d
	echo Compiling $d"..."
	scons
	scp $d.pdf ftp:/group/clas/www/clasweb/html/12gev/nims
	echo $d published
end
