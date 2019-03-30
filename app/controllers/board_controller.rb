class BoardController < ApplicationController
  
  # following the create convention - even though not using resource: BoggleBoard with constraints
  def create

    # consider a serializer? - need a strategy for managing
    # REST JSON contracts - often do not want internal
    # model properties to be included in serialization process
    @board = BoggleBoard.new
    render json: @board
  end
  
end
