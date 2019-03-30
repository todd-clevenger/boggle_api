class WordsController < ApplicationController
  
  # following the create convention - even though not using resource: BoggleBoard with constraints
  def create
    
    exists = false
    
    # TODO: Add some basic validation on the incoming word
    word = Word.new(params["term"], false)
    
    # allowing exceptions from underlying api to throw 500 status code
    # and generate a log entry    
    word.exists = DictionaryGateway.new.exists(word.term)

    render json: word
  end
end