----
  title: "Chick Weight Analysis"
author: "Abdulmohsen Alhafith"
date: "03/09/2020"
output: html_document
---
  package.install
library(tidyverse)
library(DT)
{r }
chickwts <- chickwts
typeof(chickwts)

{r }


# Built-in data sets
chickwts %>%
  group_by(feed) %>%
  summarise(n= n(),
            average=mean(weight),
            SD=sd(weight))

chickwts %>%
  ggplot( aes (x=feed , y=weight) )+ geom_boxplot()

chickwts %>%
  ggplot (aes (x=feed , y=weight))+ geom_jitter()+
  stat_summary(fun.data=mean_sdl
               fun.args = list(mult=1),
               col= "red")

chick_lm <- lm(weight~feed, data= chickwts)

#####



Anova_results<- aov(weight ~ feed, data = chickwts)

summary(Anova_results)




chickwts %>%
  anova()
TukeyHSD(aov(weight~feed, data= chickwts))


```

chickwts