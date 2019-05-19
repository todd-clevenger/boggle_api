# frozen_string_literal: true

# encapsulates the communication with the oxford dictionary API
# for future, would be nice to make this a strategy pattern (not sure how yet in Ruby)
# to support swapping API dictionaries without needing to change the calling code
# question:  Should gateway patterns go in Models?  Seems like models is overloaded.
class DictionaryGateway
  require 'rest_client'

  TIMEOUT_SECONDS = 10

  # throws exceptions for invalid status codes except 404
  def exists(word)
    exists = true
    begin
      RestClient::Request.execute(
        method: :get,
        url: "https://od-api.oxforddictionaries.com/api/v2/entries/en-us/#{word}",
        timeout: TIMEOUT_SECONDS,
        headers: {'app_id' => ENV['BOGGLE_APP_ID'], 'app_key' => ENV['BOGGLE_APP_KEY']}
      )

    rescue RestClient::Forbidden
      Rails.logger.debug do
        "403 Forbidden from Oxford API " \
        "BOGGLE_APP_ID=#{ENV['BOGGLE_APP_ID']};" \
          "BOGGLE_APP_KEY=#{ENV['BOGGLE_APP_KEY']}"
      end
      raise
    rescue RestClient::NotFound
      # ignore and leave exists false
      exists = false
    end

    exists
  end
end
