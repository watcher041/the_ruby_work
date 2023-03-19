
Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root to: "users#index"

  resources :comments, only: [:create,:index,:edit,:update]
  
  resources :users, only: [:show] do
    collection do
      get 'get_image'
    end
  end

  resources :posts, except: [:index,:show] do
    collection do
      get 'search'
      get 'get_image'
    end
  end

end
