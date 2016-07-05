# Anaerobe Workshop

Hands-on portion of the 1-day Anaerobe microbiome workshop covered by **Dr. Laura Cox** (Harvard Medical School), **[Dr. Casey Theriot](https://theriotlab.org/)** (NC State College of Veterinary Medicine), and **Dr. Anna Seekatz** (University of Michigan Medical School)

**_Date:_** July 10, 2016

**_Description:_** This portion of the workshop will give you a brief introduction to looking at 16S rRNA data output. While we do not have time to go over how the sequencing data is processed, several free tools are available for data processing. The data we will use in this workshop have been processed using the software [mothur](http://www.mothur.org/). A full batch file of the commands used to process the data files used to produce the data in this workshop are described in the file mbatch_anaerobe.txt. Another software pipeline used to process 16S rRNA data is [QIIME](http://qiime.org/). We encourage you to check out the documentation and tutorials available for both as a first step in your data analysis. We will be looking at the files used to generate the following analyses and figures:

- Genus-level classification of the microbial community in each sample
- Alpha diversity within each community
- Beta diversity between communities

###Getting started

####R and RStudio

We will be using [R](https://www.r-project.org/) to re-generate some of these analyses. To interact with R easily, please make sure that you have downloaded [RStudio](https://www.rstudio.com/). 

**_Windows:_** Run and download R using [this .exe file](https://cran.r-project.org/bin/windows/base/release.htm) from [CRAN](https://cran.r-project.org/index.html). Download the RStudio IDE [here](https://www.rstudio.com/products/rstudio/download/).

**_Mac OS X:_** Install R using [this .pkg file](http://cran.r-project.org/bin/macosx/R-latest.pkg), and install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop).

**_Linux:_** The binary files for your distribution can be found at [CRAN](http://cran.r-project.org/index.html). You can also use your own package manager: for Debian/Ubuntu run ```sudo apt-get install r-base``` and for Fedora run ```sudo yum install R``` . The RStudio IDE can be found [here](https://www.rstudio.com/products/rstudio/download/). 

####Text Editor

While not required for this workshop, we recommend downloading some type of text editor to easily visualize your code. TextNano is a basic editor, and can be installed on Windows from the [Software Carpentry Windows Installer](https://github.com/swcarpentry/windows-installer/releases/download/v0.3/SWCarpentryInstaller.exe). Nano should be pre-installed on both Mac OS X and Linux. If you are using Mac OS X, you could also download [Text Wrangler](http://www.barebones.com/products/textwrangler/).

####Downloading the files

All of the files used in this exercise can be downloaded from this github directory. Use the __ to download all the files. 

#####Directory/file descriptions
- mothur-generated files
- data files modified in R
- code
- meta data
- figures

###Part I: Taxonomic classification

In our presentation, we discussed how sequences within your samples can be taxonomically classified based on the sequence identity (phylotyping). Depending on the level of classification, samples may appear more or less similar to each other. Let's take a look at some of the samples we have previously processed in mothur.

First, let's take a look at the file produced by mothur from the step in taxonomic classification. 









