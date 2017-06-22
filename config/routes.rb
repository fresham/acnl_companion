Rails.application.routes.draw do
  root "home#index"

  get "/creatures", to: "creatures#index"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
