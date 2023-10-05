
# Conditional Statements in R
# You can execute different code blocks based on condition: TRUE or FALSE
# It allow to make a decision
####################
# The IF statement executes a block of code if "a specified condition" is "TRUE".
if (condition) {
  # if the condition is true
}

x?
if (x > 3) {
  print("x is greater than 3")
}

####################
# ELSE IF statement allows us to test "multiple conditions" in sequence
if (condition1) {
  # if condition1 is true
} else if (condition2) {
  # if condition2 is true
}

z <- 1
if (z > 10) {
  print("z is greater than 10")
} else if (z > 5) {
  print("z is greater than 5 but not 10")
} else {
  print("z is 5 or less")
}

####################
# ELSE statement:  if "none of the previous conditions" are true
if (conditionX) {
  # if the conditionX is true
} else {
  # if the conditionX is false
}

y <- 2
if (y > 3) {
  print("y is greater than 3")
} else {
  print("y is not greater than 3")
}

#############################
# Check the age of diagnosis and classify the patient as young (lover than 35), elder (grater or equal to 65), and middle 
Y_M_E<-NULL # it create empty object that you can store a data

for (i in 1:nrow(Selected_Subset_GBM)){
  if (Selected_Subset_GBM$Age.at.diagnosis[i] < 35){
    Y_M_E[i]<-"Young" 
  }
  else if(Selected_Subset_GBM$Age.at.diagnosis[i] >= 65){
    Y_M_E[i]<-"Elder" 
  }
  else {Y_M_E[i]<-"Middle" }
}
#############################
# Function to calculate the factorial using while conditional statement
Factorial_Calculater <- function(in_number) {
  # is it positive?
  if (in_number > 0) {
    result <- 1
    i <- 1
    # Calculate the factorial using a while loop
    while (i <= in_number) {
      result <- result * i
      i <- i + 1
    }
    return(result)
  } else {
    cat("Invalid input")
    return(NULL)
  }
}
Factorial_Calculater(10)
################################

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
  if(birthyear >= thisyear){
    print('ERROR: Invalid birth year')
  } else {
    return(thisyear-birthyear)
  }
}

age=calculate_age(2022) #
age
age=calculate_age(1949)
age
####

Data_frame_E <- data.frame(Name = c("Alice", "Bob", "Charlie"),
                           Age = c(25, 30, 22))
Data_frame_E$Name

for (row in 1:nrow(Data_frame_E)) {
  res = paste("Name:", Data_frame_E$Name[row], "- Age:", Data_frame_E$Age[row], sep =" ")
  print(res)
  print(row)
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

for (i in 1:nrow(Meta_Table_GEO)) {
  res = paste("The person from whom sample", Meta_Table_GEO$sample.ID[i],
              "was diagnosed at the age of",Meta_Table_GEO$Age.at.diagnosis[i], 
              "and diagnosed IDH", Meta_Table_GEO$IDH1.status[i], sep =" ")
  print(res)
}
# Calculate TPM value depending on previously generated vectors: 
Character_vector <- c("EGFR", "IDH1", "PTEN", "PTEN", "TP53","STAT1","BRCA1")
Count_vector<-c(266.46300, 336.22280 , 35.93280 , 22.20487, 148.81750, 193.39085)
Length_vector<-c(902.714,5321.159,3256.633,1937.957,2955.254,2053.586)


calculateTPM <- function(count_vector, length_vector) {
  # Check if count_vector and length_vector have the same length
  if (length(count_vector) != length(length_vector)) {
    stop("Count and Length vectors must have the same length.")
  }
  
  # Calculate the total count
  total_count <- sum(count_vector)
  
  # Calculate TPM for each gene
  tpm_vector <- (count_vector / length_vector) / (total_count / 1e6)
  return(tpm_vector)
}

TPM_vector <- as.data.frame(calculateTPM(Count_vector, Length_vector))
colnames(TPM_vector)<- "TPM Value"
rownames(TPM_vector)<- Character_vector
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

#DataFrame import
df1 <- # Import DATA_SET_3.csv
  df1 <- DATA_SET_3
                  
colnames(df1)

plot(df1$LDL_levels,df1$Exercise)
ggplot(df1, aes(x=LDL_levels, y=Exercise)) + geom_point()

ggplot(df1,aes(x=Planet,y=LDL_levels, group=Planet)) + geom_boxplot() 
ggplot(df1,aes(x=Planet,y=LDL_levels, group=Planet)) + geom_boxplot(alpha=.25) 
ggplot(df1,aes(x=Planet,y=LDL_levels, group=Planet))+ geom_jitter() + geom_boxplot(alpha=.25) 

#Check Correlation

cor.test(df1$LDL_levels,df1$Exercise)

cor1=cor.test(df1$LDL_levels,df1$Exercise)

cor.test(df1$LDL_levels,df1$Exercise,method="spearman")

#Check Data Normality
hist((df1[,"LDL_levels"]))
ks.test(scale(df1[,"LDL_levels"]),"pnorm")


hist((df1[,"Exercise"]))
exercise_norm=ks.test(scale(df1[,"Exercise"]),"pnorm")
exercise_norm$p.value


#Linear Regression
LMoutput<-lm(df1[,"Exercise"] ~  df1[,"LDL_levels"])
summary(LMoutput)
plot(Exercise ~ LDL_levels, data = df1)
abline(LMoutput)

LMoutput2<-lm(df1[,"Sugar_Consumption"] ~  df1[,"LDL_levels"])
plot(Sugar_Consumption ~ LDL_levels, data = df1)
abline(LMoutput2)

#############
#Exercises 1#
#############
df2 <- # Import DATA_SET_4.csv

#Finding correlated genes with Gene1
temp=as.numeric(df2['Gene2',])
for(i in rownames(df2)){
  temp1=as.numeric(df2[i,])
  temp2=cor.test(temp,temp1)
  if(temp2$p.value < 0.01){
    print(i)
  }
}


#Find the gene with highest median (Remember the material yesterday?)

#Find correlated genes with Gene2, Gene203, and Gene119

#Plot 1 gene-pair that are significantly correlated (up to you) from the analysis above and see how correlated are they based on the plot

#Plot 1 gene-pair that are NOT significantly correlated (up to you) from the analysis above and see how correlated are they based on the plot

#Is there any genes that has non-normal distribution?

#Plot histogram of Gene2, Gene203, and Gene119, and comment on their normality

#Pick 3 pairs of genes (Up to you), and do Linear regression for them. Comment on their significance.