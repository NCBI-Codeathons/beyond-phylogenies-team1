library(devtools)
library(ggraph)
library(igraph)
library(tidyverse)
library(ggplot2)
library(ggplot2)
library(plotly)
library(psych)
library(rattle)
library(caret)
library(chimeraviz)

library(clustree)

devtools::install_github(
  "stianlagstad/chimeraviz",
  build_vignettes = TRUE)

# data cleaning

data_1 <- read.delim('.dataset/.input-data.1.aa.fasta', header = TRUE, sep = "\t")
data_2 <- read.delim('.dataset/.input-data.1.nt.fasta', header = TRUE, sep = "\t")
data_3 <- read.delim('.dataset/.input-data.1.txt', header = TRUE, sep = "\t")
d3 <- data_3[!(duplicated(data_3) | duplicated(data_3, fromLast = TRUE)), ]


# quick check missing values

head(is.na(data_3))

data_3_missing <- is.na(data_3)

# replace missing values of a brain weight with mean brain weight

data_3[is.na(data_3)] <- mean(data_3, na.rm = TRUE)

data_3_clean <- data_3[complete.cases(data_3),]

# data assessment

summary(data_3)


pairs.panels(
  data_3[,1:4],
  scale = TRUE,
  hist.col = 'grey85',
  bg = c("mediumseagreen","orange2","mediumpurple1")[data_3$accession],
  pch = 21,
  main = 'Correlation matrix')

# random forest model
fitControl <- trainControl(method = "cv", number = 10, savePredictions = TRUE)

train_index <- createDataPartition(y = data_3$accession,
                                   p = .7,
                                   list = FALSE,
                                   times = 1)

train_data <- data_3[,1:4]
# test_data <- data_3[,5:14]


rf_model <- train(
  accession ~ .,
  method = 'rf',
  trControl = fitControl,
  data = train_data)


dt_model <- train(accession ~ .,
                  data = train_data,
                  method = 'rpart',
                  trControl = fitControl)

confusionMatrix(dt_model)


dt_importance <- varImp(dt_model[,1:4])

# Create plot of importance of variables
ggplot(data = dt_importance, mapping = aes(x = dt_importance[,1:4])) +
  geom_boxplot() +
  labs(title = "Variable importance: Decision tree model") +
  theme_light()


fancyRpartPlot(dt_model$finalModel, sub = '')


data_3 %>% 
  ggplot(aes(x=data_3)) + 
  geom_histogram(bins=400, fill="red")+
  theme_bw()+theme(axis.title = element_text(size=16),axis.text = element_text(size=14))+
  ylab("Count")+coord_cartesian(x=c(-0.5,0.5))


# Tree experimental representations
library(clustree)

names(data_3_clean) <- c("cds_id", "acc1", "acc2", "acc3", "acc4", "acc5", "acc6")

clustree(data_3_clean[1:5,], prefix = "acc", layout = "sugiyama", node_colour = "purple", node_size = 10, node_colour_aggr = "mean")


