a=read.table("D:/Revidly/namebasics/data.tsv")

namebasics=read.table(file = 'D:/Revidly/namebasics/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleakas=read.table(file = 'D:/Revidly/title.akas/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)

titlebasics=read.table(file = 'D:/Revidly/title.basics/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titlecrew=read.table(file = 'D:/Revidly/title.crew/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleepisode=read.table(file = 'D:/Revidly/title.episode/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleprincipals=read.table(file = 'D:/Revidly/title.principals/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleratings=read.table(file = 'D:/Revidly/title.ratings/data2.tsv', sep = '\t', header = TRUE , fill=FALSE)
head(titleakas)
head(titlecrew)
library(dplyr)
titleakas=select(titleakas,-ordering, -title,-attributes,- isOriginalTitle)
titleakas=titleakas[!(is.na(titleakas$language) | titleakas$language=="" | titleakas$language=="\\N"),]
titlecrew=titlecrew[!(is.na(titlecrew$writers) | titlecrew$writers=="" | titlecrew$writers=="\\N" | titlecrew$directors=="" | titlecrew$directors=="\\N"),]
merge1 = merge(titleakas,titlecrew,by="tconst")
titleakas %>% rename(tconst == titleId)
colnames(titleakas) <- c("tconst","region","lang","types")
names(titleakas$titleId) <- paste("tconst")
head(merge1)
head(titleakas)
head(titleprincipals)
titleprincipals=select(titleprincipals,-ordering,-category,-job,-characters)
merge2= merge(merge1,titleprincipals,by="tconst")
head(merge2)
head(titleratings)
merge3= merge(merge2,titleratings,by="tconst")

head(merge3)
merge3$lang = as.numeric(factor(merge3$lang))
merge3$directors=as.numeric(factor(merge3$directors))
merge3$nconst=as.numeric(factor(merge3$nconst))
slr1 = lm(formula = averageRating ~ lang+numVotes+directors, data=merge3)

summary(slr1)



head(titleprincipals)
head(titlebasics,n=1)
table(namebasics$primaryProfession)


genre_votes=merge(titleratings,titlebasics,by="tconst")
head(genre_votes)


library(dplyr)

genre_votes %>% nrow()
table2=genre_votes %>% group_by(genres) %>% summarise(n=n(), sum(numVotes))

head(table2)

table3 <- table2[order(-table2$`sum(numVotes)`),]
table4= head(table3, n= 25)
head(table4,n=1)
plot(table4$genres,table4$`sum(numVotes)`, cex=3, pch=23)

test=read.table(file = 'D:/Revidly/TEST.tsv', sep = '\t', header = TRUE , flush=FALSE, blank.lines.skip = FALSE, strip.white = TRUE, allowEscapes = TRUE,skipNul = FALSE)
head(test)
.