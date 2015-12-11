# HEROKU BUGS routes that work and don't
# account controller work
logout
portal
/ (goes to portal)
login
registration (but layout issues)
# account dont work (and error mssgs)
enter (from login) ("internal server error")
register (404)
account_info (redirect to portal)
update_account (redirect to portal)
# memories ctrlr. none work. all give 404 error
/
/list
/create
/mem_list
/update/:id
/update
/destroy/:id
/destroy



# APPLICATION CONTROLLER
* usual stuff.

# ACCOUNT CONTROLLER
* config maps at /
* / > call authorization_check: session? > not_auth or ../memories

post /enter do > user params make tempAccount and tempPass. why?
   & authenticate using those params.
   set mssg to welcome or to incorrect
   redirect to ../memories or login  

/logout > set session to nil

get /registration do > erb :registration

post /register do (when someone registers) >
   tempAccount, mail, pass with params
   new_user (account)
   temp vars > new_user.user_name etc vars
   new session with new_user
   @messsage = acct added


# MEMORY CONTROLLER

config maps > routes at /memories/route

? - why def authorization_check method here and in acccount.rb?

get / do > auth check then @mem = Mem.all. > :read


JAVASCRIPT FILE  

doc.getElementById param search-form access all html files get data from search form.
   listen for submit, on submit > function(e) (what is e?? )
      { e.preventDefault() =  ?? }
      { searchAlbums w arg of query.value } (form talking to js via id's)
      false (third arg of addEventListener) = ?

searchAlbums function uses query (user's artist value from form)
   ajax call to spotify api with artist: = query.
   successs functino uses data arg
      rsults.html = ?
      results.append Results heading
      log winner and data in a table.
      for loop thru data.albums (albums of artist)
         items are the data for each album
         create var temp result for later appending below results heading
         temp result is a form that posts to memories/create page
            form is populated with inputs
               hidden name=memory[album] value album[i].name
               hidden name=memory[artist] value user's query id value
               album.ite[i].name (display name?)
               album.item[i].images[1].url (display first image of cover)
               sumbmit element "Begin Memory"











<!-- end -->
