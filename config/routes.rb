Rails.application.routes.draw do
  root 'welcome#home'
  
  get '/auth/facebook/callback' => 'sessions#create'
  delete '/', to: 'sessions#destroy', as: 'logout'
end
