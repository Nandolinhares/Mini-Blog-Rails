Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  get "posts/busca" => "posts#busca", as: :busca_post
  get "home/busca" => "home#busca", as: :busca_categories	
  resources :posts
  resources :categories
  root "home#index"
end
