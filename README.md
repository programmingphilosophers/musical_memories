# Musical Memories app

### Create memories [here](http://45.55.238.138/).
Remember that album you used to listen to back in the day. Remember the place, the people? Build a book album covers with personal recollections for each with the Musical Memories app.

### add image of app here
![alt image text]('public/memories_screenshot.png')
![mobile image]('https://github.com/programmingphilosophers/musical_memories/blob/master/public/Site%20on%20mobile.png.jpeg?raw=true')


### Technologies used
* Sinatra MVC: Similar to shopping list app.
* Sinatra routing: To get, post and execute ruby code blocks, interacting with .erb files etc.
* Active Record ORM: Used to map application to database with postrgres.
* BCrypt: BCrypt::Password.create(pwd) used to create (encrypted) "password_digest" value stored in database. Authenticate method in Account.rb model checks password match at login.
* Javascript: Used for DOM interactions (eventListeners, interactive DOM modifications, ajax call...). Velocity used for animations.
* HTML forms: To accept user input and transmit parameters both hidden and seen.
* Ajax call to spotify api with user supplied artist parameter.
* Bootstrap: Adam created a carousel prototype with bootstrap to scroll through images and related text table. This was modified to fit existing site styles created with Skeleton.
* Digital Ocean: Droplet configured and associated with this github repo.

### Project Approach

* We brainstormed ideas and quick rough wireframes. We simulated user stories using Google Music artist album lookup to see what experience we wanted to create and repeated this with a friend. Read and see our user stories, ERD's and  wireframes [here.](https://docs.google.com/presentation/d/1ZhfC3Cqa7CvaiTzcQUD2xVrAqudT6L4q1gGsjzXPHWE/edit#slide=id.g74d139cf2_0_34)
* We agreed on features and technologies.
* We split up tasks. We both had our working shopping list apps with authentication to use as a foundation.
* If I (Adam) had project to do over again I would have worked early on to clarify ownership of different tasks as well as understand Github collaboration process.

### Significant Hurdles
* Passing variables between methods and forms. Keeping track of them. Leveraging embedded Ruby more powerfully.

### Unsolved Problems
* Iphone animations: Slide animations look terrible on iphones so we removed them from live version.
* Github collaboration: We were shy of using github pushes and pull and the git system so exchanged files etc. outside via slack, email etc.  
* Dynamically generated DOM elements may not be the best way to do things. We did this due to our backend limitations. We kept stuff from api in memory on the front end until we had the user input added and then created the database entry all at once.
