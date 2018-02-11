Rails.application.routes.draw do
  resources :users

  namespace :github do
    resources :tokens
  end

end
