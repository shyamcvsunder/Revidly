a=read.table("D:/Revidly/namebasics/data.tsv")

namebasics=read.table(file = 'D:/Revidly/namebasics/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleakas=read.table(file = 'D:/Revidly/title.akas/data.tsv', sep = '\t', header = TRUE , fill=TRUE)

titlebasics=read.table(file = 'D:/Revidly/title.basics/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titlecrew=read.table(file = 'D:/Revidly/title.crew/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleepisode=read.table(file = 'D:/Revidly/title.episode/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleprincipals=read.table(file = 'D:/Revidly/title.principals/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleratings=read.table(file = 'D:/Revidly/title.ratings/data2.tsv', sep = '\t', header = TRUE , fill=FALSE)
head(titleratings)
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
