Rails.application.routes.draw do
  get 'applicants/index'
  get 'applicants/new'
  get 'positions/index'
  get 'positions/new'
  get 'positions/edit'
  get 'positions/show'
  get 'companies/new'
  get 'companies/edit'
  resources :companies, only: [:new, :edit, :update, :create]
  resources :positions
  resources :applicants, only: [:index, :new,:create]
  devise_for :users
  get 'home/index'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check
end
 