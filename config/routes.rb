require 'sidekiq/web'

Rails.application.routes.draw do

  post 'github/tokens', to: 'github#tokens'

  resources :stats, only: [:index]

  resources :users, only: [] do

    resources :orgs

    resources :contributors

    post 'slack/tokens', to: 'slack#tokens'
    get 'slack/members', to: 'slack#members'
    get 'github/orgs', to: 'github#orgs'
    get 'github/members', to: 'github#members'

  end

  mount Sidekiq::Web => '/sidekiq'

end
