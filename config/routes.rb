Rails.application.routes.draw do
  devise_for :users
  # This is our landing page
  root to: 'pages#home'
  # This is where we redirect after login/signup
  get '/user' => "courts#index", :as => :user_root
  # We're using all our routes for courts
  resources :courts do
    resources :reservations, only: [:create]
  end
  resources :reservations, only: [:destroy]
end
