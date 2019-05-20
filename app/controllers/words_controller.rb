# frozen_string_literal: true

# controller class for managing words in the board
class WordsController < ApplicationController
  # following the create convention - even though not using
  # resource: BoggleBoard with constraints
  def create
    word = Word.new(params['term'], false)

    # check to see if the word exists on the board
    board = BoggleBoard.new
    exists = board.search(word.term, params['tiles'])

    # now, see if the word is an actual English word
    if exists

      # check the cache first - only go to the oxford dictionary if
      # it doesn't exist in our simple word cache
      word_cache = WordCache.new
      if word_cache.exists?(word.term)
        word.exists = true
      else
        # allowing exceptions from underlying api to throw 500 status code
        # and generate a log entry - to protect system from downstream
        # latency and failures, use circuit breaker
        word.exists = DictionaryGateway.new.exists(word.term)
        word_cache.add(word.term) if word.exists
      end
    end

    render json: word
  end
end
