# text-manipulation
Counting the number of words in each question/passage

The dataset has 85 survey questions in a .txt file. The objective is to count the number of words in each question using R. Each question starts with a number followed by characters. 

Challenges: extra spaces between words, punctuation marks without spaces between words, badly placed hyphens ... all created problems when counting words.

Method: The text file was read into R as one string, then the string was split into a vector of 85 questions. Issues with text were solved by regular expressions.
