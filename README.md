# The hunt for HTTP

This is the hunt for HTTP!

## Steps for Setup
### First Step
First, we need to load some basic packages that are attached to this project.
Run:
```
bundle install
```

### Second Step
Now we need to initialise our database: this is where all the clues are stored.
This may sound scary, but thanks to the magic of Rails (the programming
framework I've built this in) this is all done by one simple line:
```
rake db:create db:migrate db:seed
```
If you haven't worked with databases before, don't worry about how it works.
For those that are curious:
- `db:create` unsurprisingly creates the database,
- `db:migrate` uses some magic to set up the objects
- `db:seed` fills the set up database with the clues I have written.

### Third Step
Then, we need to run the server. This is making sure people can make requests
to our database, where we store the clues. To do this, run:
```
bin/rails server
```
It is important that you run this in a terminal that you won't close, because
as soon as you close it you'll server will no longer be up.

## Making HTTP requests
Normally, every time you are in the browser and you type in a URL you are
making an HTTP request. This can however also be done in the command line! You
are turning your terminal into a very basic browser. The output won't be as
pretty, but it can be helpful. For example, it is very easy to see what status
code is attached to each request.

We can mock typing into the browser by using the program `curl`. cURL stands
for Client URL, so that makes sense considering we are the client that makes
a request to the server for information.

Because we are not connected to the internet, we use something called
`localhost`. You can see it as your computer's own, local version of the
internet. 

You can see this, if the server is running, on any browser. Type in
`localhost:3000` on your browser. What do you see? 

It's our very basic app! To see this homepage in your terminal, you can type in:
```
curl localhost:3000
```

All clues are hidden under `localhost:3000/clues`. To get started with the scavenger hunt for clues, you can make your first GET request by getting `first-clue` like so:
```
curl localhost:3000/clues/first-clue
```

To read the clue, make sure to read what is within the `<body>` tags.
