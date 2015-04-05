library(shiny)

w2 <- readRDS("data/w2.rds")
w3 <- readRDS("data/w3.rds")
w4 <- readRDS("data/w4.rds")
w5 <- readRDS("data/w5.rds")

shinyServer(function(input, output) {
  
  output$text1 = renderText({
    
    textInput = input$text
    numberOfWordsToDisplay = input$numberOfWords
    
    punct <- '[]\\?!\"\'#$%&(){}+*/:;,._`|~\\[<=>@\\^-]'
    
    gsub( punct, "", textInput )
    
    words = strsplit(textInput, "\\W")
    words_v = unlist(words)
    
    #Remove the blanks
    words_v = words_v[words_v != ""]
    
    #Tolower
    words_v = tolower(words_v)
    
    no_of_words_entered = length(words_v)
    
    nextWordFreq = data.frame()
    
    if(no_of_words_entered == 1) {
      
      nextWordFreq = subset(w2, Word1 == words_v[1], select = c(Freq, Word2))
      
    }
    
    if(no_of_words_entered == 2) {
      
      nextWordFreq = subset(w3, Word1 == words_v[1] & Word2 == words_v[2], select = c(Freq, Word3))
      
    }
    
    if(no_of_words_entered == 3) {
      
      nextWordFreq = subset(w4, Word1 == words_v[1] & Word2 == words_v[2] & Word3 == words_v[3], select = c(Freq, Word4))
      
    }
    
    if(no_of_words_entered == 4) {
      
      nextWordFreq = subset(w5, Word1 == words_v[1] & Word2 == words_v[2] & Word3 == words_v[3] & Word4 == words_v[4]
                            , select = c(Freq, Word5))
      
    }
    
    if(no_of_words_entered > 4) {
      
      nextWordFreq = subset(w3, Word1 == words_v[no_of_words_entered - 1] & Word2 == words_v[no_of_words_entered]
                            , select = c(Freq, Word3))
    }
    
    if(no_of_words_entered != 0) {
      nextWordFreq = nextWordFreq[order(nextWordFreq$Freq, decreasing=TRUE), ]
      next3words = nextWordFreq[1:numberOfWordsToDisplay, 2]
    } else {
      next3words = ""
    }
    
    
    no_na_next3words = sum(is.na(next3words))
    
    if(no_na_next3words > 0) {
      mostCommonWords = c("the", "be", "to", "of", "and", "a", "in", "that", "for", "on", "with")
      
      #Omit the mostCommonWords that are included in nextewords (Subsetting)
      mostCommonWords = mostCommonWords[!(mostCommonWords %in% next3words)]
      
      next3words[is.na(next3words)] = mostCommonWords[1:no_na_next3words]
    }  
          
      print(next3words)
  })
  
 
})
