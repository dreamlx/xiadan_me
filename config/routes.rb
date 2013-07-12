Tzk3d::Application.routes.draw do

  resources :companies

  resources :service_menus

  resources :venues

  resources :girls

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'
  resources :tasks
  
  resources :girls do
    resources :tasks, controller: :tasks 
    
    member do
      put :leave
      put :atwork
      put :booking

      get :comments
      post :add_comment
      delete :remove_comment
    end
  end
  
  resources :categories

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :home do
    collection do
      get :services
      get :venues
      get :girls
    end
  end
end
