#!/bin/csh -f

# DO NOT RUN THIS FILE
# It's a cronjob that check if a repo has changed, and compile the PDF in case
#
# possible util: 	set gcheck = `git whatchanged -n 1 | grep "\t$d\/"`

set path = (/usr/local/bin /usr/bin /bin /usr/sbin /sbin /Library/TeX/texbin /opt/X11/bin /Library/Frameworks/Mono.framework/Versions/Current/Commands /Users/ungaro/myenv)
# echo $path

set detectors = (`ls | grep -v \.csh | grep -v \.sty | grep -v \.md | grep -v \.txt | grep -v \.log | grep -v template `)
echo $detectors

set currentDir = /opt/projects/clas12Nim
cd $currentDir

# chacking which detector was changed
rm -f pull.log
git pull > pull.log

rm -f detectorChanged.txt ; touch detectorChanged.txt
foreach d ($detectors)
	set gcheck = `cat pull.log | grep " $d\/"`
	if(`echo $gcheck` != "" || $1 == "all") then
		echo $d >> detectorChanged.txt
	endif
end

echo
set detChanged = `cat detectorChanged.txt`
echo "List of detector changed: "$detChanged
echo

if($1 != "" && $1 != "all") then
	set detChanged = $1
endif

foreach d ($detChanged)
	# make sure the style files are common
	cd $currentDir
	cp *.sty $d
	echo
	echo Detector: $d
	cd $currentDir/$d
	# chacking if repo has changed on the master. Using tab and det name, i.e. svt/
	rm -f compile.log
	/usr/local/bin/scons  > compile.log
	ls -lrt              >> compile.log
	scp $d.pdf ftp:/group/clas/www/clasweb/html/12gev/nims >> compile.log
	echo $d published
	scons -c             >> compile.log
end
