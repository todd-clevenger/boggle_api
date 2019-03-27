class BoardController < ApplicationController
  
  # following the create convention - even though not using resource: BoggleBoard with constraints
  def create
    @board = BoggleBoard.new
    render json: @board
  end
  
end
