Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  mount RailsAdmin::Engine => '/', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      resources :checkins, only: :create
    end
  end
end
