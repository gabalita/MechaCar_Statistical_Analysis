#  Car Analysis in R

## Linear Regression to Predict MPG
**Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?**
- The variables that produced non-random variance were ground clearance and vehicle length. 
- Here are the reuslts of the multivariable linear regression:

<img width="501" alt="Screen Shot 2021-10-11 at 11 00 59 AM" src="https://user-images.githubusercontent.com/10199828/136812569-1364ce89-99d9-4875-b115-923bc84f23a0.png">

**Is the slope of the linear model considered to be zero? Why or why not?**
- Mathematically, the slope of the regression line is proportional to the correlation coefficient: slope = r*(SD of y)/(SD of x). Since our R-squared value was 0.71 (therefore, r=0.81), the slope will be nonzero. 

**Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?**
- Since the R-squared value is 0.71, the regression model _does_ predict mpg of MechaCar prototypes _somewhat_ effectively. 
- We know that ground clearance and vehicle length are the statistically significant variables. 
- That being said, because the R-squared value _isn't_ 1, there are other independent variables affecting mpg efficiency (e.g. engine type, speeding, braking). 

## Summary Statistics on Suspension Coils

**Total Summary of Suspension Coils:**
<br><br>
<img width="378" alt="Screen Shot 2021-10-11 at 11 07 18 AM" src="https://user-images.githubusercontent.com/10199828/136813506-8a938b39-a8bf-489a-97dc-6919039e7c14.png">

**Individual Summary of Suspension Coils:**
<br><br>
<img width="430" alt="Screen Shot 2021-10-11 at 11 16 07 AM" src="https://user-images.githubusercontent.com/10199828/136814750-6915a1eb-514f-4e93-9f6d-622f7c8941e1.png">

**Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?**
No, the current data doesn't meet this design specification overall because the overall mean is 1498 PSI. Individually, only Lot 1 and Lot 2 have means of 1500 PSI. Lot 3 doesn't. 

## T-Tests on Suspension Coils
We set up our t-tests with these hypothesis: <br><br>
Null hypothesis: The means of the lots and the manufacturer's standard are equal. <br><br>
Alternative hypothesis: The means of the lots and the manufacturer's standard are different. 

- T-tests were performed to provide more clarity for all lots and each individual lot batch. Our results show that: 
  - If we assume a critical value of 95%, then the t-test shows that the p-value for overall coils is 0.06, which is not enough to reject the null. Therefore, the combined lots do meet the PSI requirement. 
  - Individually, though, Lot 3's p value was 0.04, which meant the null hypothesis was rejected. Therefore, Lot 3's mean is different than the manufacturer's guaranteed mean of 1500 PSI. 
  - <img width="401" alt="Screen Shot 2021-10-11 at 11 11 54 AM" src="https://user-images.githubusercontent.com/10199828/136814172-c5781d87-1151-4544-873c-5d81fd01fd46.png">
  - <img width="676" alt="Screen Shot 2021-10-11 at 11 09 15 AM" src="https://user-images.githubusercontent.com/10199828/136813791-c5a7c927-d59c-4914-b364-5f85428ad966.png">

## Study Design: MechaCar vs Competition

A future study to quantify how the MechaCar performs against competition would test the following variables: cost, city or highway fuel efficiency, horse power, maintenance cost, safety rating, and an overall aggregate score rating of all these variables. Each factor of our MechaCar prototypes would be compared against vehicles in similar classes (truck, sedan, minivan, etc.) 

The hypothesis would follow this basic structure:
- Null: The means of [variable] are equal.
- Alternative: The means of [variable] are different. 

Simple t-tests could be performed for each variable. To do the t-test, we would need the exact same data (cost, efficiency, etc.) for each vehicle type within the same class of other car brands. 
