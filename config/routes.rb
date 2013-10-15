RentingGuild::Application.routes.draw do
  resources :renters
  get "get_your_guide", to: 'renters#new'
  root to: 'renters#new'
end
