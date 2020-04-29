titleepisode=read.table(file = 'D:/Revidly/title.episode/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleratings=read.table(file = 'D:/Revidly/title.ratings/data2.tsv', sep = '\t', header = TRUE , fill=FALSE)
titlebasics=read.table(file = 'D:/Revidly/title.basics/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
head(titleepisode)
head(titleratings)
head(titlebasics)
merge1 = merge(titleepisode,titlebasics, by ="tconst")
head(merge1)

result1 = merge1 %>% group_by(parentTconst)%>% summarise(n=n(),season= max(seasonNumber) ,start= min(startYear),end= max(endYear))
merge1$seasonNumber = as.integer(as.character(merge1$seasonNumber))
merge1$startYear = as.integer(as.character(merge1$startYear))
merge1$endYear = as.integer(as.character(merge1$endYear))
result1$start = as.integer(as.character(result1$start))
result1$season= as.integer(as.character(result1$season))
result1$endyear = result1$start + result1$season

head(result1)

result2 = result1[!(is.na(result1$endyear) | result1$endyear=="" | result1$endyear=="NA"),]
head(result2)

finalresultsnew = result2 %>% group_by(endyear) %>% summarise(count = n())
head(finalresultsnew)
finalresultsnew$count = as.integer(as.character(finalresultsnew$count))
orderresults = finalresultsnew[order(- finalresultsnew$count)]

head(orderresults)

result1= result1[!(is.na(result1$start))]
library(dplyr)
titlebasics=select(titlebasics,-titleType,-primaryTitle,-originalTitle,-isAdult,-genres)

table1=table1[!(is.na(table1$runtimeMinutes) | table1$runtimeMinutes=="" | table1$runtimeMinutes=="\\N"),]

table1=table1[!(is.na(table1$seasonNumber) | table1$seasonNumber=="" | table1$seasonNumber=="\\N"),]

table1=table1[!(is.na(table1$episodeNumber) | table1$episodeNumber=="" | table1$episodeNumber=="\\N"),]

table1=table1[!(is.na(table1$endYear) | table1$endYear=="" | table1$endYear=="\\N"),]

table1=merge(titlebasics,titleepisode,by="tconst")
head(table1)
tablefinal$runtimeMinutes = as.integer(as.character(table1$runtimeMinutes))
tablefinal$seasonNumber = as.integer(as.character(table1$seasonNumber))
tablefinal$episodeNumber = as.integer(as.character(table1$episodeNumber))

grouping = tablefinal %>% group_by(endYear) %>% summarise(n=n(), mean(averageRating))
head(grouping)
grouping$endYear = as.integer(as.character(grouping$endYear))
grouping2=grouping %>% filter(endYear > 100)
head(grouping2)
table3 <- grouping[order(- grouping$`mean(averageRating)`),]
head(table3)


tablefinal=merge(table1,titleratings,by="tconst")
head(tablefinal)
tablefinal=select(tablefinal,-startYear)
