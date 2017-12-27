Rails.application.routes.draw do
  
  get"posts/busca" => "posts#busca", as: :busca_post	
  resources :posts
  resources :categories
  root "home#index"
end
