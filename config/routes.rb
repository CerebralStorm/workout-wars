Workoutwars::Application.routes.draw do
  root :to => "static#index"

  get '/user_exercises/users/:id', to: 'users#user_exercises'

  resources :challenge_attempts
  resources :team_subscriptions
  resources :exercise_types
  resources :competition_types
  
  resources :challenges
  resources :exercises, only: [:new, :create, :destroy]
  resources :competitions do
    resources :competition_exercises, only: [:new, :create, :destroy]
    resources :teams
  end

  resources :competition_subscriptions, only: [:create, :destroy]

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :update, :destroy]

  namespace :api do
    namespace :v1 do
      devise_for :users
    end
  end 
end
