Rails.application.routes.draw do
  resources :users, only: [] do
    get 'slack/tokens', to: 'slack#tokens'
    get 'slack/members', to: 'slack#members'
    get 'github/tokens', to: 'github#tokens'
    get 'github/orgs', to: 'github#orgs'
  end
end
