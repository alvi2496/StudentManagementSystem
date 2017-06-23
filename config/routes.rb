Rails.application.routes.draw do

  root to: 'users#index'

  devise_for :users


  resources :courses do
    member do
      get :unassign
    end
  end
  resources :semesters do
    member do
      get :show_available_courses
      patch :assign_new_courses
    end
  end
  resources :users
  resources :users_semesters_enrollments
  resources :users_courses_enrollments do
    member do
      post :update
    end
  end

  resources :results do
    member do
      get :add_new
      post :create_new
      get :edit_existing
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users_semesters_enrollments
    end
  end

end
