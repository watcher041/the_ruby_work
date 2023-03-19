
Rails.application.routes.draw do

  # deviseで使用
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # deviseにaddressパスを追加
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root "homes#index"
  resource :homes, only: [:show]

  resources :categories, only: [:index,:show] do
    member do
      get :item_list
    end
  end

  resources :users ,only: [:show] do
    resources :side_bars, only: [] do
      collection do
        get :nice
        get :evaluation
        get :draft
        get :exhibited
        get :purchased
        get :contact
      end
    end
  end

  resources :items

end
