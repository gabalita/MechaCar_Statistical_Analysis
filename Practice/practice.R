install.packages("tidyverse")

install.packages('jsonlite')

x <- 3
x <- 5

demo_table <- read.csv(file='demo.csv',check.names=FALSE,stringsAsFactors = FALSE)

View(demo_table)
demo_table[3,"Year"]
demo_table$Vehicle_Class
demo_table$Vehicle_Class[2]
library(jsonlite)

x <-7

demo_table2 <- fromJSON(txt='demo.json')

filter_table <- demo_table2[demo_table2$price > 10000,]

filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status) #filter by price and drivetrain

# How to sample two-dimensional data structure
num_rows <- 1:nrow(demo_table)
sample_rows <- sample(num_rows, 3)
demo_table[sample_rows,]

# in one single line
demo_table[sample(1:nrow(demo_table),3),]

library(dplyr)
demo_table <- mutate(demo_table, Mileage_per_year = Total_Miles/(2020-Year), isActive=TRUE)
View(demo_table)

summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') #create summary table
summarize_demo <- demo_table2 %>% 
  group_by(condition) %>%
  summarize(Mean_Mileage=mean(odometer),
            Maximum_Price=max(price),
            Num_Vehicles=n(), .groups = 'keep') #create summary table with multiple columns

demo_table3 <- read.csv('demo2.csv', check.names = F,
                        stringsAsFactors = F)
View(demo_table3)

long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
wide_table <- long_table %>% spread(key="Metric",value="Score")

View(long_table)
View(wide_table)

all.equal(demo_table3,wide_table)
table <- demo_table3[,order(colnames(wide_table))]
all.equal(demo_table3,table)

plt <- ggplot(mpg,aes(x=class)) #import dataset into ggplot2
plt + geom_bar() #plot a bar plot

mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') #create summary
View(mpg_summary)
plt <- ggplot(mpg_summary, aes(x=manufacturer, y=Vehicle_Count)) 
plt + geom_col()

plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + #plot a boxplot with labels
theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees

mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) #import dataset into ggplot2
plt + geom_line()

plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) #add line plot with labels

plt <- ggplot(mpg,aes(x=displ,y=cty,color=class, shape=drv)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class", shape="Type of Drive") #add scatter plot with labels
View(mpg)

plt <- ggplot(mpg,aes(y=hwy))
plt + geom_boxplot()

plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + #add boxplot
theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
geom_point()


mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars


mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)


plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type))
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees

ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

# The geom_density() function plots a numerical vector by creating buckets of similar values and calculating the density
# (number of bucket data points/total number of data points) for each bucket.

shapiro.test(mtcars$wt)
shapiro.test(mpg$cty)


population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F)
plt <- ggplot(population_table,aes(x=log(Miles_Driven)))
plt + geom_density()

sample_table <- population_table %>% sample_n(50)
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven)))
plt + geom_density()

# To see if your sample size is big enough, use a t-test (or mean test)
#compare sample versus population means
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))
# t.test(sample_field, mu=mean(population field))

# Test correlation between two variables, x and y
head(mtcars)
# First plot the graph
plt <- ggplot(mtcars,aes(x=hp,y=qsec))
plt + geom_point()
# correlation
cor(mtcars$hp,mtcars$qsec)
# correlation matrix
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F)
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")])
cor(used_matrix)

#  linear regression can be used as a predictive modeling tool
# A good linear regression model should approximate most data points accurately 
# if two variables are strongly correlated. 

# A good linear regression model should approximate most 
# data points accurately if two variables are strongly correlated. 

# We'll test whether or not quarter-mile race time (qsec)
# can be predicted using a linear model and horsepower (hp).

model <- lm(qsec ~ hp, mtcars)
#y=mx+b
yvals <- model$coefficients['hp']*mtcars$hp + model$coefficients['(Intercept)']
summary(lm(qsec ~ hp, mtcars))

plt <- ggplot(mtcars, aes(x=hp,y=qsec))
plt + geom_point() + geom_line(aes(y=yvals),color='red')

#  A multiple linear regression uses multiple independent variables to account 
# for parts of the total variance observed in the dependent variable.

model <- lm(qsec ~ mpg + disp + drat + wt + hp, data=mtcars)
summary(model)

# When an intercept is statistically significant, it means
# that the intercept term explains a significant amount of variability
# in the dependent variable when all independent vairables are equal to zer



