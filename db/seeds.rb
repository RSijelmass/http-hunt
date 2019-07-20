# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
text_first = "Well done! You have made a first request. What do you see the status code is? You can find the status code by doing <>. 
    
Now,  make a request to get the clue 'feeling-lucky'. What is its status code?

Finally, make a request to get the clue 'clue-code-<STATUS_CODE>', where <STATUS_CODE> stands for the found code. It should return a 200."


clue_list = [
  { 
    uuid: 'first-clue',
    text: text_first 
  },
  {
    uuid: 'feeling-lucky'
  },
  {
    uuid: 'status-code-204',
    text: "You are getting good at this, not bad! Now how about a POST request? A POST is a little different, as you don't want to retrieve data (GET data) but give data (POST data)."
  }
]

clue_list.each do |clue|
  Clue.create(uuid: clue[:uuid], text: clue[:text])
end

