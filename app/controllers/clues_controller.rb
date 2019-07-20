class CluesController < ApplicationController
  def index
  end

  def create
  end

  def show
    @clue = Clue.where(uuid: params[:uuid]).first
  end
end
