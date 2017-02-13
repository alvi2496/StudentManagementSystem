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
  resources :users_courses_enrollments

  resources :results do
    member do
      post :add_new
    end
  end

end
