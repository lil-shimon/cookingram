Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  delete "/recipes/:recipe_id/likes" => "likes#destroy"
  
  resources :users
  #この一行で必要なルーティングが作られる
  resources :recipes do
    resources :likes, only: [:create]
  end
end
