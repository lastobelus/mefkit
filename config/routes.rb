Rails.application.routes.draw do
  namespace :manage do
    resources :admins

    root to: "admins#index"
  end

  devise_for :admins
end
