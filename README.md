Event plannin API
=================

API's ('xml' format by default):

	1. GET Future events:  
	http://localhost:3000/api/events?interval=(:number)d  
	where (:number) - the number of days from now till date you are interested in to get all events in this period 

	2. Feed (latest changes of current_user events(comments and files)):  
	http://localhost:3000/api/feed  or  
	http://localhost:3000/api/feed.json
	 
The GUI is in progress
