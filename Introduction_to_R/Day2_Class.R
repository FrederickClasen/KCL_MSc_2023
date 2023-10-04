####################
#BUILDING FUNCTIONS#
####################
# Functions are blocks of code that perform specific tasks.
# They have a name, arguments, and a body.
# They can return values.

function_name <- function(Argument1, Argument2, ...) {
  # Code to perform some operations
  return(result)
}

# {}: The curly braces define the body of the function.
# return(result): Specifies what the function should return as output.

add_numbers <- function(a, b) {
  result <- a + b
  return(result)
}

Res_a <- add_numbers(3,6)
print(Res_a)

add_numbers <- function(a, b) {
  result <- a + b
#  print(result)
}
add_numbers(3,6)

calculate_age <- function(birthyear, thisyear=2023){
  #selection, to check if birthyear is valid
  if(birthyear > thisyear){
    print('ERROR: Invalid birth year')
  } else {
    return(thisyear-birthyear)
  }
}
age=calculate_age(2023) #
age
age=calculate_age(1949)
age
####
# For Loop

Data_frame_E <- data.frame(Name = c("Alice", "Bob", "Charlie"),
                         Age = c(25, 30, 22))
for (row in 1:nrow(Data_frame_E)) {
  res = paste("Name:", Data_frame_E$Name[row], "- Age:", Data_frame_E$Age[row], sep =" ")
  print(res)
}

print_information <- function(name, age, city){
  temp1=paste('Full Name:',name)
  temp2=paste('Age:',age)
  temp3=paste('Place of Birth:',city)
  
  #repetition
  for(i in c(temp1,temp2,temp3)){
    print(i)
  }
}

print_information('David Beckham', calculate_age(1975), 'London')

for (row in 1:nrow(Meta_Table_GEO)) {
  res = paste("The person from whom sample", Meta_Table_GEO$sample.ID[row],
              "was diagnosed at the age of",Meta_Table_GEO$Age.at.diagnosis[row], 
              "and diagnosed IDH", Meta_Table_GEO$IDH1.status[row], sep =" ")
  print(res)
}
 # Question: 
#observe the difference between return and print in a function

############
#Excercises#
############

#In this exercises, try to complete the functions with your code to get TRUE in all use cases given.
#Fill the functions with your code where it is marked with "#WRITE YOUR CODE HERE"
#Don't change anything else.

#Example:
valid_birthyear <- function(birthyear, thisyear=2022){
  #WRITE YOUR CODE HERE
  if(birthyear > thisyear){
    return(FALSE)
  } else {
    return(TRUE)
  }
}

#use cases
valid_birthyear(1988) == TRUE
valid_birthyear(2088) == FALSE
#######################################################################

#Question

fahrenheit_to_celsius <- function(temp_F) {
  #WRITE YOUR CODE HERE
  
  return(temp_C)
}

fahrenheit_to_celsius(32) == 0
fahrenheit_to_celsius(86) == 30


#Question

check_leap_year <- function(year){
  #WRITE YOUR CODE HERE
  
  
  return(isleap)
}

check_leap_year(1990) == FALSE
check_leap_year(1988) == TRUE
check_leap_year(2000) == TRUE

#Question

#We need at least 8 hours of sleep per day, but not more than 10 hours.
enough_sleep <- function(hours){
  #WRITE YOUR CODE HERE
  
  
  return(result)
}

enough_sleep(11) == FALSE
enough_sleep(8) == TRUE
enough_sleep(8.5) == TRUE
enough_sleep(6) == FALSE

#Question

check_word <- function(word, sentence){
  #WRITE YOUR CODE HERE
  #hint: check grep function
  
  
  return(result)
}

check_word('Icardi', 'Icardi is the best player in the world') == TRUE
check_word('WHO', 'Who let the dogs out?') == FALSE

################################################################################
## CSV, TXT, XLSX Read and Write

# Define the file path where you want to save the text file (TXT)

file_path <- "~/Desktop/UpgrdPostDoc/Microbiome_00/KCL_Microbiome_2023_24_Module_2/IntroductionToR/Meta_Table_GEO.txt"
write.table(Meta_Table_GEO, file = file_path, sep = "\t", row.names = TRUE, col.names = TRUE) #  tab-separated values
# WORKING DIRECTORY, direclty you can save
write.table(Meta_Table_GEO, file = "Meta_Table_GEO.txt",sep = "\t", row.names = TRUE, col.names = TRUE) #  tab-separated values

# Define file path
file_path <- "~/Desktop/UpgrdPostDoc/Microbiome_00/KCL_Microbiome_2023_24_Module_2/IntroductionToR/Meta_Table_GEO.txt"
# Read the tab-separated text file
Meta_Table_GEO <- read.table(file_path, header = TRUE, sep = "\t")
Meta_Table_GEO <- read.delim(file_path)

################################################################################

# Define the file path where you want to read or save the csv file
file_path <- "~/Desktop/UpgrdPostDoc/Microbiome_00/KCL_Microbiome_2023_24_Module_2/IntroductionToR/Data/Meta_Table_GEO.csv"

# Read the CSV file
Meta_Table_GEO <- read.csv(file_path)
getwd() #let's see what is the "CURRENT WORKING DIRECTORY"
library(readr)
Meta_Table_GEO <- read_csv("Data/Meta_Table_GEO.csv")


# Specify the file path for the Excel file you want to create
output_file <- "~/Desktop/UpgrdPostDoc/Microbiome_00/KCL_Microbiome_2023_24_Module_2/IntroductionToR/Data/Meta_Table_GEO.xlsx"
write.xlsx(Meta_Table_GEO, output_file) # Write the data to an Excel file
# Error?
# Install the openxlsx package 
install.packages("openxlsx")
library(openxlsx) # Load the openxlsx package
write.xlsx(Meta_Table_GEO, output_file) # Write the data to an Excel file

# Specify the file path to read
file_path <- "~/Desktop/UpgrdPostDoc/Microbiome_00/KCL_Microbiome_2023_24_Module_2/IntroductionToR/Data/Meta_Table_GEO.xlsx"
# Read the Excel file
data2 <- read.xlsx(file_path)

################################################################################
# Data Frame Manipulation

rownames(Meta_Table_GEO) <- row_names # give rownames

selected_vector <- Meta_Table_GEO$Type # select vector
# OR
selected_vector <- Meta_Table_GEO[, "Type"]

selected_columns <- Meta_Table_GEO[, c("sample.ID", "Type", "Gender")]# slect set of column
selected_columns <- Meta_Table_GEO[, c(2,3,13:14)]# slect set of column
selected_rows <- Meta_Table_GEO[3:7, ] # select column
selected_rows <- Meta_Table_GEO[12:20, c("sample.ID", "Type", "Gender")] # select column
# Select a Set of Columns Depending on Column A Name
column_name_to_select <- "PRMT3" # gene expression
column_index <- which(colnames(Meta_Table_GEO) == column_name_to_select)
selected_columns <- Meta_Table_GEO[, column_index]


# Find an Index of a Text in Column A, Then Subset the Data
target_text <- "GBM"
index <- which(Meta_Table_GEO$Type == target_text)
Selected_Subset <- Meta_Table_GEO[index, ]

# Select a Set of Rows Depending on Specific Column A and Value
index <- which(Selected_Subset$Age.at.diagnosis >= 65)
selected_65 <- Selected_Subset[index, ]

# Try some example and manupulation
# Subset a dataframe should include:(only GBM samples) sample ID, age, survival years, vital status, and gene expression part. 
# sort data depending on survival years
# convert survival years to survival days
################################################################################

vector1<-c(1,2,3,7,8)
matrix1 <- matrix(c(10,15,7,10,9,12,14,19),4,2)
colnames(matrix1) <- c("laden","unladen") 
df1 <- as.data.frame(matrix1)

sum(vector1)
mean(vector1)
median(vector1)
sd(vector1)

sum(matrix1)
colSums(matrix1)
rowSums(matrix1)
sd(matrix1)

mean(matrix1)
rowMeans(matrix1)
colMeans(matrix1)

sum(df1)
colSums(df1)
rowSums(df1)

rowMeans(df1)
colMeans(df1)

################################################################################
# Data Visualization

install.packages("ggplot2") #do this before operation

library(ggplot2)
mtcars = mtcars #built-in datasets
View(mtcars)

ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=2, shape=23)

p <- ggplot(mtcars, aes(x=mpg)) + 
  geom_density()
p
p+ geom_vline(aes(xintercept=mean(mpg)),
              color="blue", linetype="dashed", size=1)

p <- ggplot(mtcars,aes(x=cyl,y=mpg, group=cyl)) + geom_boxplot()
p
p + coord_flip()

heatmap(as.matrix(mtcars), scale="column")

# Do some example with Meta_Table_GEO dataset

ggplot(Meta_Table_GEO, aes(x=survival..years., y=Age.at.diagnosis)) + geom_point()
ggplot(Meta_Table_GEO, aes(x=survival..years., y=Age.at.diagnosis)) +
  geom_point(size=2, shape=23) # change points

p <- ggplot(Meta_Table_GEO, aes(x=Age.at.diagnosis)) + 
  geom_density()
p
p+ geom_vline(aes(xintercept=mean(Age.at.diagnosis)),
              color="blue", linetype="dashed", size=1)
# Error? Why?, What is the solution

# select only GBM samples and perform box plot, group them depending on Gender
p <- ggplot(Meta_Table_GEO,aes(x=Gender,y=Age.at.diagnosis, group=Gender)) + geom_boxplot()
p
p <- ggplot(Meta_Table_GEO,aes(x=Gender,y=survival..years., group=Gender)) + geom_boxplot()
p

heatmap(as.matrix(Meta_Table_GEO), scale="column")
# Error Why, make a matrix from gene expression part and perform heatmap

################################################################################
# Exercise 
#Load file "DATA_SET_REFERENCE_1.csv" in "Data" folder
df1 = read.csv('Data/DATA_SET_REFERENCE_1.csv',sep=',',stringsAsFactors = F, row.names = 1)
View(df1)

#Sort dataframe based on the 'Weight' columns

#calculate the standard deviation of 'Age' column

#Using logical operator, show that the mean of 'LDL' is higher than 'Sugar_blood'

#Using iteration/for loop, print the mean weight of the patients based on the "Color_house". Which "Color_house" has higher weight in average?

#how many patients have enough sleep? (>8 hours)

#Which house color has in average the highest level of hospitalization?

#Make a boxplot of "Sugar_blood" grouped by house color. Which house color has highest Blood sugar average?
#(BONUS point if you can make the boxes to represent their house color)

#Older patients (>70 years old) decided to paint their house Green. Update the dataframe.

#The heavier patients (>100kg) decided to exercise. They took their exercise time from their sleeping time.
#They reduced their sleeping time by 20%. Update the dataframe.

#Make a new dataframe with only 'Age', 'Weight', and 'Sugar_blood' columns.

#Make a heatmap of 'Age', 'Weight', and 'Sugar_blood' columns. 

#Based on the clusters in the heatmap, which 2 columns has the highest similarity? (Check the top dendrogram)

#Show the density plot of 'Weight' and 'Sugar_blood' in the same figure. Include the median of both variables in different color.
