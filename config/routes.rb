Tunr2::Application.routes.draw do

  resources :users do
    resources :owned_songs, only: [:index, :show]
    resources :playlists
  end

  resources :artists, only: [:index, :show] do
    resources :songs, only: [:show] do
      member do
        post "purchase"
      end
    end
  end

end
