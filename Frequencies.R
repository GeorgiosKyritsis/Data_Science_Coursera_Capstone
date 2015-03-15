#Task 2 - Exploratory analysis 

setwd("/home/inamoto21/Desktop/github/Capstone/final/en_US")

load("sample_all.RData")

#Convert the entire txt to lowercase characters
sample_twitter = tolower(sample_twitter)

#Separating the Words
twitter_words_l <- strsplit(sample_twitter, "\\W")

#Convert the list to vector
twitter_words_v <- unlist(twitter_words_l)

#Remove the blanks from the vector
not.blanks.v <- which(twitter_words_v!="")
twitter_words_v <- twitter_words_v[not.blanks.v]

#Build a contingency table with the words
#and their corresponding frequency
twitter_freqs_t <- table(twitter_words_v)
sorted_twitter_freqs_t <- sort(twitter_freqs_t , decreasing=TRUE)


#Convert the entire txt to lowercase characters
sample_blogs = tolower(sample_blogs)

#Separating the Words
blogs_words_l <- strsplit(sample_blogs, "\\W")

#Convert the list to vector
blogs_words_v <- unlist(blogs_words_l)

#Remove the blanks from the vector
not.blanks.v <- which(blogs_words_v!="")
blogs_words_v <- blogs_words_v[not.blanks.v]

#Build a contingency table with the words
#and their corresponding frequency
blogs_freqs_t <- table(blogs_words_v)
sorted_blogs_freqs_t <- sort(blogs_freqs_t , decreasing=TRUE)


#Convert the entire txt to lowercase characters
sample_news = tolower(sample_news)

#Separating the Words
news_words_l <- strsplit(sample_news, "\\W")

#Convert the list to vector
news_words_v <- unlist(news_words_l)

#Remove the blanks from the vector
not.blanks.v <- which(news_words_v!="")
news_words_v <- news_words_v[not.blanks.v]

#Build a contingency table with the words
#and their corresponding frequency
news_freqs_t <- table(news_words_v)
sorted_news_freqs_t <- sort(news_freqs_t , decreasing=TRUE)








