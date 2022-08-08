# R_auto_analysis

## Linear Regression to Predict MPG

This linear regression is trying to predict test cars' fuel efficiency in miles per gallon with the following variables: vehicle length, vehicle weight, spoiler angle, ground clearance, all wheel drive. 

According to the regression output, the intercept, vehicle length, and ground clearance all appeared to significantly impact/predict the cars' MPG. These variables provided a non-random amount of variance to the MPG values in the dataset. The rest of the variables (vehicle weight, spoiler angle, and all wheel drive) likely provided a random amount of variance to the MPG values and did not significanly predict MPG. These variables should be removed from the model, as the model is currently overfitted. 

Overall, the model did predict 71% of the variance among MPG differences in the cars in this dataset (according to the r-squared). The overall p-value is significant, suggesting that the null hypothesis should be rejected and that the slope of the regression line is not 0. The model does effectively predict MPG of the cars in this dataset, but the extraneous variable that are not significant should be removed from the final regression. 

The following image is the regression output for this test: 

![linear regression pic]("https://github.com/emariecovey/R_auto_analysis/blob/main/linear_regression.png)
