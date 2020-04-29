a=read.table("D:/Revidly/namebasics/data.tsv")

namebasics=read.table(file = 'D:/Revidly/namebasics/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleakas=read.table(file = 'D:/Revidly/title.akas/data.tsv', sep = '\t', header = TRUE , fill=TRUE)

titlebasics=read.table(file = 'D:/Revidly/title.basics/data2.tsv', sep = '\t', header = TRUE , fill=TRUE)
titlecrew=read.table(file = 'D:/Revidly/title.crew/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleepisode=read.table(file = 'D:/Revidly/title.episode/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
titleprincipals=read.table(file = 'D:/Revidly/title.principals/data.tsv', sep = '\t', header = TRUE , fill=TRUE)
 titleratings=read.table(file = 'D:/Revidly/title.ratings/data2.tsv', sep = '\t', header = TRUE , fill=FALSE)
head(namebasics)
head(titleprincipals)
titleprincipals=select(titleprincipals,-characters)
namebasics= select(namebasics,-primaryProfession)
namebasics=select(namebasics,-age)
typeof(namebasics$deathYear)
namebasics$deathYear=replace(namebasics$deathYear,"\\N","2020")
namebasics$age = namebasics$deathYear-namebasics$birthYear
namebasicsdead=namebasics[!(is.na(namebasics$deathYear) | namebasics$deathYear=="" | namebasics$deathYear=="\\N" | is.na(namebasics$birthYear) | namebasics$birthYear=="" | namebasics$birthYear=="\\N"),]
namebasicsdead=namebasics[!(is.na(namebasicsdead$birthYear) | namebasicsdead$birthYear=="" | namebasicsdead$birthYear=="\\N"),]

head(namebasicsdead,n=16)
typeof(namebasicsdead$age)
as.integer(namebasicsdead$age)
namebasicsdead$age[1] - namebasicsdead$birthYear[1]
namebasicsdead$age2 = as.integer(namebasicsdead$deathYear- namebasicsdead$birthYear)
as.numeric(namebasicsdead$birthYear)
namebasicsdead$age= as.integer(namebasicsdead$deathYear-namebasicsdead$birthYear)
typeof(namebasics$age)

table1=merge(titleprincipals,namebasicsdead,by="nconst")
table2=merge(table1,titleratings,by="tconst")
head(table2)
final = table2 %>% group_by(age) %>% summarise(n=n(), mean(averageRating))

head(final)
namebasicsdead$birthYear <- as.numeric(namebasicsdead$birthYear)
namebasicsdead$deathYear <- as.numeric(namebasicsdead$deathYear)

namebasicsdead$birthYear = namebasicsdead$birthYear+1629
namebasicsdead$deathYear = namebasicsdead$deathYear + 1693
library(dplyr)

genre_votes %>% nrow()
table2=genre_votes %>% group_by(genres) %>% summarise(n=n(), sum(numVotes))

head(table2)

table3 <- final[order(- final$`mean(averageRating)`),]
head(table3)
table4= head(table3, n= 25)
head(table4,n=1)
plot(table4$genres,table4$`sum(numVotes)`, cex=3, pch=23)

test=read.table(file = 'D:/Revidly/TEST.tsv', sep = '\t', header = TRUE , flush=FALSE, blank.lines.skip = FALSE, strip.white = TRUE, allowEscapes = TRUE,skipNul = FALSE)
head(test)
