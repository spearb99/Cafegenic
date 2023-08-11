Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end

  devise_for :users,skip: [:passwords] ,controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
  root to: "homes#top"
  get "users/about"=>"homes#about"
  patch "users/withdraw" => "users#withdraw"
  get "users/unsubscribe" => "users#unsubscribe"
  resources :posts do
  resources :comments, only: [:create, :destroy]
    collection do
      get 'indexfav'
      get 'search'
      get 'indexsearch'
    end
    resource :favorite, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
  end
end
devise_scope :user do
  post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
end
  namespace :admin do
  get "/" => "homes#top"
  get "search" => "searches#search"
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
end