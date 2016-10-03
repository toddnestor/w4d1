Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update]

  resources :contacts, only: [:create, :destroy, :show, :update]

  resources :users do
    resources :contacts, only: [:index]
    resources :comments, only: [:index]
    resources :groups, only: [:index]
  end

  resources :contacts do
    resources :comments, only: [:index]
    post "favorite" => "contacts#favorite"
    post "group" => "contacts#add_to_group"
  end

  resources :comments, only: [:create, :destroy, :update]

  resources :contact_shares, only: [:create, :destroy]

  resources :contact_shares do
    post "favorite" => "contact_shares#favorite"
    post "group" => "contacts#add_to_group"
  end

  resources :groups, only: [:create, :destroy, :update, :show]
end
