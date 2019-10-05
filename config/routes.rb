Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :comments, only:[:create, :edit, :update, :destroy], shallow: true
    resource :favorites, only:[:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  get '/users', to: 'users#index', as: 'users_index'
  root "home#top"
  get '/home/about', to: 'home#about',as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
