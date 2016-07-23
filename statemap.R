library(choroplethr)
library(ggplot2)
library(dplyr)

df  <- read.csv('states_for_r_chrono.csv')
df2 <- df %>% 
  
state_choropleth(df, num_colors = 7)

choro = StateChoropleth$new(df)
choro$title = "2016 Election Donations"
choro$ggplot_scale = scale_fill_manual(name="Candidate", ,values=c("blue", "red"), drop=FALSE)
choro$render()
