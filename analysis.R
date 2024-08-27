rm(list=ls())#remve all variables stored previously
library(Hmisc) # import
data <- read.csv("D:/datascience/covid19 inR/COVID19_line_list_data.csv")

describe(data)
#cleaned up death column

data$death_dummy<-as.integer(data$death != 0)

#death rate
sum(data$death_dummy)/nrow(data)

#age
#claim: people who died are older

dead=subset(data,death_dummy==1)
alive=subset(data,death_dummy==0)

mean(dead$age, na.rm=TRUE)
mean(alive$age, na.rm=TRUE)

#statistically significant?

t.test(alive$age,dead$age)

#gender
#claim: people who died are male or female

men=subset(data,gender=="male")
women=subset(data,gender=="female")

mean(men$death_dummy, na.rm=TRUE)
mean(women$death_dummy, na.rm=TRUE)

#statistically significant?

t.test(men$death_dummy,women$death_dummy)
