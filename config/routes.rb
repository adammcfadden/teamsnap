Rails.application.routes.draw do

  resources "sessions" #only new
  resources "teams" #only index
  resources "users" #only index

  get "sessions_get_code", to: 'sessions#get_code_set_token', via: :all


  root 'sessions#new'

end
