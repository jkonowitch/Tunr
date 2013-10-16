Tunr2::Application.routes.draw do

  resources :users do
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

end
