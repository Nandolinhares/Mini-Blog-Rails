Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  get"posts/busca" => "posts#busca", as: :busca_post	
  resources :posts
  resources :categories
  root "home#index"
end
