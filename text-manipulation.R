#Giang Nguyen
#Consulting Assignment 3

#Read in data as one string
###########################
data <- read.table("raw_survey_questions.txt", fill = T, sep = "\n", 
                   quote = "", stringsAsFactors = F, encoding = "UTF-8") 
data <- unlist(data) 
data <- paste(data, collapse = " ")


#Split string into vector of 85 questions. 
#########################################
##Do this by splitting string at the number at the beginning of the string, 
##or a number that follows ". ", "? ", or "! "
question <- strsplit(data, 
                     "^[0-9]|(?<=[.] )[0-9]|(?<=[?] )[0-9]|(?<=! )[0-9]", 
                     perl = TRUE)
question <- unlist(question) #return vector of characters
question <- question[question != ""] #get rid of empty strings


#Take care of issues before counting words
##########################################
#Sub puctuation marks with a space. 
#Takes care of two words with a puctuation mark but no space in between.
#Example: question[2], question[78]
question <- gsub("[.?:!,]", " ", question) 

#Sub " - " with a space. Take care of hyphen used to connect clauses.
#Example: question[20]
question <- gsub(" - ", " ", question)

#Put space between words and underscore.
#Example: question[34], question[38]
question <- gsub("(?<=[a-z])_", " _", question, perl = TRUE)
question <- gsub("_(?=[a-z])", "_ ", question, perl = TRUE)

#Get rid of extra spaces.
question <- gsub("^ *|(?<= ) | *$", "", question, perl = TRUE)


#Get question lengths
#####################
questionLength <- rep(NA, length(question))

for (i in 1 : length(question)){
    questionLength[i] <- strsplit(question[i], " ")
    questionLength[i] <- length(questionLength[[i]])
}

questionLength <- unlist(questionLength)
