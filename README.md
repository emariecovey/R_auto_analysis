# R_auto_analysis

## Linear Regression to Predict MPG

This linear regression is trying to predict test cars' fuel efficiency in miles per gallon with the following variables: vehicle length, vehicle weight, spoiler angle, ground clearance, all wheel drive. 

According to the regression output, the intercept, vehicle length, and ground clearance all appeared to significantly impact/predict the cars' MPG. These variables provided a non-random amount of variance to the MPG values in the dataset. The rest of the variables (vehicle weight, spoiler angle, and all wheel drive) likely provided a random amount of variance to the MPG values and did not significanly predict MPG. These variables should be removed from the model, as the model is currently overfitted. 

Overall, the model did predict 71% of the variance among MPG differences in the cars in this dataset (according to the r-squared). The overall p-value is significant, suggesting that the null hypothesis should be rejected and that the slope of the regression line is not 0. The model does effectively predict MPG of the cars in this dataset, but the extraneous variable that are not significant should be removed from the final regression. 

The following image is the regression output for this test: 

![linear regression pic](https://github.com/emariecovey/R_auto_analysis/blob/main/images/linear_regression.png)

## Summary Statistics on Suspension Coils

These summary statistics describe a dataset containing the results from multiple vehicle production lots. In this dataset, the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. 

Design specifications for suspension coils dictate that variance of suspension coils cannot exceed 100 lb/in^2. The variance for Lots 1 and 2 are far below this specification, but variance for Lot 3 is much higher (170), and coils produced in this manufacturing lot are not up to standard. When looking at total variance from all of the lots, it is below the 100 threshold; this shows the benefit of looking at variance from each lot to identify problematic manufacturing. 

The following table is the summary statistics for all manufacturing lots:

![total summary pic](https://github.com/emariecovey/R_auto_analysis/blob/main/images/Total_summary.png)

The following table is the summary statistics grouped for each manufacturing lot:

![by lot pic](https://github.com/emariecovey/R_auto_analysis/blob/main/images/By_lot_summary.png)

