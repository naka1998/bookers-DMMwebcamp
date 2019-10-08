Rails.application.routes.draw do
  get 'tags/show'
  devise_for :users
  resources :books do
    resources :comments, only:[:create, :edit, :update, :destroy], shallow: true
    resource :favorites, only:[:create, :destroy]
    resources :tags, only:[:show]
  end
  resources :users, only: [:index, :show, :edit, :update]
  resource :follows, only: [:create, :destroy]
  get '/users', to: 'users#index', as: 'users_index'
  root "home#top"
  get '/home/about', to: 'home#about',as: 'about'
  get '/follows' => 'follows#index_follows', as: 'follow_list'
  get '/folloewrs' => 'follows#index_followers', as: 'follower_list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
