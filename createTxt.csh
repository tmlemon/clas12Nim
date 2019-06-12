#!/bin/csh -f

rm -f test.txt ; cat *.tex | grep -v "\\includegraphics\[" | grep -v "\\begin" | grep -v "\\end"  > test.txt


open test.txt



