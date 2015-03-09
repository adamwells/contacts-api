Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index]
  end
  resources :contacts, except: [:index]
  resources :contact_shares, only: [:create, :destroy]
end
