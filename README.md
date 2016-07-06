# Anaerobe Workshop

Hands-on portion of the 1-day Anaerobe microbiome workshop covered by **Dr. Laura Cox** (Harvard Medical School), **[Dr. Casey Theriot](https://theriotlab.org/)** (NC State University College of Veterinary Medicine), and **Dr. Anna Seekatz** (University of Michigan Medical School).

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

####Start the session

We will be using RStudio to interact with R to work with the data. Since we do not have enough time to comprehensively go through all of the steps, we have already created all of the files for you in the described directories above. The goal of this session is to introduce you to 16S data and get you comfortable with the type of data files you might receive after processing your data. Do not be scared! At the end of the session, we will provide you with links to useful sites that you can explore on your own. You should be able to copy/paste the commands as we go through them. Additionally, we hope that this exercise reinforces some of the concepts we discussed earlier in the workshop. 

To get started, fire up RStudio! The most important concept is getting you to the correct directory to run all of the commands. This is the folder that you created when you downlaoded the file.

```
setwd("~/Box Sync/Meetings/Anaerobe2016/workshop")
# make sure that this path is set to your own!
```

If this does not work, you can navigate to where you downloaded the necessary files under the 'Files' tab  in the righthand panel in RStudio, then set the directory using Session > Set Working Directory > Choose directory at the top of RStudio. This should automatically bring up the command above.

If you are not familiar with RStudio, a video tutorial on the different parts can be found [here](https://www.youtube.com/watch?v=I0qNSNt8Vmc). The main components we will be using are described below:
- **_Code:_** Any code that we will run, or notes that you take, can be viewed in different tabs in the topleft corner.
- **_Console:_** The bottomleft corner contains the console, where we will actually run the code
- **_Environment:_** Any objects you have created with your code will be listed here, in the topright corner
- **_Viewr:_** Available files, plots we create, and the help bar can be viewed in the bottomright corner





###Part I: Taxonomic classification

In our presentation, we discussed how sequences within your samples can be taxonomically classified based on the sequence identity (phylotyping). Depending on the level of classification, samples may appear more or less similar to each other. Let's take a look at some of the samples we have previously processed in mothur.

First, let's take a look at the file produced by mothur from the step in taxonomic classification. You can do this by typing in the following command, taking care to change the directory based on your own path:











