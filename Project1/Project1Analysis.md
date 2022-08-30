First I wanted to find the total number of: 
* Cases Worldwide
* Total Suspected Cases
* Total Hospitalized
* Total Traveled
* Total Non-travelers

![Q](https://user-images.githubusercontent.com/112139192/187313081-c86e7aa5-165a-4423-9365-2d9ad1b200fe.PNG)

I used a simple ```SUM``` function for 5 of the different columns 

![Q(3)](https://user-images.githubusercontent.com/112139192/187313494-50d2cf78-ad5f-4eff-b43e-03f914c24753.PNG)

I collected all of the symptoms from the Worldwide_Case_Detection_Timeline file and used the PROPER function
to properly display the values.

![Q(4)](https://user-images.githubusercontent.com/112139192/187317604-fa0695a7-8949-4568-8c3e-0c835830f223.PNG)
![Q(4)(2)](https://user-images.githubusercontent.com/112139192/187317673-60915783-ec10-4da1-a471-6617d02ff825.PNG)


Then I delimited by comma for each symptom so I can count each individual symptom

![Q(5)](https://user-images.githubusercontent.com/112139192/187318127-8134bf38-fb26-40bf-8701-fe98b5395038.PNG)
![Q(5)(2)](https://user-images.githubusercontent.com/112139192/187318221-2f840599-21e2-4061-8d47-3218a2216222.PNG)

Finally I used a series of IFS functions to categorize each symptom

![Q(6)](https://user-images.githubusercontent.com/112139192/187318781-a92fd8ee-b869-483c-ac8f-ddf46841e306.PNG)
![Q(6)(2)](https://user-images.githubusercontent.com/112139192/187319062-15c782ab-3385-4aeb-8759-40a55d655df7.PNG)


***Note: There were numerous IFS functions to categorize each symptoms. I know there is a easier way to do this but at the time I settled with that**

## Created 6 pivot tables to create a dashboard
* Sum of Confirmed Cases per Country
* Max Hospitalized per Country
* Travel History per Country
* Sum of Confirmed Cases per Country (Geography Map)
* Total Symptoms 
* Total Cases, Total Hospitalized, Total Travelers, Total Non-Travelelers

![Q(7)](https://user-images.githubusercontent.com/112139192/187341107-cc7fbebb-0ce7-4dc6-967d-9e236253734f.PNG)

## 1. What Country has the highest number of cases?

![Q1](https://user-images.githubusercontent.com/112139192/187341676-b61b08ec-2673-4e89-bcec-5ef0d4a5db89.PNG)

United States has the highest number of cases at 17,336

## 2. What symptom occurs the most?

![Q2](https://user-images.githubusercontent.com/112139192/187341781-b64eb01f-23c5-4f93-9343-4b1e2187af04.PNG)

Fatigue occurs the most amongst the other symptoms at 66

## 3. What Country has the most travelers?

![Q3](https://user-images.githubusercontent.com/112139192/187341983-dc150266-e302-4741-ac73-f77c633a2aca.PNG)

United States has the most travelers at 41

## 4. What Country has the most non travelers?

Just like the previous question, United States and leading with the most non travelers at 11

## 5. Total number of hospitalizations within countries worldwide?

![Q4](https://user-images.githubusercontent.com/112139192/187342330-1a189c2c-948c-4261-8d2e-e588ffcfeacb.PNG)

Italy and Germany are leading with the most hospitalizations at 18

Interestingly United States has the most number of cases worldwide but has 4 hospitalizations

## 6. Total number of symptoms?

![Q6](https://user-images.githubusercontent.com/112139192/187343139-77b0be07-437f-44ab-8df2-136de90e0c68.PNG)

Total number of symptoms are 151

This number is fairly low, for example, inside the CSV file, Worldwide_Case_Detection_Timeline, in the symptoms column most of the entries are blank and I assume it's because most of the people don't show symptoms. If that's the case then majority of people won't show any symptoms.



