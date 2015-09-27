Rails.application.routes.draw do

  resources "sessions" #only new
  resources "teams" #only index
  resources "users" #only index

  root 'sessions#new'

end
