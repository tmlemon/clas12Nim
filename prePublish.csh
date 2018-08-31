#!/bin/csh -f

# DO NOT RUN THIS FILE

set detectors = (svt mm ctof cnd htcc dc ltcc rich ftof ec ft beamline online hallb simulations offline magnets clas12 slowcontrol)
set currentDir = /opt/projects/clas12Nim


foreach d ($detectors)
	# make sure the style files are common
	cd $currentDir
	cp *.sty $d
	echo
	echo Detector: $d
	cd $currentDir/$d
	# chacking if repo has changed on the master. Using tab and det name, i.e. svt/
	set gcheck = `git whatchanged -n 1 | grep "\t$d\/"`
	if(`echo $gcheck` == "") then
		echo No changes
	else
		echo $d needs update
		git pull
		echo Compiling $d"..."
		scons
		scp $d.pdf ftp:/group/clas/www/clasweb/html/12gev/nims
		echo $d published
		scons -c
	endif
end
