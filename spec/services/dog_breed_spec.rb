# frozen_string_literal: true

require 'rails_helper'
require 'dog_breed'

RSpec.describe DogBreed do
  describe 'fetch breed image' do
    let(:breed) { 'labrador' }

    subject { DogBreed.call(breed) }

    context 'API request is successful' do
      let(:response_body) do
        { 'status' => 'success', 'message' => 'https://example.com/labrador.jpg' }.to_json
      end

      before do
        allow(Net::HTTP).to receive(:get).and_return(response_body)
      end

      context 'when the breed exists' do
        it 'returns a hash with the image URL' do
          expect(subject['status']).to eq('success')
          expect(subject['message']).to include(breed)
        end
      end

      context 'when the breed does not exist' do
        let(:breed) { 'abc' }
        let(:response_body) do
          {"status"=>"error", "message"=>"Breed not found (master breed does not exist)", "code"=>404}.to_json
        end

        it 'returns a hash with the not found message' do
          expect(subject['message']).to eq('Breed not found (master breed does not exist)')
        end
      end
    end

    context 'API request fails' do
      context 'with an invalid breed' do
        let(:breed) { '' }
        it 'returns an error message' do
          expect(subject['message']).to eq('No route found for "GET http://dog.ceo/api/breed//images/random" with code: 0')
        end
      end
    end
  end
end
