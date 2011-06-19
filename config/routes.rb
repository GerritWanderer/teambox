Teambox::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'
  
  
  namespace :user do
    root :to => "projects#index"
  end
  devise_for :users
  resources :projects do
    resources :messages
    resources :attachments
  end
  
end
