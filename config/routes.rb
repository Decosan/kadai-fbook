Rails.application.routes.draw do

  resources :favorites, only:[:create,:destroy]
  resources :sessions, only:[:new,:create,:destroy]
  resources :users, only:[:index,:show,:new,:create]
  resources :posts do
    collection do
      post :confirm
    end
  end
end
