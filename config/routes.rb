Teambox::Application.routes.draw do
  resources :projects do
    resources :messages
  end
  root :to => 'projects#index'
end
