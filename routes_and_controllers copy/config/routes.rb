Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  
  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new'
  # get 'users/:id/edit', to: 'users#edit'
  # get 'users/:id', to: 'users#show'
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  resources :users, only: [:update, :show, :index, :destroy, :create]
  resources :artworks, only: [:update, :show, :destroy, :create]
  resources :artworkshares, only: [:create, :destroy, :index]
  resources :comments, only: [:create, :destroy, :index]


  resources :users do
    resources :artworks, only: :index
  end

  resources :users do
    resources :comments, only: :index
  end

  resources :artworks do
    resources :comments, only: :index
  end
end

