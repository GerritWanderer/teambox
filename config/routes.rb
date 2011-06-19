Teambox::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'
  
  
  namespace :user do
    root :to => "projects#index"
  end
  devise_for :users
  resources :projects do
    resources :messages do
      member do
        get 'new_answer', :as => :new_answer
        post 'create_answer', :as => :create_answer
      end
    end
    resources :attachments do
      member do
        get 'read', :as => :read
      end
    end
  end
  
end
