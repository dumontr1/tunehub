Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bands do
    resources :songs, only: [ :show, :new, :create, :edit, :update, :destroy ]
  end

  resources :songs, only: [] do
    resources :partitions, only: [ :show, :new, :create, :edit, :update, :destroy ]
  end

  resources :partitions, only: [] do
    resources :comments, only: [ :new, :create ]
  end

  resources :members

end
