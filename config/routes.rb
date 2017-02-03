Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users

  resources :users do
    member do
      get :delete
    end
  end

end
