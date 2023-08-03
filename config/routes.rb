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
  get "search" => "searches#search"
  get "users/mypage" => "users#show"
  get "users/information/edit" => "users#edit"
  patch "users/information" => "users#update"
  get "users/unsubscribe" => "users#unsubscribe"
  patch "users/withdraw" => "users#withdraw"
end
  namespace :admin do
  get "/" => "homes#top"
  get "search" => "searches#search"
end
end

