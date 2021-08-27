Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
  get 'home/index'
  resources :posts
  root 'static_pages#home', as: "home"
  get 'static_pages/help', as: "help"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, only: %i(:new, :create, :show)
  end
end
