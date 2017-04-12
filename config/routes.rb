Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  namespace :dashboard do
    root "home#index"
  end

  namespace :admin do
    root "home#index"
  end
end
