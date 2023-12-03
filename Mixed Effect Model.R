#A lab assignmenet using an in built datasets called sleepstudy from lme4 library to 
#explore and understand the concept of mixed effect model using R

#import the needed library
library(lme4)

#print the first 6 rows of the dataset
head(sleepstudy)

#get more descriptions of the dataset
?sleepstudy

#store the 'sleepstudy dataset in a variable
sleep_study_data <- sleepstudy

## Data Exploration and Descriptive Statistics

#using the 'sapply' function find the missing values accross each column of the dataset
missing_values <- sapply(sleep_study_data, function(x) sum(is.na(x)))

#print your results
print(missing_values)

#summarize the dataset 
summary(sleep_study_data)

#plot a scatter plot to visualuate the change in dependent variable 'reaction' with respect to increase in days of sleep deprivation
scatter_plot <- ggplot(sleep_study_data, aes(x = sleep_study_data$Days, y = sleep_study_data$Reaction)) +
  geom_point( color = 'orange') + labs(title = "Scatter Plot of Reaction Time vs. Days of Sleep Deprivation", x = "Days of Sleep Deprivation", y = "Reaction Time" )

print(scatter_plot)

#check the distribution of the dataset 
hist_plot <- ggplot(sleepstudy, aes(x = Reaction)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Reaction Times", x = "Reaction Time", y = "Frequency")

print(hist_plot)

## Model

model <- lmer(Reaction ~ Days + (1| Subject), data = sleep_study_data)

summary(model)

#The standard deviation is measuring how far apart or the variability of the outcome variable which is due 
#to the random effect, 'subject' introduced in the model. Here we can see that it is 37.12

#Residual is the variability of the outcome variable that is not due to the random variable. 
#This is also called the error of the model prediction when compared with the actual data points

#In the fixed effect output, the slope for the independent variable 'Days' is 10.4673 which shows a positive effect 
#or relationship between the dependent variable response time and independent variable Days of sleep deprivation


#The intercept in the fixed effect output is telling us the response time on day 0 i.e when sleep deprivation is 0.
#This gives an intercept of 251.4051

#Residual Analysis


residual_values <- residuals(model)

residuals_vs_fitted <- ggplot(data.frame(fitted = fitted(model), residuals = residual_values), aes(x = fitted, y = residuals)) +
  geom_point(color = "blue") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Residuals vs. Fitted Values", x = "Fitted Values", y = "Residuals")

print(residuals_vs_fitted)

#from this plot we can deduce that the data points have constant spread among themselves which shows that 
#it obeys the rule of homoscedasticity
#Also we can observe that the the point are randomly distributed accross the horizontal line at point 0

#The polt also show some data points that don't follow the trends and pattern of others. These can be called the outliers
