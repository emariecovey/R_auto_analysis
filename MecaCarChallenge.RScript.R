library(dplyr)

#remember to set working directory before importing csv
car_data<-read.csv("MechaCar_mpg.csv", check.names=F, stringsAsFactors = F)
coil_data<-read.csv("Suspension_Coil.csv", check.names=F, stringsAsFactors = F)

head(car_data)
head(coil_data)

#linear regression on car dataset to predict MPG
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, car_data)
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, car_data))

#Total Summary Statistics for coil dataset
total_summary<-coil_data %>% summarize(Mean=mean(PSI), Median=median(PSI), Varience=var(PSI), SD=sd(PSI), .groups="keep")

#Summary Statistics for coil dataset by manufacturing lot
by_lot_summary<-coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Varience=var(PSI), SD=sd(PSI), .groups="keep")

#one sample t-test for psi among all manufacturing lots
t.test(x=coil_data$PSI, mu=1500)

#one sample t-tests for psi for each manufacturing lot
t.test(x= coil_data$PSI[coil_data$Manufacturing_Lot=="Lot1"], mu=1500)

t.test(x= coil_data$PSI[coil_data$Manufacturing_Lot=="Lot2"], mu=1500)

t.test(x= coil_data$PSI[coil_data$Manufacturing_Lot=="Lot3"], mu=1500)


