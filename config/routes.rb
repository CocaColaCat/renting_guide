RentingGuild::Application.routes.draw do

  resources :renters
  
  get "get_your_guide", to: 'renters#new'
  
  get "download", to: 'renters#download'
  
  root to: 'renters#new'
end
