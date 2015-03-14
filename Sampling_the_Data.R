#Task 1 - Data acquisition and cleaning

setwd("/home/inamoto21/Desktop/github/Capstone/final/en_US")

#Reading the txt files
blog = readLines("en_US.blogs.txt")
news = readLines("en_US.news.txt")
twit = readLines("en_US.twitter.txt")

#Sampling the en_US.blogs.txt file"
#The goal is to take 100000 chunks

n = length(blog)
p = 10^5 / length(blog) #The probability for rbinom
sample = rbinom(n,1,p)
sample <- ifelse(sample == 1, TRUE, FALSE) #Take a logical vector

#Subsetting the original txt file
sample_blogs = blog[sample]

#Sampling the en_US.news.txt file"
#The goal is to take 100000 chunks

n = length(news)
p = 10^5 / length(news) #The probability for rbinom
sample = rbinom(n,1,p)
sample <- ifelse(sample == 1, TRUE, FALSE) #Take a logical vector

#Subsetting the original txt file
sample_news = news[sample]

#Sampling the en_US.twitter.txt file"
#The goal is to take 100000 chunks

n = length(twit)
p = 10^5 / length(twit) #The probability for rbinom
sample = rbinom(n,1,p)
sample <- ifelse(sample == 1, TRUE, FALSE) #Take a logical vector

#Subsetting the original txt file
sample_twit = twit[sample]

#Saving the sampled data to RData file
save(sample_news, sample_blogs, sample_twit, file = "sample_all.RData")

