Comments

Operators: + - * /
	<- # assignment operator
Comparators: == < > 
	TRUE FALSE T F

Print:
	print(var)
Variables:
	x <- 42

	Vectors: #list of same type values
			#c is short for combine
		c(4,7,9)		# Arrays start from 1, not 0
		5:9					#Sequence vector, inclusive, can also decrease
		seq(from,to,step)		#inclusive
		sentence <- c(4,7,9)
		sentence[c(1, 3)]		#get items
		sentence[2:4]				#get range
		sentence[5:7] <- c('the', 'poop', 'deck') #Set in range
			#Strangeness
			a <- c(1, 2, 3)	
			a + 1		#increments every item
			[1] 2 3 4
			a + b #summing different vectors will sum each element, not append
			a == b #compares elements, not whole vectors
		ranks <- 1:3	#Create dictionary/hash map. Name -- value
		names(ranks) <- c("first", "second", "third")

	Matrix: #2d array
		matrix(0, 3, 4) # 0 = values, 3 = rows, 4 = columns
		matrix(a,3,4)		# can set values with vector
			#plank[row,col]	plank[1,] plank[,2:4]

	Factors:
		chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
		types <- factor(chests)	#only unique items
		levels(types) #get the unique values

		weights <- c(300, 200, 100, 250, 150)
		prices <- c(9000, 5000, 12000, 7500, 18000)
		plot(weights, prices)
		plot(weights, prices, pch=as.integer(types))
		legend("topright", c("gems", "gold", "silver"), pch=1:3)
		legend("topright", levels(types), pch=1:length(levels(types)))

	Data frame: #sort of like db tables
		treasure <- data.frame(weights, prices, types)
		print(treasure)
		treasure[[2]]					#get second column
		treasure[["weights"]]	#get column with that name
		treasure$prices				#get column with that name


If/else:

Loops:

Functions:
	help(functionName) 
	example(funcName)
	rep(what, times = 3)
	sum(args)
	sin(arg)
	sqrt(arg)
	plot(x,y)	#x, y are vectors
	contour(matrix)
	persp(matrix) #persp(elevation, expand=0.2)
	image(matrix)
	dim(vector) <- c(2, 4) #2row, 4col  vector <- 1:8

	mean(vector) #average value
	abline(h = mean(vector)) #draw a line with average value
	median(vector) #sort and choose middle one
	deviation <- sd(vector) #standart deviation

	barplot(vectorName) #draw a graph
	barplot(1:100)

	cor.test(matrix$col1, matrix$col2) #test correlation
	line <- lm(matrix$col1 ~ matrix$col2) #calculate linear model
	abline(line) #add the line to graph

Files:
	source("source to file.R")
	list.files() #list files
	read.csv("targets.csv") #read csv file
	read.table("infantry.txt", sep="\t") #read text file with tab separators
	read.table("infantry.txt", sep="\t", header=TRUE) #with column names from file
		targets <- read.csv("targets.csv")
		infantry <- read.table("infantry.txt", sep="\t", header=TRUE)
	merge(x = targets, y = infantry) #merge both tables

Imports:
	install.packages("ggplot2")
	help(package = "ggplot2")