#Today we are going to learn on the basics of R.
#We are going to learn about the arithmatic and logical operations, syntax, data type, and ultimately making our own functions

setwd("~/Desktop/UpgrdPostDoc/Microbiome_00/KCL_Microbiome_2023_24_Module_2/IntroductionToR")
#Try to understand the meaning of each lines/commands.
#######################
###SIMPLE OPERATIONS###
#######################

a <- 5  
b <- 20
c <- 17

#arithmatic calculations
a + b
sum(a,b)
b - c
a * c
b / a
c %% a # Remainder of a division
c %/% a # Quotient

# Absolute Value
abs(a-b)      # Absolute value of 'b'
d <- abs(a-b)

# Exponentiation
a ^ 2 
b ^ 3 

# Square Root
sqrt(a)     
sqrt(b)   

# Logarithms
log(a)      # Natural logarithm (ln) (base e) of 'a'
log10(b)    # Base-10 logarithm of 'b'
log2(b)    # *** Base-2 logarithm of 'b'

# Rounding
round(3.14159, digits = 2)  # Round to 2 decimal places

# Maximum and Minimum
max(a, b, c)  # Maximum 
min(a, b, c)  # Minimum 

#logical operations (results are only TRUE or FALSE)

a <- 5  # Assignment
b <- 20 # Assignment

a == b # Checks if a is equal to b
a != b # is not equal
(a+d) == b
a >= b
b < c
b > a
(b > a) & (d > c) # & shift + 6
(b > a) | (d > c) # | option + 7

(b > a) & (d <= c)
(b > a) | (d <= c) 

(b > a) == TRUE
(d > c) == TRUE
is_student <- TRUE
(b > a) == is_student
############
#DATA TYPES#
############

e <- 'My name is Bond'
f <- '007'
g <- 80.3
h <- c(12,17,1)
i <- '12'

class(a)
class(e)
class(f)
class(g)
class(h)
class(i)

h-a
e-a
i-a #Why error?
as.numeric(i)-a #Why works?
e == f

#####################
#STRING MANIPULATION#
#####################
j <- 'James Bond'
paste(e,j,sep=', ')
paste('My codename is',f)
paste('My weight is',g,'kg') #check the difference between paste and paste0

k=paste('My codename is',f)
k
# Get the length of a string
name_length <- nchar(k)

strsplit(k,' ')


###################
#VECTOR AND MATRIX#
###################

# Vectors are one-dimensional data structures in R that can hold elements of the same data type

vector1<-c(1,2,3,7,8)
class(vector1)

vector1*a
vector1+a

vector2<-c(3,2,1,-3,-9)
vector1+vector2

## What happen here?
vector3<-c(3,2,1,-3)
vector1+vector3

Character_vector <- c("EGFR", "IDH1", "PTEN", "PTEN", "TP53","STAT1","BRCA1")
TPM_vector<- c(41.160000, 8.810700, 1.538551, 1.597694, 7.021780,13.131450)
Count_vector<-c(266.46300, 336.22280 , 35.93280 , 22.20487, 148.81750, 193.39085)
Length_vector<-c(902.714,5321.159,3256.633,1937.957,2955.254,2053.586)

log2(Count_vector)
log10(Count_vector)
round(Count_vector, digit=1)
round(TPM_vector, digit=1)

#Matrix
airspeed <- matrix(c(10,15,7,10),2,2)
colnames(airspeed)
colnames(airspeed) <- c("laden","unladen") 
colnames(airspeed)[1]
colnames(airspeed)[2] <- "Maria"

rownames(airspeed)<-c("row1","row2")

A<-matrix(c(1,2,8,3,2,1),3,2)
A
B<-matrix(c(3,6,1,9,2,7),2,3)
B
C<-matrix(c(1:6),2,3)
C

a<-2
A*a
A+a

Matrix1<-matrix(1,2,2)
Matrix1[1,1] <- 1
Matrix1[1,2] <- 3
Matrix1[2,1] <- 2
Matrix1[2,2] <- -2
Matrix1

Matrix2<-matrix(c(1,2,3,-2),2,2)
Matrix2
rownames(Matrix2) <- c("Row1","Row2")
Matrix2[1,1] 
Matrix2["Row2",1] 
Matrix3 <- matrix(1:6, nrow = 2, ncol = 3)

# Creating a data frame
# data.frame: It is typically used when you want to create a new data frame from scratch 
#or when you have vectors with data that you want to combine into a data frame.
student_data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 26, 22),
  Grade = c("A", "B", "A+")
)

Character_vector <- c("EGFR", "IDH1", "PTEN", "DRAXIN", "TP53","STAT1","BRCA1")
TPM_vector<- c(41.160000, 8.810700, 1.538551, 1.597694, 7.021780,13.131450)
Count_vector<-c(266.46300, 336.22280 , 35.93280 , 22.20487, 148.81750, 193.39085)
Length_vector<-c(902.714,5321.159,3256.633,1937.957,2955.254,2053.586)

# create data.frame () from Character_vector,TPM_vector,Count_vector and Length_vector
# Error?
# create dataframe ussing cbind()
# create matrix using cbind()


my_matrix <- matrix(c(vector1, vector2), nrow = 2, ncol = 3)

# as.data.frame is used to coerce an existing object (a matrix or a list) into a data frame
student_data_2<-as.data.frame(student_data)
Gene_DF_N<-as.data.frame(Gene_DF_N)

#####################################
#LISTS#

l <- list(1, 2, 3)
str(l) #what is this?, the str() function is used to display the internal structure of an R object

vec1 <- letters
vec2 <- 1:4
mat1 <- matrix(1:100, nrow = 5)
df1 <- as.data.frame(cbind(10:1, 91:100))
u.2 <- list(vec1, vec2, mat1, df1, l)

str(u.2)
u.2[1]
str(u.2[1])
u.2[[1]]
str(u.2[[1]])
u.2[[4]][,2]

# give the names for list component
names(u.2) <- c("vec1", "vec2", "mat1", "df1", "l")

#######
# Array
#######
# Creating a 2x3 matrix (2-dimensional array)
my_matrix <- array(1:6, dim = c(2, 3))

# Create a 3-dimensional array
Array <- array(1:24, dim = c(2, 3, 4))

#######################################
library(readr)
Meta_Table_GEO <- read_csv("IntroductionToR/Data/Meta_Table_GEO.csv")
View(Meta_Table_GEO)

########################
# Some basic built-in fucntion 
# ls()
# rm(list = ls())
# help()
# length()
# summary()
# head() and tail()
# print()

#########################################################
####################
#BUILDING FUNCTIONS#
####################
function_name <- function(local_variables){
  
}

calculate_age <- function(birthyear, thisyear=2023){
  #selection, to check if birthyear is valid
  if(birthyear > thisyear){
    print('ERROR: Invalid birth year')
  } else {
    return(thisyear-birthyear)
  }
}

age=calculate_age(2024) #check the global environment pane, now we have age variable (righthand side)
age
# Error?
age=calculate_age(1949)
age


print_information <- function(name, age, city){
  temp1=paste('Full Name:',name)
  temp2=paste('Age:',age)
  temp3=paste('Place of Birth:',city)
  
  #repetition
  for(i in c(temp1,temp2,temp3)){
    print(i)
    
  }
  print(c(temp1,temp2,temp3))
}

print_information('David Beckham', calculate_age(1975), 'London')

#observe the difference between return and print in a function

# Tomorrow
# Specify the file path
file_path <- "~/Desktop/UpgrdPostDoc/Microbiome_00/KCL_Microbiome_2023_24_Module_2/IntroductionToR/Data/Meta_Table_GEO.csv"
# Write the data frame to a CSV file
write.csv(Meta_Table_GEO, file = file_path, row.names = TRUE)
