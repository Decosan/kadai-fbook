Rails.application.routes.draw do

  resources :sessions, only:[:create,:destroy]
  resources :users, only:[:index,:show,:new,:create]

end
