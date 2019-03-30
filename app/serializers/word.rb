# simple data contract class to control the JSON output of the results
# of looking up a word
class Word
  include ActiveModel::Serializers::JSON

  attr_accessor :term, :exists
  attr_reader :language
  
  def initialize(term, exists)
    @term = term
    @exists = exists
    
    # only looking at english language
    @language = "en"
  end

  #validates! :term, presence: true

  # required by ActiveModel::Serializer
  def attributes
    {
      'term' => nil,
      'exists' => nil,
      'language' => nil
    }
  end

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end
  
end