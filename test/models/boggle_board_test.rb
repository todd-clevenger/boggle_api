# frozen_string_literal: true

require 'test_helper'

class BoggleBoardTest < ActiveSupport::TestCase
  test 'word shorter than three is rejected' do
    board = BoggleBoard.new
    assert_not board.search('to', board.tiles)
  end
  test 'invalid word is not found' do
    board = BoggleBoard.new
    puts board.tiles
    assert_not board.search('bogus1', %w[S I B E W M O I N P A G Y I Qu A])
  end
  test 'valid word is found' do
    board = BoggleBoard.new
    assert board.search('swim', %w[S I B E W M O I N P A G Y I Qu A])
  end
end
