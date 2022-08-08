library(jsonlite)

?fromJSON

demo_table2 <- fromJSON("demo.json")

filtered_table <- demo_table2[demo_table2$year > 2013,]
?subset()

library(tidyverse)
?mutate()

demo_table <- demo_table %>% mutate(Miles_per_year=Total_Miles/(2020-Year),IsActive=TRUE)

summary_table <- demo_table2 %>% group_by(condition) %>% summarize(Average_Milage=mean(odometer), .groups="keep")

?gather()

demo_table3 <- read.csv("demo2.csv", check.names = F,stringsAsFactors = F)

long_table <- gather(demo_table3, key="Metric", value="Score", buying_price:popularity)

?ggplot()

head(mpg)

# bar chart with one variable 
plt <-ggplot(mpg, aes(x=class)) #telling R which data to use for plot
plt + geom_bar() #telling R which type of plot to use (expects just one variable)

# bar chart with two variables
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(vehicle_count=n(), groups="keep")
plt <- ggplot(mpg_summary, aes(x=manufacturer, y=vehicle_count))
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + 
  theme(axis.text.x=element_text(angle=45, hjust=1)) #rotate x-axis labels 45 degrees

# line chart
mpg_summary <- subset(mpg, manufacturer=="toyota") %>%
  group_by(cyl) %>%
  summarize(Mean_Hwy=mean(hwy), .groups="keep")
plt <- ggplot(mpg_summary, aes(x=cyl, y=Mean_Hwy))
plt + geom_line(linetype="dashed") + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks=c(15:30)) + geom_point()

# Scatter plot
plt <- ggplot(mpg, aes(x=displ, y=cty, color=class, size=cty, alpha=cty))
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel Efficiency (MPG)", color="Vehicle Class") 

# Box plot
plt <- ggplot(mpg, aes(x=manufacturer, y=hwy, color=manufacturer))
plt + 
  geom_boxplot(linetype="dashed") + #makes lines around box plots dashed
  theme(axis.text.x=element_text(angle=45, hjust=1)) + #makes x axis labels rotated 45 degrees
  labs(x="Manufacturer", y="Highway Fuel Efficiency (MPG)") + 
  geom_point() #overlays scatter plot on top 

# Heat map
mpg_summary <- mpg %>% group_by(class, year) %>% summarize(Mean_Hwy=mean(hwy), .groups = "keep")
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year), fill=Mean_Hwy))
plt + geom_tile() + labs(x="Vehicle Class", y="Vehicle Year", fill="Mean Highway (MPG")+ theme(axis.text.x=element_text(angle=45, hjust=1))


#scatterplot with error bars around mean
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), SD_Engine=sd(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + 
  geom_point(size=4) + 
  labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot
  geom_errorbar(aes(ymin=Mean_Engine-SD_Engine, ymax=Mean_Engine+SD_Engine)) #overlay with error bars

mpg1<-mpg

head(mpg)
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

#practice with facets
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + 
  geom_boxplot() + 
  facet_wrap(vars(MPG_Type)) + #THIS IS THE LAYER THAT SPLITS PLOTS INTO SEPERATE GROUPS
  theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees


plt <- ggplot(mpg, aes(x=displ, y=cty, color=class, size=cty, alpha=cty))
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel Efficiency (MPG)", color="Vehicle Class") +
  facet_wrap(vars(drv))

#visual to look for normality
ggplot(mtcars, aes(x=wt)) + geom_density()

#test to see normality (gives a p-value)
shapiro.test(mtcars$wt)

#-------------------------------------
#STATS SECTION
#-------------------------------------

#random sampling example:
population_table<-read.csv("used_car_data.csv", check.names = F,stringsAsFactors = F)
ggplot(population_table, aes(x=log10(Miles_Driven)))+ geom_density()

sample_table <- population_table %>% sample_n(50) #sample_n takes a sample of rows from dataframe
sample_table2 <- population_table %>% sample_n(50) #a second sample for the two-sample t-test

plt <- ggplot(sample_table, aes(x=log10(Miles_Driven)) )
plt+geom_density()

#one-sample t-test
t.test(log10(sample_table$Miles_Driven), alternative="two.sided", mu=mean(log10(population_table$Miles_Driven)))

#two-sample t-test
t.test(x=log10(sample_table$Miles_Driven), y=log10(sample_table2$Miles_Driven), alternative="two.sided")

mpg_data <- read.csv("mpg_modified.csv")
mpg_1999 <- mpg_data %>% filter(year==1999)
mpg_2008 <- mpg_data %>% filter(year==2008)
#paired t-test (observations are from same subjects)
t.test(mpg_1999$hwy, mpg_2008$hwy, paired=TRUE, alternative="two.sided")

head(mtcars)

#one-way ANOVA (R expects all vectors to be in same dataframe, unlike with t-tests)
mtcars_filt <-mtcars[,c("hp", "cyl")] #filters columns
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #factor converts column from numerical interval vector to categorical vector
summary(aov(hp~cyl,data=mtcars_filt) )#formula part: dependentvariable ~ indepvariable + indepvariable #summary gives the pvalue

#correlation
ggplot(mtcars, aes(x=hp, y=qsec)) + geom_point()
cor(mtcars$hp, mtcars$qsec) #calculate correlation coefficient

#creating correlation matrix:
used_matrix <- as.matrix(population_table[,c("Selling_Price","Present_Price","Miles_Driven")]) #converts data to numeric matrix and limits to three columns
cor(used_matrix)

#simple linear regression:
lm(qsec~hp, mtcars) #gives regression line values
summary(lm(qsec~hp, mtcars)) #gives r^2 value and p-value

#plotting line from linear regression
model <- lm(qsec~hp,mtcars) 
yvals <- model$coefficients["hp"]*mtcars$hp + model$coefficients["(Intercept)"]

plt <- ggplot(mtcars, aes(x=hp, y=qsec))
plt + geom_point() + geom_line(aes(y=yvals), color="red")

#multiple linear regression
lm(qsec~ mpg + disp + drat + wt + hp, data =  mtcars)
summary(lm(qsec~ wt + hp, data =  mtcars))

summary(lm(qsec~ mpg + disp + drat + wt + hp, data =  mtcars))

#chi-squared test
tbl <- table(mpg$class, mpg$year)
head(tbl)
chisq.test(tbl)

tbl2 <- table(mpg$manufacturer, mpg$drv)
head(tbl2)
chisq.test(tbl2)


