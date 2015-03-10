Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index]
    resources :comments, only: [:index, :create]
    resources :favorites, only: [:index]
  end
  resources :favorites, only: [:create, :destroy]
  resources :contacts, except: [:index] do
    resources :comments, only: [:index, :create]
  end
  resources :contact_shares, only: [:create, :destroy]
end
