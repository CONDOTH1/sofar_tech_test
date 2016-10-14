Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists do
    resources :songs
    collection do
      get :import
    end
  end

  resources :songs do
    resources :cities
    resources :videos
  end

end
