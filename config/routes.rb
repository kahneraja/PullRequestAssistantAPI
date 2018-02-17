Rails.application.routes.draw do
  resources :users, only: [] do

    resources :orgs

    get 'slack/tokens', to: 'slack#tokens'
    get 'slack/members', to: 'slack#members'
    get 'github/tokens', to: 'github#tokens'
    get 'github/orgs', to: 'github#orgs'
    get 'github/members', to: 'github#members'

  end
end
