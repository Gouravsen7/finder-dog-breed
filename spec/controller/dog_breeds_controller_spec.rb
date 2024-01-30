# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DogBreedsController, type: :controller do
  describe 'GET index' do
    it 'returns success' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end

  describe 'POST search' do
    context 'with valid params' do
      it 'returns breed image' do
        get :search, params: { dog_breed: 'labrador' }, xhr: true
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:search)
      end
    end
  end
end
