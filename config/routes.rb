
Rails.application.routes.draw do

  resources "sessions" #only new
  resources "teams" #only index
  resources "users" #only index
  resources "members" #only index

  get "login", to: 'sessions#set_current_session', via: :all
  get "logout", to: 'sessions#destroy_current_session', via: :all


  root 'users#index'

end
