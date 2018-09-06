#!/bin/csh -f

# DO NOT RUN THIS FILE
# It's a cronjob that check if a repo has changed, and compile the PDF in case
#
# possible util: 	set gcheck = `git whatchanged -n 1 | grep "\t$d\/"`


set detectors = (svt mm ctof cnd htcc dc ltcc rich ftof ec ft beamline online hallb simulations offline magnets clas12 slowcontrol cvt)
set currentDir = /opt/projects/clas12Nim

git pull


# chacking which detector was changed
cd $currentDir
rm -f detectorChanged.txt ; touch detectorChanged.txt
foreach d ($detectors)
	set gcheck = `git whatchanged -n 1 | grep "\t$d\/"`
	if(`echo $gcheck` != "") then
		echo $d >> detectorChanged.txt
	endif
end

echo
set detChanged = `cat detectorChanged.txt`
echo "List of detector changed: "$detChanged

foreach d ($detChanged)
	# make sure the style files are common
	cd $currentDir
	cp *.sty $d
	echo
	echo Detector: $d
	cd $currentDir/$d
	# chacking if repo has changed on the master. Using tab and det name, i.e. svt/
	echo Compiling $d"..."
	/usr/local/bin/scons
	scp $d.pdf ftp:/group/clas/www/clasweb/html/12gev/nims
	echo $d published
	scons -c
end
