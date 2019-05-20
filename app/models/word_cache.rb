# frozen_string_literal: true

require 'redis'
# caches common words in Redis cache
class WordCache
  def initialize
    @redis = Redis.new
  end

  def exists?(word)
    @redis.exists(word)
  end

  def add(word)
    Rails.logger.debug { "WordCache#add(#{word})" }
    @redis.set(word, nil)
  end

  def clear
    @redis.clear
  end
end
