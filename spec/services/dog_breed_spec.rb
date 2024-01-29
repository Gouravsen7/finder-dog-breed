require 'rails_helper'
require 'dog_breed'

RSpec.describe DogBreed do
  describe 'fetch breed image' do
    let(:breed) { 'labrador' }

    context 'when the API request is successful' do
      let(:response_body) do
        { 'status' => 'success', 'message' => 'https://example.com/labrador.jpg' }.to_json
      end

      before do
        allow(Net::HTTP).to receive(:get).and_return(response_body)
      end

      it 'returns a hash with the image URL' do
        result = DogBreed.call(breed)
        expect(result['status']).to eq('success')
        expect(result['message']).to include(breed)
      end
    end

    context 'when the API request fails' do
      it 'returns an error message' do
        result = DogBreed.call('abc')
        expect(result['message']).to eq("Breed not found (master breed does not exist)")
      end
    end
  end
end
