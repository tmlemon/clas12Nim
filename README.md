# clas12Nim

This repo contains a collection of clas12 detector NIM papers LATEX sources.
The changes are automatically compiled into PDFs files, collected [here](http://clasweb.jlab.org/12gev/nims/?C=M;O=D).

Project mailing list: <clas12nim@jlab.org>

Online Editing
--------------

You can edit individual tex files on your browser, for example by pasting some tex code. Upon committing, the PDF file will be produced within 10 minutes. However it is recommended to edit the files directly on your computer by cloning the repo, see below.


How to get the tex files and create a pdf
------------------------------------------

First, clone the repository: 

```git clone https://github.com/JeffersonLab/clas12Nim.git```

This will create a directory "clas12Nim". Inside that dir, change dir to your detector:

   `cd ftof`

To use scons to produce pdf:

   
   `scons` (if you have scons installed)


To use pdflatex directly (you can also use latex):

  `pdflatext ftof.tex`

(to make the references see the complete tex instructions below)

Alternatively (on an Apple computer with latex installed) you can use MacTex to open the main file, which has the same name as the system (for example: svt.tex for svt).



Spell Checking
------------

You can use the command aspell to check the spelling of tex files::

`aspell --mode=tex -c file.tex`



Keeping the repo up-to-date
---------------------------

If the repository is newer than your local version you will not be able to push your changes to it (you will get a log telling you to merge the new changes). 

Keeping the repo up to date is easy: 

`git pull`

This will open an editor with a merge message, which you don't need to edit. 
Just exit the editor: If it's "vi" type ```:q```. If it's "nano", type ```CTRL-x```

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


Pictures
--------

I suggest you add all the pictures in a "img" directory. To add to the repository:

`git add pictureFileName`

To include a picture "examplePic.png" use the following code:

```
\begin{figure}
	\centering
	\includegraphics[width=0.99\columnwidth,keepaspectratio]{img/ftGeometry.png}
	\caption{The three detectors in the FT geometry }
	\label{fig:ftGeometry}
\end{figure}
```


Pictures and tables across two columns
--------------------------------------

Some pictures or tables are too big to fit in one column. 

You can add a "*" at the end of the begin directive to span the picture or table across two columns.
For example:

```
\begin{figure*}
	\centering
	\includegraphics[width=0.99\columnwidth,keepaspectratio]{img/ftGeometry.png}
	\caption{The three detectors in the FT geometry }
	\label{fig:ftGeometry}
\end{figure*}
```


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



Compiling using scons, mactex, pdflatex
---------------------------------------

- scons (not necessary but does simplify things quite a bit). To install scons: 
  
  1. click [this link](https://sourceforge.net/projects/scons/files/scons/2.5.1/scons-2.5.1.tar.gz/download) to start an automatic download of scons
  2. untar / unzip with tar -zxpvf scons-2.5.1.tar.gz, or double click the file from Finder
  3. to install scons cd to the scons unpacked directory and type:
  
   `sudo python setup.py install`

- on Mac you can use [Tex Studio](https://www.texstudio.org) instead of scons
- mac latex:  http://www.tug.org/mactex/. 
- linux latex: you may need to `sudo apt-get install texlive-publishers`

If you do not use scons, see the notes on bibliography below.
**Bibtex Formatting Notes:** 

 - To capitalize a word use curly braces, for example ```{CLAS}```.
 - Use "and others" if you want "et al" to appear in the document.

**Note:** if you do not use scons, you have to take care of the bibliography items using latex. You have to run these commands. Notice that ```pdflatex``` is ran *three times*. Given your systemname (*svt*, *trigger*, etc):

1. pdflatex systemname
2. bibtex systemname
3. pdflatex systemname
4. pdflatex systemname



