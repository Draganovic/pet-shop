Rails.application.routes.draw do
  root "shops#index"
  resources :shops, only: [:index, :show] do
    resources :puppies, only: [:index]
  end

  resources :users, only: [:new, :create]

  get "/dashboard",      to: "users#show"
  # get    'signup'  => ''
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
