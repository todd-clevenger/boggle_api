class WordsController < ApplicationController
  
  # following the create convention - even though not using resource: BoggleBoard with constraints
  def create
    
    exists = false
    
    word = Word.new(params["term"], false)

    # check to see if the word exists on the board
    board = BoggleBoard.new
    exists = board.search(word.term, params["tiles"])

    # now, see if the word is an actual English word
    if (exists)
      # allowing exceptions from underlying api to throw 500 status code
      # and generate a log entry - to protect system from downstream
      # latency and failures, use circuit breaker    
      word.exists = DictionaryGateway.new.exists(word.term)
    end

    render json: word
  end
end