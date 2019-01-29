library("triangle")

set.seed(0)

q1_d1 <- round(rtriangle(1000, 1, 7, 5))
q1_d2 <- round(rtriangle(1000, 1, 7, 6))
q1_d3 <- round(rtriangle(1000, 1, 7, 2))

df <- data.frame(q1_d1 = factor(q1_d1),
                 q1_d2 = factor(q1_d2),
                 q1_d3 =  factor(q1_d3))

library(dplyr)

# group by combinations and count
df_grouped <- df %>% group_by(q1_d1, q1_d2, q1_d3) %>% count()

# set an "id" string that denotes the value combination
df_grouped <- df_grouped %>%
  mutate(id = factor(paste(q1_d1, q1_d2, q1_d3, sep = '-')))

# sort by count and select top rows
df_grouped <- (df_grouped %>% arrange(desc(n)))[1:10,]

library(GGally)

ggparcoord(df_grouped, columns = 1:3, groupColumn = 'id', scale = 'globalminmax')

library("ggparallel")
ggparallel(list('q1_d1', 'q1_d2', 'q1_d3'), df, order = 0)

df_pcp <- as.data.frame(df_grouped)   # this is important!
ggparallel(list('q1_d1', 'q1_d2', 'q1_d3'), df_pcp, weight = 'n', order = 0)