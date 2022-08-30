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


