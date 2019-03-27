# simple data contract class to control the JSON output of the results
# of looking up a word
class Word
  
  attr_reader :id, :exists, :language
  
  def initialize(id, exists)
    @id = id
    @exists = exists
    
    # only looking at english language
    @language = "en"
  end
  
end