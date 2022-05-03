library(tidyverse)
library(titanic)

titanic_dt <- titanic_train

titanic_dt %>% distinct(Sex)
titanic_dt %>% group_by(Sex,Pclass) %>% summarize(mean(Fare))
titanic_dt %>% group_by(Sex,Pclass) %>% count()

glm(Survived ~ Sex + Pclass,data=titanic_dt) %>% summary()

