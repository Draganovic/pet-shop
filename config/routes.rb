Rails.application.routes.draw do
  resources :shops, only: [:index, :show] do
    resources :puppies, only: [:index]
  end

end
