# frozen_string_literal: true

require 'test_helper'

class WordCacheTest < ActiveSupport::TestCase
  test 'word is missing' do
    cache = WordCache.new
    assert_not cache.exists?('missing')
  end
  test 'word exists' do
    cache = WordCache.new
    cache.add('exists')
    assert cache.exists?('exists')
  end
  test 'word exists across instances' do
    cache = WordCache.new
    cache.add('exists')
    cache = WordCache.new
    assert cache.exists?('exists')
  end
end
