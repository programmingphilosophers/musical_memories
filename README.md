# Musical Memories app

### Create memories [here](http://45.55.238.138/).
Remember that album you used to listen to back in the day. Remember the place, the people? Build a book album covers with personal recollections for each with the Musical Memories app.

### add image of app here
![alt image text]((https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

### Technologies used
* Sinatra MVC: Similar to shopping list app.
* Sinatra routing: To get, post and execute ruby code blocks, interacting with .erb files etc.
* Active Record ORM: Used to map application to database with postrgres.
* BCrypt: BCrypt::Password.create(pwd) used to create (encrypted) "password_digest" value stored in database. Authenticate method in Account.rb model checks password match at login.
* Javascript: Used for DOM interactions (eventListeners, interactive DOM modifications, ajax call...)
* HTML forms: To accept user input and transmit parameters both hidden and seen.
* Ajax call to spotify api with user supplied artist parameter.
* Bootstrap: Adam created a carousel prototype with bootstrap to scroll through images and related text table. This was modified to fit existing site styles created with Skeleton.
* Digital Ocean: Droplet configured and associated with this github repo.


*
### Project Approach

* We brainstormed ideas and quick rough wireframes. We simulated user stories using Google Music artist albmum lookup to see what experience we wanted to create and repeated this with a friend. Read and see our user stories, ERD's and  wireframes [here.](https://docs.google.com/presentation/d/1ZhfC3Cqa7CvaiTzcQUD2xVrAqudT6L4q1gGsjzXPHWE/edit#slide=id.g74d139cf2_0_34)
* We agreed on features and technologies.
* We split up tasks. We both had our working sinatra list apps with authentication to use as a foundation.
* If I (Adam) had project to do over again I would have worked early on to clarify ownership of different tasks as well as understand Github collaboration process.

### Unsolved Problems
