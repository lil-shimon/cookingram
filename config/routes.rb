Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :users
  resources :recipes
  #この一行で必要なルーティングが作られる
end
