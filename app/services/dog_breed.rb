require 'net/http'
class DogBreed
  def self.call(breed)
    uri = URI("https://dog.ceo/api/breed/#{breed}/images/random")
    response = Net::HTTP.get(uri)
    return JSON.parse(response)
  rescue e
    return e
  end
end
