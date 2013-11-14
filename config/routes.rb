Workoutwars::Application.routes.draw do
  root :to => "static#index"

  get '/user_exercises/users/:id', to: 'users#user_exercises'

  resources :challenge_attempts
  resources :exercise_types
  resources :competition_types
  resources :challenge_types
  
  resources :challenges do
    resources :competable_exercises, only: [:new, :create, :destroy]
    resources :teams
  end
  resources :exercises, only: [:new, :create, :destroy]
  resources :competitions do
    resources :competable_exercises, only: [:new, :create, :destroy]
    resources :teams
  end

  resources :competable_registrations, only: [:create, :destroy]

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :update, :destroy]

  namespace :api do
    namespace :v1 do
      devise_for :users
    end
  end 
end
