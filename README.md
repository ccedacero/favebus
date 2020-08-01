# FaveBus

![FaveBus App](https://i.imgur.com/KSZ8apo.png)
Functionality: The app needs an MTA key to fetch the data. For security reasons, this key has not been included. If you'd like to see App functionality, please refer to this video:  
https://www.youtube.com/watch?v=hNDIfZTDAq8

When I was living in Washington, DC I started using a bus tracking app to make sure I knew when the bus was coming so that I could get to work on time. That app was free to use and was simple, but I used it everyday. This is why I thought It would be a great idea to explore how transit aps work and build my own bus tracking app. 

FaveBus uses the NY Metropolitan Transit Authority(MTA) Bus API to fetch realtime bus data to allow users to track buses and bus stations. 

## App Features 
- Users are able to register for user accounts 
- Users are ble to Favorite the buses they'd like to track
- Users are able to update their account information
- Users are able to Check a Bus Station Traffic (Up to the next 5 different bus routes approaching) 
- Tracking details provides estimated arrival time along with realtime bus distance by number of stops or miles depening on how far a bus is.

## Technologies Used 
- Ruby on Rails Backend
- BootStrap 
- SQLite databse 
- gem httparty
- gem faker
- gem bcrypt
##### Project status :
This is the first version of the app and due to BootCamp time contraints, the current version includes all features above, but I limited the number of buses and stations to track to a minimum because my local server would slow down when rendering all Bus Stops in NYC. This version will be replaced by a version built using React in August. Stay tunned for the release. 

## License
[MIT](https://choosealicense.com/licenses/mit/)
