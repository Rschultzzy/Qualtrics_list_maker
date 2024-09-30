## Pulling R data pull format 

#load libraries
library(collapse)
library(dplyr)
library(RODBC)
library(reshape)
library(writexl)
library(tidyr)

#Connect to database
##dbsu <- odbcConnect("surveys")

#upload CSV into R 
Workload_Hours_2024_1 <- read_excel("C:/Users/rs136595/Downloads/Workload_Hours_2024_1.xlsx")
head(Workload_Hours_2024_1)

#Rename DF and filter out contact metadata columns needed
WH <-Workload_Hours_2024_1 %>%
  select(CI_1, CI_2, CI_3)%>%
  slice(3:n()) %>%
  filter(CI_3 !="") %>%
  dplyr::rename(Email = CI_3, FirstName = CI_1, LastName = CI_2)

#Quick check to ensure output is accurate
View(WH)

#Write a csv file w/ contact metadata
write.csv(as.data.frame(WH), "C:/Users/rs136595/OneDrive - The Bureau of National Affairs, Inc/Documents/Survey Data/W&H_2 - 24/Exec summary & Contact list/", row.names = FALSE)


