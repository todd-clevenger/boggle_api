# encapsulates the communication with the oxford dictionary API
# for future, would be nice to make this a strategy pattern (not sure how yet in Ruby)
# to support swapping API dictionaries without needing to change the calling code
class DictionaryGateway
  
  require 'rest_client'
  
  TIMEOUT_SECONDS = 10
  
  # throws exceptions for invalid status codes except 404
  def exists(word)
    
    exists = true
    
    begin
      response = RestClient::Request.execute(
        method: :get,
        url: "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{word}/regions=us",
        timeout: TIMEOUT_SECONDS,
        :headers => { 'app_id' => ENV['BOGGLE_APP_ID'], 'app_key' => ENV['BOGGLE_APP_KEY']}
      )
    rescue RestClient::NotFound => e
      # ignore and leave exists false
      exists = false
    end

    return exists 
  end
end