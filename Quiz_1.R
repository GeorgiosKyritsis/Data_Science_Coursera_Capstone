#Quiz 1: Getting Started

setwd("~/Desktop/github/Capstone/final/en_US")

#Question 1
file.info("en_US.blogs.txt")$size / 1024

#Question 2
twit = readLines("en_US.twitter.txt")
length(twit)

#Question 3
blog = readLines("en_US.blogs.txt")
news = readLines("en_US.news.txt")
twit = readLines("en_US.twitter.txt")

max(nchar(blog))
max(nchar(news)) 
max(nchar(twit))

#Question 4
love = sum(grepl(pattern="love", twit))
hate = sum(grepl(pattern="hate",twit))
ratio = love/hate

#Question 5
twit_biostats = grep(pattern="biostats", twit)
twit[twit_biostats]

#Question 6
sum(grepl("A computer once beat me at chess, but it was no match for me at kickboxing",twit))


