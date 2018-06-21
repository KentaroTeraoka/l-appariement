Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/" => "home#top"

  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/signup_error" => "users#signup_error"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get "users/edit_error" => "users#edit_error"
  post "login" => "users#login"
  get "users/login_error" => "users#login_error"
  post "logout" => "users#logout"


end
