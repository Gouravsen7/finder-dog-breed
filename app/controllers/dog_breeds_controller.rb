class DogBreedsController < ApplicationController
  def index
  end

  def search
    @dog_breed = DogBreed.call(params[:dog_breed])

  end
end
