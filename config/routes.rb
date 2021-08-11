Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'user/sessions'
  } 
  root "user#index"
  get '/admin', to: "admin#index", as: 'admin_root'
  resources :leave_applications, only: [:index,:new,:create]
  resources :notification, only: [:index,:show]
  resources :updates, except: :destroy
  resources :systems, only: :index
  resources :admins, except: :show
  resources :projects, only: :index
  get 'passwords/edit', to: "password#edit"
  patch 'passwords/update', to: "password#update"
  namespace :admin do
    get 'password/edit'
    patch 'password/update'
    resources :users do
      member do
        get 'passwords/edit'
        patch 'passwords/update'
      end
    end
    resources :notifications
    resources :organizations, except: :show
    resources :systems, except: :show
    resources :projects
    resources :leave_applications, only: [:index] do
      member do
        patch 'approve'
        patch 'reject'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
