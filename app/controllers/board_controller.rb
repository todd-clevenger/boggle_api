class BoardController < ApplicationController
  
  # following the create convention - even though not using resource: BoggleBoard with constraints
  def create
    @board = BoggleBoard.new
    render json: @board
  end
  
  # looks up a word in an online english dictionary to validate that the word exists
  # in the english language
  # TODO:  Move this method to it's own controller and name it create
  def check_word
    render json: true
  end
end
