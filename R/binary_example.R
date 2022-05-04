library(tidyverse)
library(titanic)
library(pROC)

titanic_dt <- titanic_train
titanicTest_dt <- titanic_test

titanic_dt %>% distinct(Sex)
titanic_dt %>% group_by(Sex,Pclass) %>% summarize(mean(Fare))
titanic_dt %>% group_by(Sex,Pclass) %>% count()

glmObj <- glm(Survived ~ Sex + Pclass,data=titanic_dt,family=binomial)

yPred <- predict(glmObj,newdata=titanic_dt)
titanic_dt <- titanic_dt %>% mutate(SurvivedPred = as.numeric(yPred))
curveROC <- roc(titanic_dt,Survived, SurvivedPred)
plot(curveROC)

