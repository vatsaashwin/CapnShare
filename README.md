# README

Have you ever thrown out food just because you didn’t have time to eat and it expired? Have you ever bought a whole kit of baking products to make a single cake and never used it again? Got a lot of leftovers and don’t know what to do? Leaving home for a week and got lots of food in the refrigerator? DON’T throw it away. Share it with CAP’NSHARE!

        ***One man's trash is another man's treasure!***
Cap’nShare is a system where users can post pictures of the food items they would like to share with others. Interested people can mark the post and connect with the owner to collect it from them. Or, users can opt to drop off the food as per their convenience! Users can also donate their items to food shelters available near them.

The purpose of the application is to encourage distribution of food items that may otherwise go to waste sitting somewhere in the kitchen cabinet or refrigerator. This is something that can be used by every one and especially work well in a university town like ours. Hence, there would not be any issue gathering people to use this system. If time permits, team can also contact OSU dining services to gather more users for the system.

If you are someone who would be interested to use this system or would like to help build it, contact me for further details.

Tech/tools/versions: Ruby 2.5.0 Rails 5.2.2 DB: SQLite Desployment Server: Heroku

Running on localhost:

1) sudo bundle install

2) sudo bundle update

3) Please Use Schema Load for DB Creation as I have hard reset it (29-Jan-2018)
   Inital Set Up Do:
   rake db:schema:load 
   Otherwise
   rails db:migrate

4) Modify development.rb file Put Applications Gmail Email Credentials (Only Required in DEV/TEST)
    user_name:      'ENTER EMAIL ID'
    password:       'ENTER PASSWORD'
    domain:         'HOST:PORT'
    
5) Step for Hashing Images location (Only Required in DEV/TEST)
       In food.rb file,
       Put hash_secret: "Please Add Key Here"
       Hash_Secret can be generated using rails secret command 


URL: http://capnshare.herokuapp.com
