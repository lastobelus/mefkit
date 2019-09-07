Rails.application.routes.draw do
  devise_for :admins, path: "admins", class_name: "Admins::Form"
  devise_for :users, class_name: "Users::Form"

  devise_scope :user do
    get "/auth/:provider/callback" => "omniauth_callbacks#create"
    get "/auth/:provider/upgrade" => "omniauth_callbacks#upgrade", as: :user_omniauth_upgrade
    get "/auth/:provider/setup", :to => "omniauth_callbacks#setup"
  end

  devise_scope :admins do
    get "/auth/:provider/callback" => "authentications#create"
    get "/auth/:provider/upgrade" => "omniauth_callbacks#upgrade", as: :admin_omniauth_upgrade
    get "/auth/:provider/setup", :to => "omniauth_callbacks#setup"
  end

  namespace :manage do
    resources :admins

    root to: "admins#index"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
