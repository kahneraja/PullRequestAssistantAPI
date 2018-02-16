Rails.application.routes.draw do
  resources :users

  namespace :github do
    resources :tokens
  end

  namespace :slack do
    resources :tokens
    resources :members
  end

end
