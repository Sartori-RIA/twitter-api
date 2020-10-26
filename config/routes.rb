# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: 'auth',
             defaults: {format: :json},
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
    resources :postages, only: %i[index]
    resources :users, except: %i[create] do
      scope module: :users do
        resources :postages do
          collection do
            get 'count' => 'postages#count'
          end
        end
        resources :follows, except: %i[show update] do
          collection do
            get 'count' => 'follows#count'
          end
        end
        resources :followers, only: %i[index] do
          collection do
            get 'count' => 'followers#count'
          end
        end
      end
      collection do
        get 'search' => 'users#search'
        get 'check/email' => 'users#email_available?'
        get 'check/user_name' => 'users#user_name_available??'
      end
    end
  end
end
