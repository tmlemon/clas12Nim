#!/bin/csh -f


set detectors = (svt mm ctof cnd htcc dc ltcc rich ftof ec ft beamline online hallb simulations offline magnets overview)
set currentDir = `pwd`


foreach d ($detectors)
	# make sure the style files are common
	cd $currentDir
	cp *.sty $d
	echo
	echo Detector: $d
	cd $currentDir/$d
	echo Compiling $d"..."
	scons
	scp $d.pdf ftp:/group/clas/www/clasweb/html/12gev/nims
	echo $d published
	scons -c
end
