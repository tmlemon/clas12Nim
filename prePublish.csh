#!/bin/csh -f

# It's a cronjob that check if a repo has changed, and compile the PDF in case
#
# possible util: 	set gcheck = `git whatchanged -n 1 | grep "\t$d\/"`
#
# Crontab command for every 10 minutes compilation:
# #*/10 * * * * /opt/projects/clas12Nim/prePublish.csh >& ~/error.log
#
set path = (/usr/local/bin /usr/bin /bin /usr/sbin /sbin /Library/TeX/texbin /opt/X11/bin /Library/Frameworks/Mono.framework/Versions/Current/Commands /Users/ungaro/myenv)

set currentDir = /opt/projects/clas12Nim
cd $currentDir

set detectors = (`ls | grep -v \.csh | grep -v \.sty | grep -v \.md | grep -v \.txt | grep -v \.log | grep -v template `)
echo
echo All detectors: $detectors

set newLog = pull.log

# keeping all pulls log.
set nlogs = 0
if ( -f pull_1.log) then

	set nlogs = `ls pull_*.log | wc | awk '{print $1}'`
	@ nlogs += 1
endif
# uncomment to activate history
# set newLog = pull_$nlogs".log"

rm -f $newLog
git pull > $newLog

# chacking which detector was changed
rm -f detectorChanged.txt ; touch detectorChanged.txt
foreach d ($detectors)
	set gcheck = `cat $newLog | grep " $d\/"`
	if(`echo $gcheck` != "" || $1 == "all") then
		echo $d >> detectorChanged.txt
	endif
end

set detChanged = `cat detectorChanged.txt`

if($1 != "" && $1 != "all") then
	set detChanged = $1
endif

echo
echo "List of detector to publish: "$detChanged
echo


foreach d ($detChanged)
	cd $currentDir
	cd $d
	rm -f compile.log
	echo                  > compile.log
	echo Detector: $d    >> compile.log
	echo                 >> compile.log
	set toPublish = $d".pdf"
	if ($d != "magnets") then
		# make sure the style files are common
		cp ../*.sty .
		echo Compiling with `which scons` >> compile.log
		echo                              >> compile.log
		scons
		echo To Publish: $toPublish       >> compile.log
		ls -lrt                           >> compile.log
		echo                              >> compile.log
	endif
	if ($d == "dc") then
		set toPublish = dc12_nim.pdf
	else if ($d == "beamline") then
		set toPublish = beamline_nim.pdf
	else if ($d == "ftof") then
		set toPublish = ftof-nim.pdf
	else if ($d == "ctof") then
		set toPublish = ctof-nim.pdf
	else if ($d == "rich") then
		set toPublish = nima-rich.pdf
	endif
	scp $toPublish ftp.jlab.org:/group/clas/www/clasweb/html/12gev/nims
	echo $d published    >> compile.log
	echo                 >> compile.log
	echo "Done. Check ~/error.log for cronjob errors."  >> compile.log
	echo                 >> compile.log
	if ($d != "magnets") then
		scons -c
	endif

end
