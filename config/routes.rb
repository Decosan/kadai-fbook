Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  resources :sessions, only:[:new,:create,:destroy]
  resources :users, only:[:index,:show,:new,:create]

end
