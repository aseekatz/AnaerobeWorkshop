### Part II:  Alpha diversity calculations

#### Anna M. Seekatz

# combine the files we have made previously in mothur:
	# anaerobe.final.groups.summary	
	# anaerobe.final.jclass.0.03.lt.pcoa.axes
	# anaerobe.final.jest.0.03.lt.pcoa.axes
	# anaerobe.final.braycurtis.0.03.lt.pcoa.axes
	# anaerobe.final.thetayc.0.03.lt.pcoa.axes
	# anaerobe.final.thetayc.0.03.lt.nmds.axes
	
# files created:
	# anaerobe_summary.txt

# we will compare some measures done in mothur
		
# read in files and merge together:
meta<-read.table(file="metadata.txt", header=TRUE)
pcoa<-read.table(file="no_subsample/anaerobe.final.thetayc.0.03.lt.pcoa.axes", header=TRUE)
	pcoa<-pcoa[,1:4]
	colnames(pcoa)[2:4] <- paste("tyc_pcoa", colnames(pcoa)[2:4], sep = "_")
	colnames(pcoa)[1]<-"sampleID"
pcoa2<-read.table(file="no_subsample/anaerobe.final.braycurtis.0.03.lt.pcoa.axes", header=TRUE)
	pcoa2<-pcoa2[,1:4]
	colnames(pcoa2)[2:4] <- paste("bc_pcoa", colnames(pcoa2)[2:4], sep = "_")
	colnames(pcoa2)[1]<-"sampleID"
pcoa3<-read.table(file="no_subsample/anaerobe.final.jclass.0.03.lt.pcoa.axes", header=TRUE)
	pcoa3<-pcoa3[,1:4]
	colnames(pcoa3)[2:4] <- paste("jac_pcoa", colnames(pcoa3)[2:4], sep = "_")
	colnames(pcoa3)[1]<-"sampleID"
pcoa4<-read.table(file="no_subsample/anaerobe.final.jest.0.03.lt.pcoa.axes", header=TRUE)
	pcoa4<-pcoa4[,1:4]
	colnames(pcoa4)[2:4] <- paste("jest_pcoa", colnames(pcoa4)[2:4], sep = "_")
	colnames(pcoa4)[1]<-"sampleID"
nmds<-read.table(file="no_subsample/anaerobe.final.thetayc.0.03.lt.nmds.axes", header=TRUE)
	nmds<-nmds[1:4]
	colnames(nmds)[2:4] <- paste("tyc_nmds", colnames(nmds)[2:4], sep = "_")
	colnames(nmds)[1]<-"sampleID"
sums<-read.table(file="no_subsample/anaerobe.final.groups.summary", header=TRUE)
	sums<-subset(sums, select=-c(label))
	colnames(sums)[2:16] <- paste(colnames(sums)[2:16], "03", sep = "_")
	colnames(sums)[1]<-"sampleID"
	
# now, combine all the files together:
combined.pcoa<-merge(meta, pcoa, by.x=c("seqID"), by.y=c("sampleID"))
combined.pcoa2<-merge(combined.pcoa, pcoa2, by.x=c("seqID"), by.y=c("sampleID"))
combined.pcoa3<-merge(combined.pcoa2, pcoa3, by.x=c("seqID"), by.y=c("sampleID"))
combined.pcoa4<-merge(combined.pcoa3, pcoa4, by.x=c("seqID"), by.y=c("sampleID"))
combined.nmds<-merge(combined.pcoa4, nmds, by.x=c("seqID"), by.y=c("sampleID"))
combined.sum<-merge(combined.nmds, sums, by.x=c("seqID"), by.y=c("sampleID"))
#write.table(combined.sum, 'anaerobe_summary.txt', quote=FALSE,sep="\t", col.names=TRUE, row.names=FALSE)

## let's look at diversity first (alpha diversity):

sums<-read.table(file="anaerobe_summary.txt", header=TRUE)
summary(sums$FMT)
#compare shannon, invsimpson, and sobs (# 'species')
	# comparison of FMT v. no FMT, as a whole:
plot(sums$FMT, sums$invsimpson_03)			# definitely some differences!
	# prettier plots:
plot(sums$FMT, sums$invsimpson_03, tck=-0.05, lwd=0.8, cex=1, cex.lab=0.8, cex.axis=0.8,
	pch=".", ylim=c(0,35), col=c("chartreuse3", "gold"), 
	main="", ylab="inverse Simpson index", xlab="group")
	# or:
# gives a color vector by a variable:
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
plot(sums$FMT, sums$invsimpson_03, tck=-0.05, lwd=0.8, cex=1, cex.lab=0.8, cex.axis=0.8,
	pch=".", ylim=c(0,35), main="", ylab="inverse Simpson index", xlab="group")
points(invsimpson_03 ~ jitter(as.numeric(FMT, factor=0)), data=sums, pch=21, col="black", bg=group.col(sums$FMT), cex=1)

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

# we see that there is a variable distribution of points--let's consider days in our equation
boxplots.double = boxplot(invsimpson_03~FMT + day, data = sums, at = c(1, 2, 4, 5, 7, 8, 10, 11, 13, 14), xaxt='n', col = c('chartreuse3', 'gold'), ylab="inverse Simpson index")
axis(side=1, at=c(1.5, 4.5, 7.5, 10.5, 13.5), labels=c('-7', '1', '4', '11', '19'), line=0.5, lwd=0)
legend("topleft", c("noFMT", "mFMT"), col=c("gold", "chartreuse3"), cex=0.8, pch=15)

