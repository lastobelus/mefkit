Rails.application.routes.draw do
  devise_for :users
  namespace :manage do
    resources :admins

    root to: "admins#index"
  end

  devise_for :admins

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
