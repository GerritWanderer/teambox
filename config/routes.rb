Teambox::Application.routes.draw do
  resources :projects do
    resources :messages
    resources :attachments
  end
  root :to => 'projects#index'
end
