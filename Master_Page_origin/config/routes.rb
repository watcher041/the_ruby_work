
Rails.application.routes.draw do

  devise_for :users

  # ホームページ関連
  root "homes#index"
  resource :homes, only: [:show]

  # ユーザー関連パス
  resources :users, only: [:index,:show]

  # 分野関連パス
  resources :fields, only: [:index,:show]

  # 投稿記事検索など
  namespace :posts do
    resources :searches, only: [:index]
  end

  # 投稿記事関連
  resources :posts

end
