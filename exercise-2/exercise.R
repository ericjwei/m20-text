# Exercise-2
# What are informatics courses about?

# Set up
library(tidytext)
library(dplyr)
library(stringr)
library(ggplot2)
library(rvest)

# Read in web page
classes <- read_html("https://www.washington.edu/students/crscat/info.html")

# Extract descriptions of each course into a dataframe (may take multiple steps)
titles <- classes %>% html_node('p b') %>% html_text()
info <- classes %>% html_nodes('p') %>% html_text()
classes <- data.frame(title = titles, description = info[])


# How many courses are in the catalogue?
length(titles)

# Create a tidytext sturcture of all words


# Which words do we use to describe our courses?


# Create a set of stop words by adding (more) irrelevant words to the stop_words dataframe


# Remove stop words by performing an anti_join with the stop_words dataframe


# Which non stop-words are most common?


# Use ggplot to make a horizontal bar chart of the word frequencies of non-stop words

