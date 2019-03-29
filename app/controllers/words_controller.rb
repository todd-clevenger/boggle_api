class WordsController < ApplicationController
  
  # following the create convention - even though not using resource: BoggleBoard with constraints
  def create
    
    exists = false
    
    # TODO: Add some basic validation on the incoming word
    
    begin
      exists = DictionaryGateway.new.exists(params[:id])
    rescue
      # TODO: log the error - look up how to do this - and return a 500 error code
      # just rethrow to get a log entry + 500
      # need to handle 404's
      #throw
    end
    
    # TODO: investigate ActiveModel::Serializer to replace the Word class & define one for the boggle board too while
    # we're at it
    render json: Word.new(params[:id], exists)
  end
end