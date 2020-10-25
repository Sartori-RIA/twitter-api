# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: 'auth',
             defaults: { format: :json },
             path_names: {
               registration: 'sign_up',
               confirmation: 'confirmations'
             },
             controllers: {
               confirmations: 'confirmations',
               unlocks: 'unlocks',
               passwords: 'passwords',
               sessions: 'sessions',
               registrations: 'registrations'
             }
  post 'auth/code' => 'code_validations#create'
  put 'auth/reset_passwords' => 'reset_passwords#update'

  namespace :api do
    resources :users, except: %i[create] do
      scope module: :users do
        resources :postages
        resources :follows, except: %i[show update]
        resources :followers, only: %i[index]
      end
      collection do
        get 'search' => 'users#search'
      end
    end
  end
end
