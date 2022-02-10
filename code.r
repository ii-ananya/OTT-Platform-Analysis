# OTT-Platform-Analysis
#Importing the dataset
dataset = read.csv('MoviesOnStreamingPlatform.csv')
dataset = dataset[8:11]
View(dataset)
#Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:4) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:4,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

#Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = dataset, centers = 4)
y_kmeans = kmeans$cluster

#Visualising the clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = FALSE,
         color = TRUE,
         labels = 1,
         plotchar = FALSE,
         main = paste('Comparison of OTT Platforms'),
         xlab = '',
         ylab = '')
