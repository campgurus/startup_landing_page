Rails.application.routes.draw do
  get 'thank_you' => 'static#thank_you'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :visitors, only: [:new, :create]
  root to: 'visitors#new'
end
