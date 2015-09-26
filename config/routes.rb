Rails.application.routes.draw do

  resources "sessions"
  get "sessions_get_code", to: 'sessions#get_code', via: :all
  resources "teams"

end
