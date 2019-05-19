# frozen_string_literal: true

require 'test_helper'

class DictionaryGatewayTest < ActiveSupport::TestCase
  test 'valid word' do
    assert DictionaryGateway.new.exists('dog')
  end

  test 'invalid word' do
    assert_not DictionaryGateway.new.exists('dogfu')
  end
end
