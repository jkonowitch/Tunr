Tunr2::Application.routes.draw do

  root 'welcome#index'

  resources :users, except: [:index] do
    resources :owned_songs, only: [:index, :show]
    resources :playlists, shallow: true
  end

  resources :artists, only: [:index, :show] do
    resources :songs, only: [:show], shallow: true do
      member do
        post "purchase"
      end
    end
  end

  resource :session, only: [:create, :new, :destroy]
end
