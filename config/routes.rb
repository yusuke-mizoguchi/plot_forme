Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'static_pages#top'
  get 'rule', to: 'static_pages#rule'
  get 'privacy', to: 'static_pages#privacy'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create edit update show ]
  resources :novels do
    resources :reviews, only: %i[create edit update destroy], shallow: true
    resources :characters, only: %i[create edit update destroy], shallow: true
  end
end
