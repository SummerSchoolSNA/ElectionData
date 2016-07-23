df_m <- read.csv("dist_by_money.csv")
df_p <- read.csv("dist_by_policy.csv")
library(dplyr)
df <- merge(df_m, df_p)

row_sub = apply(df[c("money")], 1, function(row) all(abs(row) > 0.01 ))
df_sub <- df[row_sub,]

#df_norm <- df_sub %>% 
#  mutate_each_(funs(scale), vars=c("money", "similarity"))

#df_sub$money <- log(df_sub$money)

library(ggplot2)
ggplot(df_sub, aes(x=money, y=similarity)) +
  geom_point()

ggplot(df_sub) +
  geom_histogram(aes(x=similarity), col='red', fill='green', alpha=.3, bins=6) +
  labs(x="Policy difference", y="Money") +
  theme_light()
