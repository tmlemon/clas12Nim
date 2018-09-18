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
  
  1. click [this link](https://sourceforge.net/projects/scons/files/scons/2.5.1/scons-2.5.1.tar.gz/download) to start an automatic download of scons
  2. untar / unzip with tar -zxpvf scons-2.5.1.tar.gz, or double click the file from Finder
  3. install scons: run (sudo) python setup.py install

- on Mac you can use [Tex Studio](https://www.texstudio.org) instead of scons
- mac latex:  http://www.tug.org/mactex/. 
- linux latex: you may need to `sudo apt-get install texlive-publishers`

If you do not use scons, see the notes on bibliography below.


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

We use bibtex for references so we do not have to worry about sizes, capitalization, italic, etc. Everything is standardized and used by SPIRES.

How to do it: use SPIRES to look for the article then click the **BibTex** link. Copy and paste the result to the file bibfile.bib. 

It will look like this:

```
@article{Ungaro:2006df,
      author         = "Ungaro, M. and others",
      title          = "{Measurement of the N ---> Delta+(1232) transition at
                        high momentum transfer by pi0 electroproduction}",
      collaboration  = "CLAS",
      journal        = "Phys. Rev. Lett.",
      volume         = "97",
      year           = "2006",
      pages          = "112003",
      doi            = "10.1103/PhysRevLett.97.112003",
      eprint         = "hep-ex/0606042",
      archivePrefix  = "arXiv",
      primaryClass   = "hep-ex",
      reportNumber   = "JLAB-PHY-06-543",
      SLACcitation   = "%%CITATION = HEP-EX/0606042;%%"
}

```

**Note:** if you do not use scons, you have to take care of the bibliography items using latex. You have to run these commands. Notice that ```latex``` is ran *three times*. Assuming the detector name is *svt*:

1. latex svt
2. bibtex svt
3. latex svt
4. latex svt



