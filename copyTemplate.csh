#!/bin/csh -f


set sourceT     = template
set destination = (torus solenoid trigger)

set currentDir = `pwd`


# all commented out as the dirs are created
# DO NOT run this file uncommented
foreach d ($destination)
	cd $currentDir
	rm -rf $d
	cp -r $sourceT $d
	echo
	echo Detector: $d
	cd $currentDir/$d
	mv template.tex $d".tex"
	foreach f (`\ls *.tex`)
		sed -i '' -e "s/template/$d/g" $f
	end
	sed -i '' -e "s/template/$d/g" SConstruct
end
