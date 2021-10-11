# Deliverable 1
# import library
library(dplyr)
library(tidyverse)

# read in csv
df <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)
View(df)

# Assign variable to vector of column names
colnames_df <- colnames(df)
print(colnames_df)

# Create multiple linear regression line
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle 
            + ground_clearance + AWD + mpg,data=df)

summary(model)
# The R-squared value is 0.71
# The p-value is 5.35e-11
# The variables that produced non-random variance are vehicle length 
# and ground clearance
# Yes, this linear model predicts mpg pretty well because of R-squared

# Linear regression for Vehicle Length
model_vl <- lm(mpg ~ vehicle_length, df)
summary(model_vl)
# R-squared is only 0.37

# Linear regression for Ground Clearance 
model_gc <- lm(mpg ~ ground_clearance, df)
summary(model_gc)
# R-squared is 0.1

install.packages("ggpubr")
library(ggpubr)
# Test correlation of mpg and Ground Clearance
plt <- ggplot(df,aes(x=ground_clearance,y=mpg)) + 
  geom_smooth(method='lm',se = FALSE) + 
  geom_point() +
  stat_regline_equation(label.y = 80, aes(label = ..eq.label..)) +
  stat_regline_equation(label.y = 60, aes(label = ..rr.label..))
plt + ggtitle("Plot of ground clearance \n by mpg")
# correlation
cor(df$ground_clearance,df$mpg)


# Multiple linear regression for ground clearance and vehicle lenght
model_vl_gc <- lm(mpg ~ vehicle_length + ground_clearance, data=df)
summary(model_vl_gc)

# Deliverable 2
# Import csv 
df_coil <- read.csv('Suspension_Coil.csv', check.names = F,stringsAsFactors = F)
View(df_coil)

# Create summary dataframe of PSI
summary_df <- df_coil %>% summarize(Mean_PSI=mean(PSI),
          Median_PSI=median(PSI),
           Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
View(summary_df)

# Create a lot summary
summary_lot <- df_coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),
            Median=median(PSI),
            Variance=var(PSI),
            SD=sd(PSI),.groups = 'keep')
View(summary_lot)

# Deliverable 3
# t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))
t.test(df_coil$PSI, mu=1500)

# Results of t-test show that the mean PSI of all coils is 
# 1498, which is not equal to 1500. The p value is 0.06, which is 
# not enough to reject the null hypothesis. 

# Lot 1 
Lot1_Subset <- subset(df_coil,Manufacturing_Lot=="Lot1") 
t.test(Lot1_Subset$PSI, mu=1500)

# Lot 2
Lot2_Subset <- subset(df_coil,Manufacturing_Lot=="Lot2") 
t.test(Lot2_Subset$PSI, mu=1500)

# Lot 3
Lot3_Subset <- subset(df_coil,Manufacturing_Lot=="Lot3") 
t.test(Lot3_Subset$PSI, mu=1500)

# Create a lot summary
summary_vector <- c("Reject Alternative, Meets 1500 requirement",
                    "Reject Alternative, Meets 1500 requirement",
                    "Reject Null, Doesn't Meet 1500 requirement")
summary_lot$MeetsReq <- summary_vector

View(summary_lot)







