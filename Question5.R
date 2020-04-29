titleepisode=read.table(file = 'D:/Revidly/title.episode/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleratings=read.table(file = 'D:/Revidly/title.ratings/data2.tsv', sep = '\t', header = TRUE , fill=FALSE)
titlebasics=read.table(file = 'D:/Revidly/title.basics/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
head(titleepisode)
head(titleratings)
head(titlebasics)

titlebasics=select(titlebasics,-titleType,-primaryTitle,-originalTitle,-isAdult,-genres)
titleepisode=select(titleepisode,-seasonNumber,-episodeNumber)


table1=table1[!(is.na(table1$runtimeMinutes) | table1$runtimeMinutes=="" | table1$runtimeMinutes=="\\N"),]

table1=table1[!(is.na(table1$seasonNumber) | table1$seasonNumber=="" | table1$seasonNumber=="\\N"),]

table1=table1[!(is.na(table1$episodeNumber) | table1$episodeNumber=="" | table1$episodeNumber=="\\N"),]

table1=merge(titlebasics,titleepisode,by="tconst")
head(table1)
tablefinal$runtimeMinutes = as.integer(as.character(table1$runtimeMinutes))
tablefinal$seasonNumber = as.integer(as.character(table1$seasonNumber))
tablefinal$episodeNumber = as.integer(as.character(table1$episodeNumber))

grouping = tablefinal %>% group_by(parentTconst) %>% summarise(n=n(),sum(runtimeMinutes), max(seasonNumber), mean(episodeNumber), mean(averageRating))
head(grouping)

table3 <- grouping[order(- grouping$`mean(averageRating)`),]
head(table3)


tablefinal=merge(table1,titleratings,by="tconst")
head(tablefinal)
tablefinal=select(tablefinal,-startYear)
