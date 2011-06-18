Teambox::Application.routes.draw do
  devise_for :users
  resources :projects do
    resources :messages
    resources :attachments
  end
  root :to => 'projects#index'
end
