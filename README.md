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

## T-Tests on Suspension Coils

The next tests were t-tests measuring the difference in suspension coil PSI. First, a t-test was performed on all of the lots combined, against the population mean of 1,500 pounds per square inch. Then, each lots' average PSI was compared to the population mean (again, 1500).

The combined-lot t-test had a p-value of .06, which was just above the threshold of signifigance. According to the combined t-test, the average PSI produced by the three manufacturing lots was not significantly different from the population mean of 1500.

The p-values for the first two manufacturing lots were not significant, but the third lot was. Because of this, the third manufacturing lot's mean is statistically significantly different from the population mean. This is not suprising, since the variance for the third lot in the summary statisics above was much higher than the variance in the first and second lots. 

This is the output for the overall t-test:

![overall t test](https://github.com/emariecovey/R_auto_analysis/blob/main/images/overall_t_tests.png)

This is the outputs for the three manufacturing lots:

![by lot t test](https://github.com/emariecovey/R_auto_analysis/blob/main/images/three_t_tests.png)

## Study Design: MechaCar vs Competition

The following is the design of a statistical study to compare performance of the MechaCar vehicles against performance of vehicles from other manufacturers. 

##### Metrics Needed: 

The most important factors in a car (to me personally) are city fuel efficiency and safety rating, since I use my car most often to drive my kids on errands around the city. Because of this, I would want to study MechaCar mean city fuel efficiency and mean safety rating against the mean city fuel efficiency and mean safety rating of all vehicles (population).  

##### Statistical Test: 

Since I would be comparing mechacar means to means of a population of cars, I would use a one-sample t-test. 

##### Null and Alternative Hypotheses:
    - Null hypothesis: the means are not statistically significantly different, and the difference between the means is 0. 
    - Alternative hypothesis: the means are statistically significantly different (either MechaCar vehicles performed better or worse than cars from other manufacturers). The difference between the means is not 0. 

##### Data Required:

I would need a dataset of safety ratings and fuel efficiencies from MechaCar cars, as well as the average safety rating and fuel efficiency for all cars. 