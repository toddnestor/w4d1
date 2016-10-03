Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update]

  resources :contacts, only: [:create, :destroy, :show, :update]

  resources :users do
    resources :contacts, only: [:index]
    resources :comments, only: [:index]
  end

  resources :contacts do
    resources :comments, only: [:index]
  end

  resources :comments, only: [:create, :destroy, :update]

  resources :contact_shares, only: [:create, :destroy]
end
