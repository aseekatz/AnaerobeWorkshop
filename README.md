# Anaerobe Workshop

Interactive portion of the 1-day Anaerobe microbiome workshop covered by **[Dr. Laura Cox](https://www.linkedin.com/in/lauriemcox)** (Harvard Medical School), **[Dr. Casey Theriot](https://theriotlab.org/)** (NC State University College of Veterinary Medicine), **[Dr. Anna Seekatz](https://www.clemson.edu/science/academics/departments/biosci/about/profiles/aseekat)** (Clemson University), and **Dr. Caroline Wasén** (Harvard Medical School).

**_Date:_** July 28, 2022 (updated from 2nd workshop on July 9, 2018)

**_Description:_** 

The goal of the interactive portion is to familiarize you with 16S rRNA gene-based analyses (i.e., microbiome analysis). Specifically, we will:
- discuss sequence data processing
- familiarize you with data output files
- interactively discuss/conduct microbiome analyses
	-  genus-level classification of the microbial community in each sample
	-  alpha diversity within each community
	-  beta diversity between communities
- introduce you to resources to learn microbiota analyses

After this course, you should be able to:
- know what to consider in microbiome study design
- generally know what different types of analyses / methods tell you about the microbiome
- know where to go for more resources to learn microbiome analyses

---

## Schedule:

8:30 – 9:00AM:  	   REGISTRATION / INSTALLATION SET-UP

9:00 – 9:15AM:   	   Introductions / Course overview

9:15 – 10:15AM: 	   Introduction to Microbiome Study Design (Laurie)

10:15 - 10:30AM:	   Integration of Culture-based Techniques into Microbiome Studies (Caroline)

10:30 - 10:45AM:	   BREAK / INSTALLATION SET-UP

10:45 - 12:00PM:	   Metabolomics 

12:00 – 1:00PM:  	   LUNCH

1:00 – 1:45PM:   	   Overview of Microbiome Approaches (data processing; analysis)

1:45 - 3:00PM:		   Interactive 16S rRNA gene-based analyses: Using R to analyze data

3:00 – 3:15PM:  	   BREAK

3:15 – 4:30PM:   	   Continued Data Analysis

4:30 – 5:00PM:  	   Wrap-up and Q&A

---

## Getting started

#### R and RStudio

We will be using [R](https://www.r-project.org/) and [RStudio](https://www.rstudio.com/) to re-generate common microbiota analyses based on an existing data set. You will need to install R before downloading RStudio.

These download directions are adapted from [Data Carpentry](https://datacarpentry.org/R-ecology-lesson/index.html), a great resource for learning R to conduct ecological analyses (more details listed at the bottom of this page).

To download R and RStudio:

**_Windows:_**
- Download R from the [CRAN website](https://cran.r-project.org/bin/windows/base/release.htm)
- Run the .exe file that was just downloaded

- Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
	- Under All Installers, download the RStudio Installer for Windows.
	- Double click the file to install it
	- Once it’s installed, open RStudio to make sure it works and you don’t get any error messages

**_MacOS:_**
- Download R from the [CRAN website](https://cran.r-project.org/bin/macosx/)
- Select the .pkg file for the latest R version
- Double click on the downloaded file to install R
- It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed by some packages)

- Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
	- Under All Installers, download the RStudio Installer for MacOS.
	- Double click the file to install RStudio
	- Once it’s installed, open RStudio to make sure it works and you don’t get any error messages

**_Linux:_**
- Follow the instructions for your system on the [CRAN website](https://cloud.r-project.org/bin/linux) and make sure you have at least R 3.3.1.
- Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
- Under All Installers, select the version that matches your distribution and install it with your preferred method (e.g., with Debian/Ubuntu sudo dpkg -i rstudio-YYYY.MM.X-ZZZ-amd64.deb at the terminal).
- Once it’s installed, open RStudio to make sure it works and you don’t get any error messages.

#### Text Editor

While not required for this workshop, we recommend downloading some type of text editor to easily visualize your code. [Sublime Text](https://www.sublimetext.com/) is a basic editor and can be installed on Windows or MacOS. Nano should be pre-installed on both Mac OS X and Linux. If you are using MacOS X, you could also download [BBEdit](https://www.barebones.com/products/bbedit/).

#### Downloading the files

All files used in this exercise can be downloaded from this github directory. Use the green 'Clone or Download' button on the topright to download all the files. 

##### Directory/file descriptions
- [mothur-generated files](https://github.com/aseekatz/AnaerobeWorkshop/tree/master/mothurfiles)
- [data files modified in R](https://github.com/aseekatz/AnaerobeWorkshop/tree/master/datafiles)
- [code](https://github.com/aseekatz/AnaerobeWorkshop/tree/master/Rcode)
- [metadata](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/metadata.txt)
- [figures](https://github.com/aseekatz/AnaerobeWorkshop/tree/master/figures)

#### Start the session

We will be using RStudio to interact with R to work with the data. RStudio is an Integrated Development Environment (IDE) program to use R, which is a programming language to analyze and visualize data. If you are not familiar with RStudio, a video tutorial on the different parts can be found [here](https://www.youtube.com/watch?v=I0qNSNt8Vmc). [Data Carpentry](https://datacarpentry.org/R-ecology-lesson/00-before-we-start.html#Knowing_your_way_around_RStudio) also has a great explanation on how to use RStudio.


Since we do not have enough time to comprehensively go through all steps of data processing, we have already created all of the files for you in the described directories above. The goal of this session is to introduce you to 16S data and get you comfortable with the type of data files you might receive after processing your data. Do not be scared! You should be able to copy/paste the commands as we go through them. At the end of the session, we will provide you with links to useful sites that you can explore on your own. Additionally, we hope that this exercise reinforces some of the concepts we discussed earlier in the workshop. 

To get started, fire up RStudio! The most important concept is getting you to the correct directory to run all of the commands. This is the folder that you created when you downloaded the file.

The main components of RStudio that we will be using are described below:
- **_Code:_** Any code that we will run, or notes that you take, can be viewed in different tabs in the topleft corner.
- **_Console:_** The bottomleft corner contains the console, where we will actually run the code
- **_Environment:_** Any objects you have created with your code will be listed here, in the topright corner
- **_Viewer:_** Available files, plots we create, and the help bar can be viewed in the bottomright corner

Before we start analyzing, let's organize our workspace into one location. In RStudio, this is via its "Projects" function. All of the commands we will do going forward will eminate from this working directory. Use the following steps to do so:
- Start RStudio
- Click on 'New Project' under the 'File' menu
- Choose 'New Directory', then 'Empty Project'
- Call this directory (folder) something meaningful to you, and place it in a convenient location. You will be working from this folder for this tutorial.
- Click on 'Create Project'
- **_Place the files you downloaded as part of this workshop in this folder._** In future steps, you will need to specify the relative path to the data files from this working directory
	- if you downloaded the AnaerobeWorkshop-master.zip folder, unzip this file, and move the following folders into your Project directory: Rcode, datafiles, figures, and mothurfiles)
	- this way, you can call out the same relative paths in this tutorial (example: mothurfiles/filename)

Let's also start a scripting file for you to save your work in. This will also be saved within your project directory (you will be copying/pasting into this script from the github instructions). Alternately, you can download this README.md file and save it in your project directory and open it:
**_Make your own R script:_**
- Click on the '+' file in the upper left hand corner of RStudio, and choose 'R script'
- Click 'save' under File, and save your .R file as something meaningful
	- now, anytime you save on this file, you will also save all comments/code, 

You will be working from this folder for this tutorial. With that, let's get started on looking at our data!

---

## Part I: Processing your sequence data

This section is meant to follow alongside the lecture on 16S rRNA gene-based sequence processing. While we will not be processing sequence data in real time, we want to:
- share some resources for you to explore on your own and 
- take a look at some of the data files that you will be working with 

### 1. Resources for processing and analyzing your data 

There are several open-source, free programs that you can use to process and analyze your data. The best news is that these resources also have great documentation to guide you! Many of the programs also incorporate the same tools that are widely used in analysis of microbial communities. The resources below are commonly used tools in 16S rRNA gene-based analyses:

- [mothur](http://www.mothur.org/) is a free, open-source software package developed by Dr. Patrick Schloss at the University of Michigan. Commonly used algorithms, bioinformatic tools, and community calculators are incorporated into mothur (and if it is missing, just email mothur to ask to add it!). You can follow a full MiSeq SOP [here](https://mothur.org/wiki/MiSeq_SOP). Dr. Schloss also teaches multiple 2-3 day workshops if you are interested in having a more hands-on tutorial that are based on his [Riffomonas](https://riffomonas.org/workshops/), which are free for you to use on your own. We will be using files processed in mothur for Part II of this workshop.
- [QIIME2](https://qiime2.org/) (which has succeeded QIIME) is a free, open-source bioinformatics platform initially developed by the Knight (University of California, San Diego) and Caporaso (Northern Arizona University) labs. QIIME2 has online documentation to get you started on processing and analyzing your data, with an easy user interface to quickly visualize data. [Workshops](https://workshops.qiime2.org/) (both online and in-person) are also available for you to learn how to use QIIME2.
- [DADA2](https://benjjneb.github.io/dada2/index.html) is another pipeline that can be used to process and analyze your data. As opposed to clustering your sequences into Operational Taxonomic Units (OTUs), a commonly used method in microbial community analysis to represent species-level composition, DADA2 produces Amplicon Sequence Variants (ASVs), producing a count of exact sequence matches of your data. [DADA2](https://benjjneb.github.io/dada2/tutorial.html) is easily implemented in R following their online tutorial.

We encourage you to check out the documentation and tutorials available to see which program fits your needs. For the purposes of this workshop, we will focus on using RStudio to analyze data files that were processed using mothur.

### 2. Processing your sequence data

Before you can tell what of microbiota your samples are hosting, you will need process the sequence and quality information from your raw fastq files. This includes filtering out erroneous / bad quality sequences, aligning your sequences to the 16S rRNA region of interest, clustering your sequences into OTUs, and taxonomically classifying sequences to get the sequence identity. Below is an example list of commands used in mothur (a mothur [batchfile](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/mbatch_anaerobe.txt), included in this directory) to do each of these steps before we start inquiring the data:

```
##mbatch for samples used in Anaerobe class
## 6.19.16

make.contigs(file=anaerobe.files, processors=8)
summary.seqs(fasta=anaerobe.trim.contigs.fasta, processors=8)
screen.seqs(fasta=anaerobe.trim.contigs.fasta, group=anaerobe.contigs.groups, maxambig=0, maxlength=275, processors=8)
unique.seqs(fasta=anaerobe.trim.contigs.good.fasta)
count.seqs(name=anaerobe.trim.contigs.good.names, group=anaerobe.contigs.good.groups)
summary.seqs(count=anaerobe.trim.contigs.good.count_table, processors=8)
pcr.seqs(fasta=silva.seed_v119.align, start=11894, end=25319, keepdots=F, processors=8)
system(mv silva.seed_v119.pcr.align silva.v4.fasta)
summary.seqs(fasta=silva.v4.fasta, processors=8)
align.seqs(fasta=anaerobe.trim.contigs.good.unique.fasta, reference=silva.v4.fasta, processors=8)
summary.seqs(fasta=anaerobe.trim.contigs.good.unique.align, count=anaerobe.trim.contigs.good.count_table, processors=8)
screen.seqs(fasta=anaerobe.trim.contigs.good.unique.align, count=anaerobe.trim.contigs.good.count_table, summary=anaerobe.trim.contigs.good.unique.summary, start=1968, end=11550, maxhomop=8, processors=8)
summary.seqs(fasta=current, count=current, processors=8)
filter.seqs(fasta=anaerobe.trim.contigs.good.unique.good.align, vertical=T, trump=., processors=8)
unique.seqs(fasta=anaerobe.trim.contigs.good.unique.good.filter.fasta, count=anaerobe.trim.contigs.good.good.count_table)
pre.cluster(fasta=anaerobe.trim.contigs.good.unique.good.filter.unique.fasta, count=anaerobe.trim.contigs.good.unique.good.filter.count_table, diffs=2, processors=8)
chimera.uchime(fasta=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.count_table, dereplicate=t, processors=8)
remove.seqs(fasta=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.fasta, accnos=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.denovo.uchime.accnos)
summary.seqs(fasta=current, count=current, processors=8)
classify.seqs(fasta=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.fasta, count=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.denovo.uchime.pick.count_table, reference=trainset10_082014.rdp.fasta, taxonomy=trainset10_082014.rdp.tax, cutoff=80)
remove.lineage(fasta=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.fasta, count=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.denovo.uchime.pick.count_table, taxonomy=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.taxonomy, taxon=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota)
count.seqs(name=current, group=current)
count.groups(count=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.denovo.uchime.pick.count_table)

#remove.groups(count=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.denovo.uchime.pick.count_table, fasta=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.fasta, taxonomy=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.pick.taxonomy, groups=)
	#if in the future you want to remove samples because they are too low (I usually cutoff any sample with < 1000 seqs), remember to modify the input files for the following commands
	 #weird errors with count_file--will just remove these groups later--let's see if previous files work
cluster.split(fasta=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.fasta, count=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.denovo.uchime.pick.count_table, taxonomy=anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.pick.taxonomy, splitmethod=classify, taxlevel=5, cutoff=0.15, processors=1)
system(mv anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.an.unique_list.list anaerobe.final.list)
system(mv anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.fasta anaerobe.final.fasta)
system(mv anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.pick.taxonomy anaerobe.final.taxonomy)
system(mv anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.denovo.uchime.pick.count_table anaerobe.final.count_table)

# for shared files:
count.groups(count=anaerobe.final.count_table)
make.shared(list=anaerobe.final.list, count=anaerobe.final.count_table, label=0.03)
classify.otu(list=anaerobe.final.list, count=anaerobe.final.count_table, taxonomy=anaerobe.final.taxonomy, label=0.03)
#remove.groups(count=anaerobe.final.count_table, fasta=anaerobe.final.fasta, taxonomy=anaerobe.final.taxonomy, list=anaerobe.final.list, shared=anaerobe.final.shared, groups=)

## no subsampling results:
dist.shared(shared=anaerobe.final.shared, calc=thetayc-jclass-jest-braycurtis)
pcoa(phylip=anaerobe.final.thetayc.0.03.lt.dist)
pcoa(phylip=anaerobe.final.jclass.0.03.lt.dist)
pcoa(phylip=anaerobe.final.jest.0.03.lt.dist)
pcoa(phylip=anaerobe.final.braycurtis.0.03.lt.dist)
nmds(phylip=anaerobe.final.thetayc.0.03.lt.dist, mindim=3, maxdim=3)
summary.shared(shared=anaerobe.final.shared, calc=sharedsobs-braycurtis-spearman-thetayc-jsd-sharednseqs)
summary.single(shared=anaerobe.final.shared, calc=simpsoneven-simpson-invsimpson-shannon-npshannon-sobs-chao-nseqs)

```

The accompanying lecture will discuss each of these steps in more detail. On your own time, you can also check out the mothur [MiSeq SOP](https://www.mothur.org/wiki/MiSeq_SOP) for a more detailed explanation of each of these steps. The basic steps we will discuss include:

- filtering sequences of inappropriate length, unaligned / ambiguous / homopolymeric / chimeric sequences
- aligning sequences to a 16S rRNA database, such as the following databases (note that mothur, QIIME2, and DADA2 have these databases incorporated into their pipelines for your convenience):
	- [SILVA](https://www.arb-silva.de/)
	- [Greengenes](http://greengenes.secondgenome.com/)
	- [RDP](https://rdp.cme.msu.edu/)
- classifying your sequences using one of the above databases
- clustering your sequences into OTUs, which represent a more species-level comparison (or, if using DADA2, creating ASVs)
- calculating different summary statistics (alpha or beta diversity)

Let's take a look at some of these files. If you have already downloaded this folder onto your computer, you can open up these files in excel or your favorite text file viewer. You can also view the files here (although the formatting will be a bit off):

- [anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.tax.summary](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.tax.summary) is an example of a table that includes the taxonomic classification (at different taxonomic levels) of your sequence data. This file was generated by directly classifying the sequences against a 16S rRNA sequence database (in this case, using RDP). Notice that the 'taxlevel' column indicates the classification at different taxonomic levels. For instance, if you wanted to grab all the sequences at the phylum level, you would grab all rows with a taxlevel=2. If you wanted to grab the genus-level classifications, you would grab the rows where taxlevel=6. In mothur, you can also change the parameters of this command to be more strict or lenient, depending on your needs. 
- [anaerobe.final.shared](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/anaerobe.final.shared) is an example of an OTU count table of the OTUs identified in this data set. Just like the phylotype file discussed above, these numbers represent raw counts of each OTU within each sample. Also notice that the numerical desgination of an OTU is arbitrary: if you analyze a different dataset, that dataset's OTU001 will not be the same as this dataset's OTU001. If you want to classify a representative OTU from each OTU cluster, you can do this in mothur as well, generating [this file](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/anaerobe.final.0.03.cons.taxonomy).
- you can use these two types of files (mainly the OTU count table) to generate different summary statistics:
	- [anaerobe.final.groups.summary](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/anaerobe.final.groups.summary) shows different alpha diversity calculations per sample. If you have a [metadata file](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/metadata.txt), you can generate plots to compare different sample types
	- [anaerobe.final.summary_modified.txt](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/anaerobe.final.summary_modified.txt) shows different beta diversity calculations. All of these values are pairwise calculations based on different similarity measures (i.e., Bray-Curtis, Yue & Clayton, Shannon-Jensen, etc), and give you a numerical value for how similar one sample is to another. 
	- Using the beta diversity calculations above, you can also directly calculate Principal Coordinates of Analysis ([PCoA](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/anaerobe.final.thetayc.0.03.lt.pcoa.axes)) or Nonmetric Dimensional Scaling ([NMDS](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/anaerobe.final.thetayc.0.03.lt.nmds.axes)) values to plot your samples against each other. These types of measurements are ways to visualize multidimensional data. 
	
For the second part of this tutorial, we will be using these files to generate plots to compare our samples. 

---

## Part II:

### 1. Taxonomic classification

We will be using a subset of sequence data generated from a mouse model of recurrent *Clostridium difficile* infection (CDI). The working data set contains sequences from samples collected at days -7, 1, 4, 11, and 19. The [metadata.txt](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/metadata.txt) file contains detailed information about each sample collected. Take a look at the figure illustrating the study design:

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/relapse_timeline.png)

> What types of questions can we ask using the data we have available?

Before we get started, let's think of a question or hypothesis to ask.

> Example Hypothesis: FMT increases the fecal microbiota diversity following recurrent CDI.

There are many questions and hypotheses that we can formulate. Look at the [metadata.txt](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/metadata.txt) file for more information. Feel free to come up with your own for this exercise!

In our presentation, we discussed how sequences within your samples can be taxonomically classified based on the sequence identity (phylotyping). Depending on the level of classification, samples may appear more or less similar to each other. Let's take a look at some of the samples we have previously processed in mothur. We will not be going over every part of the code, but a full description of the steps taken to create the files used here can be found in the [phylotyping.R](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/Rcode/phylotyping.R) file. 

First, let's take a look at the file produced by mothur from the step in taxonomic classification. You can do this by typing in the following commands in the console section of RStudio:
**_NOTE:_** if you want to save your code in the .R file we created earlier, copy/paste the commands in the grey boxes here into the .R file. You can run the code in your console by highlighting it and selecting 'Run', or copying it into the console again.

```
# read in mothur file
tax<-read.table(file="mothurfiles/anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.tax.summary", header=TRUE)
head(tax)     #this command shows the first 6 rows of the file (like a preview)
```

Note how the file looks. Alternatively, click on the 'tax' object in your environment.
> What does the file tell you at this point?
> Do you notice any anomalies?

You should notice that some of the rows look like repeats of themselves. This is because there are different taxlevels (i.e., phylum, family, genus, etc) included in this file. Let's look at the phylum-level classification first, taxlevel 2. 

```
tax2<-tax[which(tax$taxlevel==2), ]
tax2[, c("rankID", "taxon")]		# these are the phyla you have represented
```

Now, if you click on tax2, you should notice that it is a much smaller file. In fact, it is only 12 rows, one for each of the phyla found in the full data set.

> Can you compare these numbers for each sample in its current form? Why or why not?

There are a couple integral steps we need to take before we can make sense of this. We probably want to normalize the data somehow, eliminate some of the data based on a defined cutoff, and add sample information to the sampleIDs. The full code to do this can be viewed in the [phylotyping.R file](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/Rcode/phylotyping.R). To save some time, we have already created a [file](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/anaerobe_phyla1p_w.meta.txt) that has this information.

Copy/paste the following to view the file we are interested in:

```
bar<-read.table(file="datafiles/anaerobe_phyla1p_w.meta.txt", header=TRUE)
head(bar)
dim(bar)        # how big (dimensions) is your file?

str(bar)            # this is a command you can use to describe the type of data you have at hand
summary(bar$FMT)    # this will tell you how many samples you have in each variable
summary(as.factor(bar$day))

```

Take a look at the newly created file.
> What does this new file tell you that the old one did not?

> What kind of meta data is included in our files?

> Take a couple of minutes and look at the possible comparisons you could make based on this information.

Hopefully you see that this is a more informative file! Let's make a graph. Copy/paste the following in your console:

```
bar<-bar[order(bar$day, bar$FMT, bar$mouse), ]    #this orders your data file in a specific order
rownames(bar)<-bar$sampleID

# specify a color scheme for your graph:
col.phy<-c("chartreuse3", "dodgerblue4", "yellow2", "red4", "hotpink", "cyan", "black")

bar_p<-as.matrix(t(bar[19:ncol(bar)]))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_p, las=2, main="phylotype: phylum-level", ylab="Relative abundance-phyla (%)", cex.names=0.6, ylim=c(0,100), col=col.phy, xlim=c(0,90))
legend(85,100,legend=rownames(bar_p),col=col.phy,fill=col.phy,cex=0.5)
```

You should have a graph in your viewer that looks like the following:

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/phylum.png)

> Is this graph easy to interpret? What does it tell you?

The graph we just created shows the relative abundance at the phylum-level for each of the 77 samples in our dataset. To make it a bit easier to interpret, let's take a look at the average relative abundance of the phyla observed per treatment over time (days):

```
summary(bar$FMT)		# how many groups do we have?

install.packages("plyr")    #install the 'plyr' package
library(plyr)

means<-ddply(bar, c("FMT", "day"), colwise(mean, is.numeric))

barh<-as.data.frame(means[,7:ncol(means)])
rownames(barh)<-paste(means$FMT, means$day, sep="_")

# graph avg. per day/group:
bar_p<-as.matrix(t(barh))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_p, las=2, main="Mean community by day and group", ylab="Relative abundance-phyla (%)", cex.names=0.8, ylim=c(0,100), col=col.phy, xlim=c(0,15))
legend(15,100,legend=rownames(bar_p),col=col.phy,fill=col.phy,cex=0.5)

```

You should now have a graph that looks like this:

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/mean_phyla.png)

> Did this make the data more interpretable? What does the data tell us now?

Thus far, we have only looked at our data at the phylum level, which is fairly broad. Our original file created in mothur contains deeper taxonomic levels (taxlevel=6 is the genus-level). Let's take a look at the [genus-level](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/anaerobe_genfrac1p_w.meta.txt) breakdown of our data:

```
bar<-read.table(file="datafiles/anaerobe_genfrac1p_w.meta.txt", header=TRUE)

# specify a color scheme:
col.gen<-c("darkgreen", "green4", "green3", "chartreuse3", "greenyellow", "darkolivegreen2", 
		"midnightblue", "mediumblue", "blue3", "blue", "dodgerblue4", "dodgerblue1", "deepskyblue4", "deepskyblue1", "skyblue3", "skyblue", "steelblue4", "steelblue1", "royalblue4", "royalblue1", "slateblue4", "purple", 
		"yellow2", "darkgoldenrod3", "goldenrod2", "goldenrod1", "gold", 
		"maroon", "red4", "tomato3", 
		"hotpink", "cyan", "black", "grey47")

bar<-bar[order(bar$day, bar$FMT, bar$mouse), ]
rownames(bar)<-bar$sampleID
bar_g<-as.matrix(t(bar[19:ncol(bar)]))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_g, las=2, main="phylotype", ylab="Relative abundance-genera (%)", cex.names=0.6, ylim=c(0,100), col=col.gen, xlim=c(0,90))
legend(85,110,legend=rownames(bar_g),col=col.gen,fill=col.gen,cex=0.5)
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/phylotype.png)

> How does this information compare to the phylum-level graph?

Let's also simplify the data like we did for the phylum-level data:

```
summary(bar$FMT)		# how many groups do we have?

means<-ddply(bar, c("FMT", "day"), colwise(mean, is.numeric))

barh<-as.data.frame(means[,7:ncol(means)])
rownames(barh)<-paste(means$FMT, means$day, sep="_")

# graph avg. per day/group:
bar_g<-as.matrix(t(barh))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_g, las=2, main="Mean community by day and group", ylab="Relative abundance-genera (%)", cex.names=0.8, ylim=c(0,100), col=col.gen, xlim=c(0,15))
legend(13,100,legend=rownames(bar_g),col=col.gen,fill=col.gen,cex=0.5)
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/mean_phylotype.png)

> Compare this genus-level graph to the simplified phylum-level graph. Do they look the same?

### 2. Alpha diversity

We discussed alpha diversity earlier in the workshop as a measure of the diversity of a community or population within an ecosystem. Alpha diversity takes into consideration the richness (number of 'species') and the evenness of the community. There are many equations we can use to look at the alpha diversity within a microbial community. In this section, we will explore some of those measures, and how they differ. 

In mothur, we created several different files that describe the community (some of these fall into the beta diversity category, described in the third section of this part). Although we will be using a file already created for you, let's take alook at the format of some of the files created in mothur.

```
meta<-read.table(file="datafiles/metadata.txt", header=TRUE)
pcoa<-read.table(file="mothurfiles/anaerobe.final.thetayc.0.03.lt.pcoa.axes", header=TRUE)
nmds<-read.table(file="mothurfiles/anaerobe.final.thetayc.0.03.lt.nmds.axes", header=TRUE)
sums<-read.table(file="mothurfiles/anaerobe.final.groups.summary", header=TRUE)
shared<-read.table(file="mothurfiles/anaerobe.final.shared", header=TRUE)
taxonomy<-read.table(file="mothurfiles/anaerobe.final.0.03.cons.taxonomy", header=TRUE)
```

> What do each of these files tell you?
> What are these files missing?
> What is the difference between the phylotype file in the first exercise and the .shared file above?
> What does the 'taxonomy' file tell us?

We have combined some of these pieces of information for you below (the full code can be viewed in the file [alpha_diversity.R](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/Rcode/alpha_diversity.R)). Take a look at the combined [data file](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/anaerobe_summary.txt) below, and let's look at our first alpha diversity measure, the inverse Simpson index:

```
sums<-read.table(file="datafiles/anaerobe_summary.txt", header=TRUE)
summary(sums$FMT)
sums$FMT <- as.factor(sums$FMT)
	# R tries to assume the type of data your variables are. For the FMT variable in this case, we need to specify to R that it is a factor before graphing

#compare shannon, invsimpson, and sobs (# 'species')
	# comparison of FMT v. no FMT, as a whole:
plot(sums$FMT, sums$invsimpson_03)
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/invsimpson.png)

It looks like there are some differences in diversity between the noFMT and mFMT groups! However, let's take a closer look at the distribution of the data:

```
  # define a color function for the FMT variable:
group.col <- function(n) {
colorvec <- vector(mode="character", length=length(n))
for (i in 1:length(n)) {
colorvec[i] = "light grey"
if ( n[i] == "mFMT" ) {
colorvec[i] = "chartreuse3"
}
if ( n[i] == "noFMT" ) {
colorvec[i] = "gold"
}
}
c(colorvec)
}

  # plot the data:
plot(sums$FMT, sums$invsimpson_03, tck=-0.05, lwd=0.8, cex=1, cex.lab=0.8, cex.axis=0.8,
	pch=".", ylim=c(0,35), main="", ylab="inverse Simpson index", xlab="group")
points(invsimpson_03 ~ jitter(as.numeric(FMT, factor=0)), data=sums, pch=21, col="black", bg=group.col(sums$FMT), cex=1)
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/invsimpson2.png)

> What does the data tell us now?

Let's look at how the choice of diversity index impacts our data:

```
# now, let's compare different types of alpha diversity:
par(mfrow=c(1,3))			# this makes a 3 graph setup
	# inverse simpson:
plot(sums$FMT, sums$invsimpson_03, tck=-0.05, lwd=0.8, cex=1, cex.lab=0.8, cex.axis=0.8,
	pch=".", ylim=c(0,35), main="", ylab="inverse Simpson index", xlab="group")
points(invsimpson_03 ~ jitter(as.numeric(FMT, factor=0)), data=sums, pch=21, col="black", bg=group.col(sums$FMT), cex=1)
	# shannon:
plot(sums$FMT, sums$shannon_03, tck=-0.05, lwd=0.8, cex=1, cex.lab=0.8, cex.axis=0.8,
	pch=".", ylim=c(0,5), main="", ylab="Shannon diversity index", xlab="group")
points(shannon_03 ~ jitter(as.numeric(FMT, factor=0)), data=sums, pch=21, col="black", bg=group.col(sums$FMT), cex=1)
	# sobs
plot(sums$FMT, sums$sobs_03, tck=-0.05, lwd=0.8, cex=1, cex.lab=0.8, cex.axis=0.8,
	pch=".", ylim=c(0,350), main="", ylab="sobs (est. # OTUs)", xlab="group")
points(sobs_03 ~ jitter(as.numeric(FMT, factor=0)), data=sums, pch=21, col="black", bg=group.col(sums$FMT), cex=1)
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/alpha_diversity.png)

> Are there differences in the group comparisons based on the choice of alpha diversity?

For some of the diversity comparisons, it looks like we have both high and low diversity samples within one of the treatment groups. Let's take a look at the differences between the groups over time (days):

```
# we see that there is a variable distribution of points--let's consider days in our equation
boxplots.double = boxplot(invsimpson_03~FMT + day, data = sums, at = c(1, 2, 4, 5, 7, 8, 10, 11, 13, 14), xaxt='n', col = c('chartreuse3', 'gold'), ylab="inverse Simpson index")
axis(side=1, at=c(1.5, 4.5, 7.5, 10.5, 13.5), labels=c('-7', '1', '4', '11', '19'), line=0.5, lwd=0)
legend("topleft", c("noFMT", "mFMT"), col=c("gold", "chartreuse3"), cex=0.8, pch=15)
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/alphadiv_overtime.png)

> What does the data look like now? 

> Does diversity tell us about community membership or similarity to each other at all?

#### 3. Beta diversity

Alpha diversity is a useful measure of comparison to calculate the species richness within a community. However, just because two communities have similar diversities does not mean that the same types of community members are shared between those communities. Beta diversity describes the similarity between communities, generally using pairwise comparisons across the data set.

In part II, we combined some of this information by calculating the Principal Coordinates Analysis (PCOA) and Non-metric Dimensional Scaling (NMDS) axes. Briefly, both of these multi-dimensional ordination analyses take the calculated pairwise distances, and flatten them into a 2D axis we can view. PCOA will generate as many axes as you have samples, with each consecutive axis contributing less. The loadings file shows the % variance explained by each axis. NMDS collapses all of the information (i.e., considers all of the OTUs or species differences between the samples) into an ordination you can visualize, using rank-order. 

Let's compare how PCOA and NMDS differ using the same distance calculator, the Yue and Clayton theta measure of dissimilarity (theta yc). Copy/paste the following commands, taking a look at the [files](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/anaerobe_summary.txt) and figure generated:

```
# read in file from last exercise:
sums<-read.table(file="datafiles/anaerobe_summary.txt", header=TRUE)

# color scheme:
group.col <- function(n) {
colorvec <- vector(mode="character", length=length(n))
for (i in 1:length(n)) {
colorvec[i] = "light grey"
if ( n[i] == "mFMT" ) {
colorvec[i] = "chartreuse3"
}
if ( n[i] == "noFMT" ) {
colorvec[i] = "gold"
}
}
c(colorvec)
}

# PCOA vs. NMDS
par(mfrow=c(2,3))
	# PCOA axes:
	#plot(tyc_pcoa_axis2 ~ tyc_pcoa_axis1, data=sums, col=group.col(sums$FMT), pch=type.pch(fecal$ComboGrp), cex=1.2, xlab="PCoA 1 (27.2%)", ylab="PCoA 2 (19.5%)", main="")
plot(tyc_pcoa_axis2 ~ tyc_pcoa_axis1, data=sums, col="black", bg=group.col(sums$FMT), cex=1.2, xlab="PCoA 1 (27.2%)", ylab="PCoA 2 (19.5%)", main="", pch=21)
plot(tyc_pcoa_axis3 ~ tyc_pcoa_axis1, data=sums, col="black", bg=group.col(sums$FMT), cex=1.2, xlab="PCoA 1 (27.2%)", ylab="PCoA 3 (10.5%)", main="", pch=21)
legend("topleft",legend=c("noFMT", "mFMT"), col="black", pt.bg=c("gold", "chartreuse3"), cex=1, pch=21)
plot(tyc_pcoa_axis3 ~ tyc_pcoa_axis2, data=sums, col="black", bg=group.col(sums$FMT), cex=1.2, xlab="PCoA 2 (19.5%)", ylab="PCoA 3 (10.5%)", main="", pch=21)
	# NMDS
plot(tyc_nmds_axis2 ~ tyc_nmds_axis1, data=sums, col="black", bg=group.col(sums$FMT), cex=1.2, xlab="nmds 1", ylab="nmds 2", main="", pch=21)
plot(tyc_nmds_axis3 ~ tyc_nmds_axis1, data=sums, col="black", bg=group.col(sums$FMT), cex=1.2, xlab="nmds 1", ylab="nmds 3", main="", pch=21)
legend("topleft",legend=c("noFMT", "mFMT"), col="black", pt.bg=c("gold", "chartreuse3"), cex=1, pch=21)
plot(tyc_nmds_axis3 ~ tyc_nmds_axis2, data=sums, col="black", bg=group.col(sums$FMT), cex=1.2, xlab="nmds 2", ylab="nmds 3", main="", pch=21)
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/beta_pcoa.v.nmds2.png)

> What information is available in the data file?
> How do the two ordinations differ from each other? Do they tell you the same story?

Both of the ordinations show a potential for differences between the samples. Let's also consider the day in our analyses. We need to add some additional meta data information to visualize by both group and day. In addition to this, we have also included the PCOA calculations from other types of commonly distance metrics: the Bray-Curtis similarity coefficient, the Jaccard similarity coefficient (based on species richness), and the Jaccard similarity coefficient based on the Chao1 estimated richness.

```
# let's also put some information about the days
	# color/point schemes:
type.pch <- function(n) {
pchvec <- vector(mode="numeric", length=length(n))
for (i in 1:length(n)) {
pchvec[i] = 1
if ( n[i] == "noFMT" ) {
pchvec[i] = 19
}
if (n[i] == "mFMT" ) {
pchvec[i] = 17
}
}
c(pchvec)
}

group2.col <- function(n) {
colorvec <- vector(mode="character", length=length(n))
for (i in 1:length(n)) {
colorvec[i] = "light grey"
if ( n[i] == -7 ) {
colorvec[i] = "chartreuse3"
}
if ( n[i] == 1 ) {
colorvec[i] = "lightpink"
}
if ( n[i] == 4 ) {
colorvec[i] = "magenta"
}
if ( n[i] == 11 ) {
colorvec[i] = "darkmagenta"
}
if ( n[i] == 19 ) {
colorvec[i] = "blue"
}
}
c(colorvec)
}
sums$day<-as.factor(sums$day)

par(mfrow=c(2,3))
	# PCOA axes:
	#plot(tyc_pcoa_axis2 ~ tyc_pcoa_axis1, data=sums, col=group.col(sums$FMT), pch=type.pch(sums$FMT), cex=1.2, xlab="PCoA 1 (27.2%)", ylab="PCoA 2 (19.5%)", main="")
plot(tyc_pcoa_axis2 ~ tyc_pcoa_axis1, data=sums, col=group2.col(sums$day), pch=type.pch(as.character(sums$FMT)), cex=1.2, xlab="PCoA 1 (27.2%)", ylab="PCoA 2 (19.5%)", main="")
plot(tyc_pcoa_axis3 ~ tyc_pcoa_axis1, data=sums, col=group2.col(sums$day), pch=type.pch(sums$FMT), cex=1.2, xlab="PCoA 1 (27.2%)", ylab="PCoA 3 (10.5%)", main="")
	legend("topleft",legend=c("noFMT", "mFMT"), col="black", cex=1, pch=c(19, 17))
	legend("bottomleft",legend=c("d-7", "d1", "d4", "d11", "d19"), col=c("chartreuse3", "lightpink", "magenta", "darkmagenta", "blue"), cex=1, pch=19)
plot(tyc_pcoa_axis3 ~ tyc_pcoa_axis2, data=sums, col=group2.col(sums$day), pch=type.pch(sums$FMT), cex=1.2, xlab="PCoA 2 (19.5%)", ylab="PCoA 3 (10.5%)", main="")
	# NMDS
plot(tyc_nmds_axis2 ~ tyc_nmds_axis1, data=sums, col=group2.col(sums$day), pch=type.pch(sums$FMT), cex=1.2, xlab="nmds 1", ylab="nmds 2", main="")
plot(tyc_nmds_axis3 ~ tyc_nmds_axis1, data=sums, col=group2.col(sums$day), pch=type.pch(sums$FMT), cex=1.2, xlab="nmds 1", ylab="nmds 3", main="")
	legend("topleft",legend=c("noFMT", "mFMT"), col="black", cex=1, pch=c(19, 17))
	legend("bottomleft",legend=c("d-7", "d1", "d4", "d11", "d19"), col=c("chartreuse3", "lightpink", "magenta", "darkmagenta", "blue"), cex=1, pch=19)
plot(tyc_nmds_axis3 ~ tyc_nmds_axis2, data=sums, col=group2.col(sums$day), pch=type.pch(sums$FMT), cex=1.2, xlab="nmds 2", ylab="nmds 3", main="")

## let's also compare different types of distance metrics (using PCOA, first axes only):
par(mfrow=c(2,2))
plot(tyc_pcoa_axis2 ~ tyc_pcoa_axis1, data=sums, col=group2.col(sums$day), pch=type.pch(as.character(sums$FMT)), cex=1.2, xlab="Theta-yc: PCoA 1", ylab="Theta-yc: PCoA 2", main="")
plot(bc_pcoa_axis2 ~ bc_pcoa_axis1, data=sums, col=group2.col(sums$day), pch=type.pch(as.character(sums$FMT)), cex=1.2, xlab="Bray-Curtis: PCoA 1", ylab="Bray-Curtis: PCoA 2", main="")
plot(jac_pcoa_axis2 ~ jac_pcoa_axis1, data=sums, col=group2.col(sums$day), pch=type.pch(as.character(sums$FMT)), cex=1.2, xlab="Jaccard: PCoA 1", ylab="Jaccard: PCoA 2", main="")
plot(jest_pcoa_axis2 ~ jest_pcoa_axis1, data=sums, col=group2.col(sums$day), pch=type.pch(as.character(sums$FMT)), cex=1.2, xlab="Jaccard w/ Chao Est.: PCoA 1", ylab="Jaccard w/ Chao Est.: PCoA 2", main="")
	legend("topright",legend=c("noFMT", "mFMT"), col="black", cex=0.8, pch=c(19, 17))
	legend("bottomright",legend=c("d-7", "d1", "d4", "d11", "d19"), col=c("chartreuse3", "lightpink", "magenta", "darkmagenta", "blue"), cex=0.8, pch=19)
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/beta_diff.distances.png)

> Does the type of distance metric used give you a different answer?
> What are some of the main differences between these calculators?

Ordination is one way to visualize potential similarities within a data set. We can also directly compare the pairwise distances. In mothur, we calculated a distance matrix of pairwise similarities using different types of distance metrics. Take a look at the (modified) [file](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/mothurfiles/anaerobe.final.summary_modified.txt) generated in mothur:

```
pairwise.dist<-read.table(file="mothurfiles/anaerobe.final.summary_modified.txt", header=TRUE)
pcoa.loadings<-read.table(file="mothurfiles/anaerobe.final.thetayc.0.03.lt.pcoa.loadings", header=TRUE)
head(pairwise.dist)
```

> What information is displayed in this file?

Let's do a couple comparisons between the groups. We have previously created this file for you, but you can view the full code to create this file in the beta_diversity.R file. Read in the following [file](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/datafiles/anaerobe_all.dist.txt), and let's parse out the comparisons we want:

```
m2<-read.table(file="datafiles/anaerobe_all.dist.txt", header=TRUE)

# now, let's only take pairwise comparisons where the day is the same between 2 samples:
pairs.byday<-m2[m2$day_s1==m2$day_s2, ]

# from these, let's concentrate only on differences between noFMT and mFMT:
p1<-pairs.byday[pairs.byday$FMT_s1==c("noFMT") & pairs.byday$FMT_s2==c("mFMT"), ]
p2<-pairs.byday[pairs.byday$FMT_s1==c("mFMT") & pairs.byday$FMT_s2==c("noFMT"), ]		#none in this one, but had to check
pairs.groups<-rbind(p1, p2)

# now, let's graph by day:
plot<-boxplot(thetayc~day_s1, data=pairs.groups, ylab="thetayc", las=2, xlab="", xaxt="n", main="noFMT vs. mFMT, by day", ylim=c(0,1), col=c("chartreuse3", "lightpink", "magenta", "darkmagenta", "blue"))
text(x =  seq(1,5,by=1), y = par("usr")[3]-0.03, srt = 45, adj = 1, labels = c("d-7", "d1", "d4", "d11", "d19"), xpd = TRUE)

```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/beta_pairwise.groups.png)

> What does this graph display?

> What comparisons are being made?

The graph above measures the similarity between each of the groups on each particular day. Another way to look at the data is to compare changes within the group over time, and whether one group appears to be changing more than the other. Let's make that comparison:

```
# let's also look at how each of the groups changes over time:
	# mFMT group:
mFMT<-m2[m2$FMT_s1==c("mFMT") & m2$FMT_s2==c("mFMT"), ]		# select only one group to compare
	# must do this for each time comparison:
t1A<-mFMT[mFMT$day_s1==c("-7") & mFMT$day_s2==c("1"), ]
t1B<-mFMT[mFMT$day_s1==c("1") & mFMT$day_s2==c("-7"), ]
t1<-rbind(t1A, t1B)
t1$TIME<-1
t2A<-mFMT[mFMT$day_s1==c("4") & mFMT$day_s2==c("1"), ]
t2B<-mFMT[mFMT$day_s1==c("1") & mFMT$day_s2==c("4"), ]
t2<-rbind(t2A, t2B)
t2$TIME<-2
t3A<-mFMT[mFMT$day_s1==c("4") & mFMT$day_s2==c("11"), ]
t3B<-mFMT[mFMT$day_s1==c("11") & mFMT$day_s2==c("4"), ]
t3<-rbind(t3A, t3B)
t3$TIME<-3
t4A<-mFMT[mFMT$day_s1==c("19") & mFMT$day_s2==c("11"), ]
t4B<-mFMT[mFMT$day_s1==c("11") & mFMT$day_s2==c("19"), ]
t4<-rbind(t4A, t4B)
t4$TIME<-4
mFMT.pairs<-rbind(t1, t2, t3, t4)

	# noFMT group:
noFMT<-m2[m2$FMT_s1==c("noFMT") & m2$FMT_s2==c("noFMT"), ]
t1A<-noFMT[noFMT$day_s1==c("-7") & noFMT$day_s2==c("1"), ]
t1B<-noFMT[noFMT$day_s1==c("1") & noFMT$day_s2==c("-7"), ]
t1<-rbind(t1A, t1B)
t1$TIME<-1
t2A<-noFMT[noFMT$day_s1==c("4") & noFMT$day_s2==c("1"), ]
t2B<-noFMT[noFMT$day_s1==c("1") & noFMT$day_s2==c("4"), ]
t2<-rbind(t2A, t2B)
t2$TIME<-2
t3A<-noFMT[noFMT$day_s1==c("4") & noFMT$day_s2==c("11"), ]
t3B<-noFMT[noFMT$day_s1==c("11") & noFMT$day_s2==c("4"), ]
t3<-rbind(t3A, t3B)
t3$TIME<-3
t4A<-noFMT[noFMT$day_s1==c("19") & noFMT$day_s2==c("11"), ]
t4B<-noFMT[noFMT$day_s1==c("11") & noFMT$day_s2==c("19"), ]
t4<-rbind(t4A, t4B)
t4$TIME<-4
noFMT.pairs<-rbind(t1, t2, t3, t4)

# now, graph these over time:
	# make mean distance over time:
library(plyr)
	# for noFMT group:
no.data <- ddply(noFMT.pairs, c("TIME"), summarise,
               N    = length(thetayc),
               mean = mean(thetayc),
               sd   = sd(thetayc),
               se   = sd / sqrt(N) )

no.ave<-as.numeric(no.data$mean)
no.sd<-as.numeric(no.data$sd)

	# for mFMT group:
m.data <- ddply(mFMT.pairs, c("TIME"), summarise,
               N    = length(thetayc),
               mean = mean(thetayc),
               sd   = sd(thetayc),
               se   = sd / sqrt(N) )

m.ave<-as.numeric(m.data$mean)
m.sd<-as.numeric(m.data$sd)

# now, graph it:
x<-no.data$TIME														
plot(x, no.ave,
    ylim=c(0, 1.2), xlim=c(0.75, 4.5),
    pch=21, xlab="consecutive days", ylab="Mean change over time",
    main="change over time (thetayc)", xaxt='n', col="black", bg="gold")
lines(x, no.ave, col="gold")	
lines(x+0.25, m.ave, col="chartreuse4")	
points(x+0.25, m.ave, bg="chartreuse3", col="black", pch=21)
arrows(x, no.ave-no.sd, x, no.ave+no.sd, length=0.05, angle=90, code=3, col="gold")	#adds sd to the graph
arrows(x+0.25, m.ave-m.sd, x+0.25, m.ave+m.sd, length=0.05, angle=90, code=3, col="chartreuse3")
axis(1, at=x+0.125, labels=c("d-7 to d1", "d1 to d4", "d4 to d11", "d11 to d19"))												#adds labels to the graph
```

![alt tag](https://github.com/aseekatz/AnaerobeWorkshop/blob/master/figures/beta_pairwise.overtime.png)

> How does this information differ from the first pairwise comparison?

As you can see, there are many ways to make pairwise comparisons. When you are analyzing your data, think about your main question, and how that can best be answered. Of course, for some of us, data exploration is a way of life. We encourage you to explore your data in many ways--each of these 'experiments' can give you a different piece of information that can be useful in guiding you to the next big question. 

### 4. Conclusions

Some last questions to consider:
> What type of information did each of these analyses provide?

> How did these analyses differ from each other?

> Based on the data, would you reject or accept the hypothesis we originally formulated?

We hope that this short exercise gave you a better understanding of how microbiome data is interpreted and handled. If this was overwhelming, do not be intimidated! Learning how to process this data can be a long journey, but there are multiple free online tutorials and courses. Programming is not only useful for 16S rRNA analysis, but for any large -omics datasets.

#####Helpful websites:
- **[Software Carpentry](http://software-carpentry.org/)** provides free workshops and tutorials around the world. While they do host onsite workshops, many of them can be accessed live online. Check them out!
- **[Coursera](https://www.coursera.org/)** offers multiple online courses on data analysis and programming, such as learning R or Python. 
- [Dr. Patrick Schloss](http://www.schlosslab.org/) at the University of Michigan offers in-person workshops on both **[mothur and R](http://www.mothur.org/wiki/Workshops)**. If you are planning on using mothur, this course is particularly helpful in understanding your data.
















