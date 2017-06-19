Rails.application.routes.draw do
  root "home#index"

  get "/fish", to: "fish#index"
end
