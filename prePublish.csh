#!/bin/csh -f

# It's a cronjob that check if a repo has changed, and compile the PDF in case
#
# possible util: 	set gcheck = `git whatchanged -n 1 | grep "\t$d\/"`
#
# Crontab command for every 10 minutes compilation:
# #*/10 * * * * /opt/projects/clas12Nim/prePublish.csh >& ~/error.log
#
set path = (/usr/local/bin /usr/bin /bin /usr/sbin /sbin /Library/TeX/texbin /opt/X11/bin /Library/Frameworks/Mono.framework/Versions/Current/Commands /Users/ungaro/myenv)
set PYTHONPATH = /opt/jlab_software/2.3/scons_bm
# echo $path

set currentDir = /opt/projects/clas12Nim
cd $currentDir

set detectors = (`ls | grep -v \.csh | grep -v \.sty | grep -v \.md | grep -v \.txt | grep -v \.log | grep -v template `)
echo
echo All detectors: $detectors
echo

# chacking which detector was changed
# keeping all pulls log.
set nlogs = `ls pull_*.log | wc | awk '{print $1}'`
@ nlogs += 1
set newLog = pull_$nlogs".log"

rm -f $newLog
git pull > $newLog

rm -f detectorChanged.txt ; touch detectorChanged.txt
foreach d ($detectors)
	set gcheck = `cat $newLog | grep " $d\/"`
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
	cd $d
	rm -f compile.log
	echo                  > compile.log
	echo Detector: $d    >> compile.log
	echo                 >> compile.log
	echo Compiling with `which scons` >> compile.log
	echo                 >> compile.log
	scons                >> compile.log
	echo Result: `ls $d.pdf` >> compile.log
	ls -lrt              >> compile.log
	echo                 >> compile.log
	scp $d.pdf ftp.jlab.org:/group/clas/www/clasweb/html/12gev/nims >> compile.log
	echo $d published    >> compile.log
	scons -c             >> compile.log
	echo                 >> compile.log
	echo "Done. Check ~/error.log for cronjob errors."  >> compile.log
	echo                 >> compile.log

end
