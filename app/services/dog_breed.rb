# frozen_string_literal: true

require 'net/http'
require 'ostruct'

class DogBreed < OpenStruct
  BASE_URL = 'https://dog.ceo/api/breed'

  def self.call(breed)
    uri = URI("#{BASE_URL}/#{breed.strip.downcase}/images/random")
    response = Net::HTTP.get(uri)
    new(JSON.parse(response))
  end

  def error?
    status != 'success'
  end
end
