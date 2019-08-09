# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
text_first = 'Well done! You have made a first request. What do you see the status code is? You can find the status code by making the same curl request, but now type
`curl -i [URL]`. 

Now,  make a request to get the clue "feeling-lucky". What is its status code?

Finally, make a request to get the clue "clue-code-STATUS_CODE", where STATUS_CODE stands for the found code. It should return a 200.'


clue_list = [
  { 
    uuid: 'first-clue',
    text: text_first 
  },
  {
    uuid: 'feeling-lucky'
  },
  {
    uuid: 'status-code-418',
    text: "You are getting good at this, not bad! Now how about a POST request? A POST is a little different, as you don`t want to retrieve data (GET data) but give data (POST data).
    
    So, right now let's try making a clue ourselves. Each clue has a UUID (a universally unique identifier, just a fancy version of an ID) and text. Make a POST request with the following attributes: uuid='my-post-clue' and text='This is my secret text, no one knows my name is NAME!'. Make sure to change NAME by your own name. The URL you're posting this to is `localhost:3000/clues`

    To give you a hint how to do this in curl, here is an example:
    curl -d 'name=rita&favourite-food=mexican' http://example.com/

    If you get stuck, feel free to reach out for help!

    When you make the curl request, what do you see in the body? 
    
    When you're done with this, make a GET request to `my-post-clue`. What do you see in the body here?"
  }
]

clue_list.each do |clue|
  Clue.create(uuid: clue[:uuid], text: clue[:text])
end

