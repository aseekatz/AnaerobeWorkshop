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
- **_Viewer:_** Available files, plots we create, and the help bar can be viewed in the bottomright corner

With that, let's get started on looking at our data!

###Part I: Taxonomic classification

In our presentation, we discussed how sequences within your samples can be taxonomically classified based on the sequence identity (phylotyping). Depending on the level of classification, samples may appear more or less similar to each other. Let's take a look at some of the samples we have previously processed in mothur. We will not be going over every part of the code, but a full description of the steps taken to create the files used here can be found in the phylotyping.R file. 

First, let's take a look at the file produced by mothur from the step in taxonomic classification. You can do this by typing in the following commands in the console section of RStudio:

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

There are a couple integral steps we need to take before we can make sense of this. We probably want to normalize the data somehow, eliminate some of the data based on a defined cutoff, and add sample information to the sampleIDs. The full code to do this can be viewed in the phylotyping.R file. To save some time, we have already created a file that has this information.

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

bar_p<-as.matrix(t(bar[19:ncol(bar)]))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_p, las=2, main="phylotype: phylum-level", ylab="Relative abundance-phyla (%)", cex.names=0.6, ylim=c(0,100), col=col.phy, xlim=c(0,90))
legend(85,100,legend=rownames(bar_p),col=col.phy,fill=col.phy,cex=0.5)
```

You should have a graph in your viewer that looks like the following:

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

> Did this make the data more interpretable? What does the data tell us now?

Thus far, we have only looked at our data at the phylum level, which is fairly broad. Our original file created in mothur contains deeper taxonomic levels (taxlevel=6 is the genus-level). Let's take a look at the genus-level breakdown of our data:

```
bar<-read.table(file="datafiles/anaerobe_genfrac1p_w.meta.txt", header=TRUE)

bar<-bar[order(bar$day, bar$FMT, bar$mouse), ]
rownames(bar)<-bar$sampleID
bar_g<-as.matrix(t(bar[19:ncol(bar)]))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_g, las=2, main="phylotype", ylab="Relative abundance-genera (%)", cex.names=0.6, ylim=c(0,100), col=col.gen, xlim=c(0,90))
legend(85,110,legend=rownames(bar_g),col=col.gen,fill=col.gen,cex=0.5)
```

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

> Compare this genus-level graph to the simplified phylum-level graph. Do they look the same?

###Part II: Alpha diversity

We discussed alpha diversity earlier in the workshop as a measure of the diversity of a community or population within an ecosystem. Alpha diversity takes into consideration the richness (number of 'species') and the evenness of the community. There are many equations we can use to look at the alpha diversity within a microbial community. In this section, we will explore some of those measures, and how they differ. 

In mothur, we created several different files that describe the community (some of these fall into the beta diversity category, described in Part III). Although we will be using a file already created for you, let's take alook at the format of some of the files created in mothur.

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

We have combined some of these pieces of information for you below. Take a look at the combined data file below, and let's look at our first alpha diversity measure, the inverse Simpson index:

```
sums<-read.table(file="anaerobe_summary.txt", header=TRUE)
summary(sums$FMT)
#compare shannon, invsimpson, and sobs (# 'species')
	# comparison of FMT v. no FMT, as a whole:
plot(sums$FMT, sums$invsimpson_03)
```

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

> Are there differences in the group comparisons based on the choice of alpha diversity?

For some of the 












