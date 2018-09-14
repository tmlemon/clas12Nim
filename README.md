# clas12Nim

This repo contains a collection of clas12 detector NIM papers LATEX sources.
The changes are automatically compiled into PDFs files, collected [here](http://clasweb.jlab.org/12gev/nims/?C=M;O=D).

Project mailing list: <clas12nim@jlab.org>

Online Editing
--------------

You can edit individual tex files on your browser, for example by pasting some tex code. Upon committing, the PDF file will be produced within 10 minutes. However it is recommended to edit the files directly on your computer by cloning the repo, see below.


Pre-requisites to compile:
--------------------------

- scons (not necessary but does simplify things quite a bit). To install scons: 
  1. download [scons](https://sourceforge.net/projects/scons/files/scons/2.5.1/scons-2.5.1.tar.gz/download)
  2. untar / unzip with tar -zxpvf scons-2.5.1.tar.gz
  3. 

- on Mac you can also use [Tex Studio](https://www.texstudio.org) 
- mac latex:  http://www.tug.org/mactex/. 
- linux latex: you may need to `sudo apt-get install texlive-publishers`


How to get the tex files and create a pdf
------------------------------------------

First, clone the repository: 

```git clone https://github.com/JeffersonLab/clas12Nim.git```

This will create a directory "clas12Nim". Inside that dir, change dir to your detector and use scons to create the PDF:

- to create the PDF: ```scons```
- to clean:  ```scons -c```

Alternatively (on an Apple computer with latex installed) you can use MacTex to open the main file, which has the same name as the system (for example: svt.tex for svt).

What to edit
------------

These are the default files in each sub-directory. You can change this list in the main tex file (same name as the detector name, i.e. "svt.tex" inside "svt").

- `titleAndAuthors.tex`: include the titles, list of authors and their addresses
- `abstract.tex`: paper abstract 
- `overview.tex`: introduction and overview
- `requirements.tex`: system requirements
- `design.tex`: system design
- `hardware.tex`: hardware components and construction
- `electronics.tex`: electronics
- `readout.tex`: signal and readout
- `calibration.tex`: calibration software suite and results
- `reconstruction.tex`: reconstruction algorithms and results
- `simulation.tex`: simulation geometry, digitization, results
- `performance.tex`: detector performance
- `conclusionsAndAcknowledgement.tex`: paper conclusion and aknowledgements
- `bibfile.bib`: article in the bibliography


Keeping the repo up-to-date
---------------------------

You should make sure your copy of the repository is up-to-date. Do this often:

`git pull`

How to add or remove a file to the repository
---------------------------------------------

Use `add` or `rm` to add or remove files from the repo:

`git add filename`

or

`git rm filename`

When you check the status with `git pull` you will see an `A` for "added" and a `D` for "deleted" files.


How to commit changes to the repository
---------------------------------------

First, make sure you changed only the files relevant to your detector. You can find out which files you changed with the command

`git status`

To commit changes to a particular file, don't forget a nice comment:

`git commit filename -m"nice comment"`

To commit changes to all the files use the `-a` flag:

`git commit -a -m"nice comment"`


To push to the repository:

`git push`

This will upload your changes and trigger (within 10 minutes) the PDF file creation [here](http://clasweb.jlab.org/12gev/nims/?C=M;O=D).

Bibliography
------------

Collect the references in the file bibfile.bib. You can use SPIRES to look for the article and use the bibtex link to add the "official" format to bibfile.bib.

Note: only the articles that are mentioned in the text with `\cite` will appear in the references.

