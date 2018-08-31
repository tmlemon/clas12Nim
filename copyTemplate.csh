#!/bin/csh -f


set detectors = (mm ctof cnd htcc dc ltcc rich ftof ec ft beamline online hallb simulations offline magnets clas12 slowcontrol)
set currentDir = `pwd`


foreach d ($detectors)
	cd $currentDir
	rm -rf $d
	cp -r svt $d
	echo
	echo Detector: $d
	cd $currentDir/$d
	mv svt.tex $d".tex"
	foreach f (`\ls *.tex`)
		sed -i '' -e "s/svt/$d/g" $f
	end
	sed -i '' -e "s/svt/$d/g" SConstruct
end
