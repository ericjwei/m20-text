# Exercise-1
# Developed from: http://tidytextmining.com/

# Set up (install packages that you don't have)
library(janeaustenr)
library(tidytext)
library(dplyr)
library(stringr)
library(ggplot2)

# Load booksinto a dataframe using the austen_books() function
df <- austen_books()

# How many books are in the dataset?
df %>% count(book)

# Which book has the most lines?


# Use the unnest_tokens function to generate the full list of words
unnest_tokens(df, words, text)

# Which words are most common (regardless of which book them come from)?
unnest_tokens(df, words, text) %>% count(words) %>% arrange(-n)

# Remove stop words by performing an anti_join with the stop_words dataframe
words <- anti_join(unnest_tokens(df, words, text), stop_words, by = c("words" = "word")) %>%  View()

# Which non stop-words are most common?
anti_join(unnest_tokens(df, words, text), stop_words, by = c("words" = "word")) %>% count(words) %>% arrange(-n)

# Use ggplot to make a horizontal bar chart of the word frequencies of non-stop words
words <- anti_join(unnest_tokens(df, words, text), stop_words, by = c("words" = "word")) %>% count(words)
ggplot(words, aes(x = n, y = words)) +
  geom_bar(color = "black") +
  coord_flip()
    
