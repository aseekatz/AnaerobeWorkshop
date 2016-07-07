### Part I:  Phylotyping, or taxonomic classification

#### Anna M. Seekatz

# files used:
	# anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.tax.summary
	# metadata.txt
	
# files created:
	# allhumos2_phylotype.txt (genus-level classification)
	# anaerobe_phyla1p.txt (top phyla)
	# anaerobe_phyla1p_w.meta.txt (top phyla with metadata)
	# anaerobe_genera1p.txt (top 99% genera)
	# anaerobe_genfrac1p_w.meta.txt (top 99% genera, with metadata)
	
library(plyr)

# read in mothur file
tax<-read.table(file="anaerobe.trim.contigs.good.unique.good.filter.unique.precluster.pick.rdp.wang.tax.summary", header=TRUE)

## phylum-level classification:

	# get phylum designations for level 6 (genera) rows:
tax2<-tax[which(tax$taxlevel==2), ]
tax2[, c("rankID", "taxon")]		# these are the phyla you have represented
	# rename the phyla to order it by a specific order
tax2$rankID<-gsub("^0.1.1$", "20_Euryarchaeota", tax2$rankID)
tax2$rankID<-gsub("^0.2.1$", "04_Actinobacteria", tax2$rankID)
tax2$rankID<-gsub("^0.2.2$", "11_Unclassified", tax2$rankID)
tax2$rankID<-gsub("^0.2.3$", "01_Bacteroidetes", tax2$rankID)
tax2$rankID<-gsub("^0.2.4$", "20_Candidatus_Saccharibacteria", tax2$rankID)
tax2$rankID<-gsub("^0.2.5$", "20_Cyanobacteria/Chloroplast", tax2$rankID)
tax2$rankID<-gsub("^0.2.6$", "02_Firmicutes", tax2$rankID)
tax2$rankID<-gsub("^0.2.7$", "06_Fusobacteria", tax2$rankID)
tax2$rankID<-gsub("^0.2.8$", "03_Proteobacteria", tax2$rankID)
tax2$rankID<-gsub("^0.2.9$", "08_Synergistetes", tax2$rankID)
tax2$rankID<-gsub("^0.2.10$", "07_Tenericutes", tax2$rankID)
tax2$rankID<-gsub("^0.2.11$", "05_Verrucomicrobia", tax2$rankID)
tax2<-tax2[order(tax2$rankID), ]			#orders by phyla
	# get relative abundance:
taxmatrix<-tax2[, c(6:ncol(tax2))]
rownames(taxmatrix)<-tax2$taxon
t.matrix<-as.data.frame(t(taxmatrix))
phylum.fr<-t.matrix/rowSums(t.matrix)*100
phyla.fr<-t(phylum.fr)
phyla1<- phyla.fr[rowSums(phyla.fr>=1)>=1,]		#top 1% of the phyla (7 left)
	# add a color scheme
color<-c("chartreuse3", "dodgerblue4", "yellow2", "red4", "hotpink", "cyan", "black")
xtra<-as.data.frame(cbind(rownames(phyla1), color))
colnames(xtra)[1]<-"phylum"
phyla<-cbind(xtra, phyla1)
#write.table(phyla, file="anaerobe_phyla1p.txt", sep="\t", quote=FALSE, col.names=TRUE, row.names=FALSE)

# now, let's add metadata and graph our results:
meta<-read.table(file="metadata.txt", header=TRUE)
phyla<-read.table(file="anaerobe_phyla1p.txt", header=TRUE, row.names=1)
	#genbar5<- genbar[rowSums(genbar[ ,3:ncol(genbar)]>=5)>=5,]
	rm_p<-subset(phyla, select =-c(color) )
	barp<-as.data.frame(t(rm_p))
		# add 'other' category
	barp$sampleID<-rownames(barp)
	#col.phy<-c(as.character(phyla$color), "grey47")
bar<-merge(meta, barp, by.x=c("seqID"), by.y=c("sampleID"))
#write.table(bar, 'anaerobe_phyla1p_w.meta.txt',quote=FALSE,sep="\t", col.names=TRUE, row.names=FALSE)

# create a bar graph of ALL samples:
	# order samples by day, cage:
bar<-bar[order(bar$day, bar$FMT, bar$mouse), ]
rownames(bar)<-bar$sampleID

col.phy<-c("chartreuse3", "dodgerblue4", "yellow2", "red4", "hotpink", "cyan", "black")
bar_p<-as.matrix(t(bar[19:ncol(bar)]))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_p, las=2, main="phylotype: phylum-level", ylab="Relative abundance-phyla (%)", cex.names=0.6, ylim=c(0,100), col=col.phy, xlim=c(0,90))
legend(85,100,legend=rownames(bar_p),col=col.phy,fill=col.phy,cex=0.5)

# let's also create an average bar plot per treatment group:
summary(bar$FMT)		# how many groups do we have?

means<-ddply(bar, c("FMT", "day"), colwise(mean, is.numeric))

barh<-as.data.frame(means[,7:ncol(means)])
rownames(barh)<-paste(means$FMT, means$day, sep="_")

# graph avg. per day/group:
bar_p<-as.matrix(t(barh))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_p, las=2, main="Mean community by day and group", ylab="Relative abundance-phyla (%)", cex.names=0.8, ylim=c(0,100), col=col.phy, xlim=c(0,15))
legend(15,100,legend=rownames(bar_p),col=col.phy,fill=col.phy,cex=0.5)


## genus-level classification:

tax6<-tax[which(tax$taxlevel==6), ]
tax6$rankID<-gsub("^0.1.1.*", "20_Euryarchaeota", tax6$rankID)
tax6$rankID<-gsub("^0.2.1\\..*", "04_Actinobacteria", tax6$rankID)
tax6$rankID<-gsub("^0.2.2\\..*", "11_Unclassified", tax6$rankID)
tax6$rankID<-gsub("^0.2.3\\..*", "01_Bacteroidetes", tax6$rankID)
tax6$rankID<-gsub("^0.2.4\\..*", "20_Candidatus_Saccharibacteria", tax6$rankID)
tax6$rankID<-gsub("^0.2.5..*", "20_Cyanobacteria/Chloroplast", tax6$rankID)
tax6$rankID<-gsub("^0.2.6..*", "02_Firmicutes", tax6$rankID)
tax6$rankID<-gsub("^0.2.7..*", "06_Fusobacteria", tax6$rankID)
tax6$rankID<-gsub("^0.2.8..*", "03_Proteobacteria", tax6$rankID)
tax6$rankID<-gsub("^0.2.9..*", "08_Synergistetes", tax6$rankID)
tax6$rankID<-gsub("^0.2.10..*", "07_Tenericutes", tax6$rankID)
tax6$rankID<-gsub("^0.2.11..*", "05_Verrucomicrobia", tax6$rankID)
colnames(tax6)[2]<-"phylum"
	# remove duplicated names:
subtax6<-subset(tax6, select=-c(taxlevel, daughterlevels))
subtax6<-subtax6[order(subtax6$phylum, -subtax6$total), ]
taxmatrix<-subtax6[, c(4:ncol(subtax6))]
duplicated(subtax6$taxon)			#identify any duplicated taxon names
	# make a matrix and convert to relative abundance
rownames(taxmatrix)<-subtax6$taxon
#genera<- taxmatrix[, colSums(taxmatrix)>5000,]
	# get rel. abund fraction:
genmatrix<-as.data.frame(t(taxmatrix))
genera.fr<-genmatrix/rowSums(genmatrix)*100
genus.fr<-t(genera.fr)
all.genera<-cbind(subtax6[1:3], genus.fr)
	# get top 1%:
phyla<-subtax6[1:3]
genus1<- genus.fr[rowSums(genus.fr>=1)>=1,]
namelist<-as.character(rownames(genus1))
phyla1p<-phyla[phyla$taxon %in% namelist, ]
	# ad a colorscheme:
color<-c("darkgreen", "green4", "green3", "chartreuse3", "greenyellow", "darkolivegreen2", 
		"midnightblue", "mediumblue", "blue3", "blue", "dodgerblue4", "dodgerblue1", "deepskyblue4", "deepskyblue1", "skyblue3", "skyblue", "steelblue4", "steelblue1", "royalblue4", "royalblue1", "slateblue4", "purple", 
		"yellow2", "darkgoldenrod3", "goldenrod2", "goldenrod1", "gold", 
		"maroon", "red4", "tomato3", 
		"hotpink", "cyan", "black")
genera1<-cbind(phyla1p, color, genus1)

#write.table(genera1, file="anaerobe_genera1p.txt", sep="\t", quote=FALSE, col.names=TRUE, row.names=FALSE)

# combine with metadata:
meta<-read.table(file="metadata.txt", header=TRUE)
genbar<-read.table(file="anaerobe_genera1p.txt", header=TRUE, row.names=2)
	#genbar5<- genbar[rowSums(genbar[ ,3:ncol(genbar)]>=5)>=5,]
	rm_g<-subset(genbar, select =-c(phylum, total, color) )
	barg<-as.data.frame(t(rm_g))
		# add 'other' category
	barg$other<-100-rowSums(barg)
	others<-100-colSums(barg)
	barg$sampleID<-rownames(barg)
	col.gen<-c(as.character(genbar$color), "grey47")
	#barg$sampleID<-gsub("X19_", "19_", barg$sampleID)
bar<-merge(meta, barg, by.x=c("seqID"), by.y=c("sampleID"))
#write.table(bar, 'anaerobe_genfrac1p_w.meta.txt',quote=FALSE,sep="\t", col.names=TRUE, row.names=FALSE)

# create a bar graph of ALL samples:
	# order samples by day, cage:
bar<-bar[order(bar$day, bar$FMT, bar$mouse), ]
rownames(bar)<-bar$sampleID
bar_g<-as.matrix(t(bar[19:ncol(bar)]))
par(mar=c(5,4,2,5))
par(xpd=T)
barplot(bar_g, las=2, main="phylotype", ylab="Relative abundance-genera (%)", cex.names=0.6, ylim=c(0,100), col=col.gen, xlim=c(0,90))
legend(85,110,legend=rownames(bar_g),col=col.gen,fill=col.gen,cex=0.5)

# pretty big...let's do some averages:
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

