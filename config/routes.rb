Rails.application.routes.draw do
  devise_for :users
  # This is our landing page
  root to: 'pages#home'
  # We're using all our routes for courts
  resources :courts
end
