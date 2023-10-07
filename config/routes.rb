Rails.application.routes.draw do

  # 会員用
  # URL /members/sign_in ...
  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # ゲストログイン
  devise_scope :member do
    post "members/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    resources :members, only: [:show, :edit, :update] do
      collection do
        get 'favorite'
        get 'confirm'
        patch 'withdraw'
      end
    end
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :visions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
      end
    end

    resources :searches, only: [:index]
    resources :tags, only: [:show]
    resources :notifications, only: [:destroy] do
      collection do
        delete 'destroy_all'
        patch  'notice'
      end
    end
  end

  namespace :admin do
    root to: "homes#top"
    resources :members, only: [:index, :show, :update]
    resources :posts, only: [:index, :show, :destroy]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
