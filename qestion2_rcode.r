ra=read.table("D:/Revidly/namebasics/data.tsv")

namebasics=read.table(file = 'D:/Revidly/namebasics/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleakas=read.table(file = 'D:/Revidly/title.akas/data.tsv', sep = '\t', header = TRUE , fill=TRUE)

titlebasics=read.table(file = 'D:/Revidly/title.basics/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titlecrew=read.table(file = 'D:/Revidly/title.crew/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleepisode=read.table(file = 'D:/Revidly/title.episode/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleprincipals=read.table(file = 'D:/Revidly/title.principals/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleratings=read.table(file = 'D:/Revidly/title.ratings/data2.tsv', sep = '\t', header = TRUE , fill=FALSE)
head(titleprincipals)
principals=subset(titleprincipals, select = c("tconst","nconst"))

head(titleratings)
head(titleprincipals)
head(titlebasics,n=1)
table(namebasics$primaryProfession)


merge1=merge(titleratings,titlecrew,by="tconst")
merge11 <- merge1
head(merge1)
merge2=select(merge1,-writers)
merge3=select(merge2,-numVotes)
head(merge3)
merge=merge(merge3,principals,by="tconst")
head(merge)
merge$actordirector= paste(merge$directors,merge$nconst,sep="_")
merge12 <- merge
head(merge12)
head(titlecrew)
library(dplyr)
principalsfinal=principals %>% filter(!grepl('\\N',principals$nconst))
principalsfinal <- principals
head(merge3)
?grepl
genre_votes %>% nrow()
table2=merge %>% group_by(actordirector) %>% summarise(n=n(), mean(averageRating))

head(table2)

table3 <- table2[order(-table2$`sum(numVotes)`),]
table4= head(table3, n= 25)
head(table4,n=1)
plot(table4$genres,table4$`sum(numVotes)`, cex=3, pch=23)

test=read.table(file = 'D:/Revidly/TEST.tsv', sep = '\t', header = TRUE , flush=FALSE, blank.lines.skip = FALSE, strip.white = TRUE, allowEscapes = TRUE,skipNul = FALSE)
head(test)
merge12[- grep("\\N_",merge12$actordirector)]
head(merge12)
table3=merge12 %>% group_by(actordirector) %>% summarise(n=n(), mean(averageRating))
head(table3)
max(table3$`mean(averageRating)`)

table4 <- table3[order(-table3$`mean(averageRating)`),]

table4 %>% order_by(table4$`mean(averageRating)`,)
save(table4)
?save
max(table4$n)
b=a[!(is.na(a$Name) | a$Name==""), ]
a$pass <- paste(a$Name,a$Area, sep="_")
