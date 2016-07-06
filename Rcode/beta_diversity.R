### Part III: Beta diversity calculations (PCOA, NMDS, and pairwise measurements)

#### Anna M. Seekatz

# let's compare beta diversity using different types of distance matrices or analyses

# files used:
	# anaerobe_summary.txt (created in Part II)
	# anaerobe.final.summary_modified.txt
	# anaerobe_all.dist.txt
	
# files created:
	# anaerobe_all.dist.txt


# read in file from last exercise:
sums<-read.table(file="anaerobe_summary.txt", header=TRUE)

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



#######
#--
#######

# more beta diversity: pairwise comparisons

# during our data processing, we calculated a file that shows the pairwise differences between all sample comaprisons
	# this is the file that was used to calculate PCOA or NMDS comparisons
# let's take this file, and concentrate on only the pairwise differences we care about
	# in this case, let's compare the community similarity between no FMT and mFMT, per day
	
# files used:
	# anaerobe.final.summary_modified.txt 	#this is slightly modified
	# metadata.txt
	
# files created:
	# anaerobe_all.dist.txt		#this has pairwise measurements for all samples
	
# read in file:
pairwise.dist<-read.table(file="no_subsample/anaerobe.final.summary_modified.txt", header=TRUE)	
meta<-read.table(file="metadata.txt", header=TRUE)

# combine with meta data:
	# merge by 1st sample (s1)
m<-merge(meta, pairwise.dist, by.x=c("sampleID"), by.y=c("s1")) 		#this merges the data based on the sampleID/group1 match
colnames(m)[1:18] <- paste(colnames(m)[1:18], "s1", sep = "_")
	#add sample information for 2nd sample: ('s2'):
m2<-merge(meta, m, by.x=c("sampleID"), by.y=c("s2"))
colnames(m2)[1:18] <- paste(colnames(m2)[1:18], "s2", sep = "_")
#write.table(m2, file="anaerobe_all.dist.txt", sep="\t", quote=FALSE, col.names=TRUE, row.names=FALSE)

# now, let's only take pairwise comparisons where the day is the same between 2 samples:
pairs.byday<-m2[m2$day_s1==m2$day_s2, ]

# from these, let's concentrate only on differences between noFMT and mFMT:
p1<-pairs.byday[pairs.byday$FMT_s1==c("noFMT") & pairs.byday$FMT_s2==c("mFMT"), ]
p2<-pairs.byday[pairs.byday$FMT_s1==c("mFMT") & pairs.byday$FMT_s2==c("noFMT"), ]		#none in this one, but had to check
pairs.groups<-rbind(p1, p2)
#write.table(pairs.groups, file="anaerobe_daygroupcomp.dist.txt", sep="\t", quote=FALSE, col.names=TRUE, row.names=FALSE)

# now, let's graph by day:
plot<-boxplot(thetayc~day_s1, data=pairs.groups, ylab="thetayc", las=2, xlab="", xaxt="n", main="noFMT vs. mFMT, by day", ylim=c(0,1), col=c("chartreuse3", "lightpink", "magenta", "darkmagenta", "blue"))
text(x =  seq(1,5,by=1), y = par("usr")[3]-0.03, srt = 45, adj = 1, labels = c("d-7", "d1", "d4", "d11", "d19"), xpd = TRUE)

# let's also look at how each of the groups changes over time:
	# mFMT group:
mFMT<-m2[m2$FMT_s1==c("mFMT") & m2$FMT_s2==c("mFMT"), ]		# select only one group to compare
test<-mFMT[mFMT$sampleID_s1== mFMT$sampleID_s2, ]		# select only between the same mouse
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

# if you wanted to just look at it via bixplots:
plot<-boxplot(thetayc~TIME, data=mFMT.pairs, ylab="thetayc", las=2, xlab="", xaxt="n")
text(x =  seq(1,4,by=1), y = par("usr")[3]-0.03, srt = 45, adj = 1, labels = c("t1", "t2", "t3", "t4"), xpd = TRUE)
plot<-boxplot(thetayc~TIME, data=noFMT.pairs, ylab="thetayc", las=2, xlab="", xaxt="n")
text(x =  seq(1,4,by=1), y = par("usr")[3]-0.03, srt = 45, adj = 1, labels = c("t1", "t2", "t3", "t4"), xpd = TRUE)
