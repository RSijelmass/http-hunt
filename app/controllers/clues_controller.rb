class CluesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @clue = Clue.new clue_params
    @clue.text = @clue.text + "\n\n" + extra_post_text
    @clue.save

    @name = params[:text].gsub('This is my secret text, no one knows my name is', '')
    @name = @name.gsub('!', '')
    render status: 201
  end

  def update
    render status: 500 unless params[:text].include? 'I am updating our secret'

    @clue = Clue.where(uuid: params[:uuid]).first
    @clue.update clue_params
    @clue.text = @clue.text + "\n\n" + extra_put_text(@clue.uuid)
    @clue.save
  end

  def show
    @clue = Clue.where(uuid: params[:uuid]).first
    render status: 404 unless @clue

    if params[:uuid] == 'feeling-lucky'
      render status: 418 
    end
  end

  def destroy
    Clue.where(uuid: params[:uuid]).each(&:destroy!)
  end

  private

  def clue_params
    params.permit(:uuid, :text)
  end

  def extra_post_text
    '------------------------------------

Great job! You`re so close to the end now. Let`s try somtething else and make a PUT request. That is updating an existing clue we already have in the database.
    
    A PUT request, made through our curl tool, can be done in almost the same way as a POST request. An example of a PUT request could be that Mexican is no longer my favourite food, so I want to change that in our database. To make this change I would do the following:
     curl -X PUT -d `favourite-food=chinese` http://www.example.com/users/rita
     Note that now my URL indicates on which object in the database I want to make a change, so keep that in mind if we want to change a clue.
    
     How do you think we can update the clue that we have just created ourselves? Try to update our last clue, with the text `I am updating our secret.` I have made sure the output will give you a new clue when done correctly!'
  end

  def extra_put_text(uuid)
    "-----------------------------------------

Yes, we have made a PUT request! Very good job. Now try to make the same GET request to the clue you have just updated, /#{uuid}. Has the clue`s text changed to what you expected it to?

    Now let`s do the last one, deleting something from the database. You might guess this one already, but to help you out: if I no longer want to have my information about favourite food in the database, I can delete it by using the following command

    curl -X DELETE http://example.com/user/rita

    How do you think it`ll work to delete our clue? To double check, make another GET request after deleting the clue. Can you find it still? What status code do we see with the GET request?"
  end
end
