Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "search", to: "dog_breeds#search"
  root "dog_breeds#index"
end
