Rails.application.routes.draw do
  get 'likes/index'

  get 'likes/new'

  get 'likes/show'

  get 'likes/edit'

  get 'secrets/index'

  get 'secrets/new'

  get 'secrets/show'

  get 'secrets/edit'

  get 'sessions/new'

  get 'sessions/index'

  get 'users/index'=>'users#index'

  get 'users/show'

  get 'users/new'=>'users#new'
  post 'users/new'=>'users#create'
  get 'users/edit'
  get 'users/:id' =>'users#show'
  post 'sessions/login'=>'users#login'
  # post 'login'=>'users#login'
  post 'secrets'=>'secrets#new_secret'
  delete 'sessions' =>'sessions#destroy'
  post '/secrets/:id/delete' => 'secrets#delete'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  get '/secrets' => 'secrets#index'
  post 'like'=>'likes#like'
  post 'unlike'=>'likes#unlike'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
