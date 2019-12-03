Rails.application.routes.draw do
  mount Newebpay::Engine => '/newebpay'
  # devise_for :admin_users, :controllers => { omniauth_callbacks: "admin_users/omniauth_callbacks" }
  ActiveAdmin.routes(self)
  # mount Ckeditor::Engine => '/ckeditor'
  
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:omniauth_callbacks] = 'admin_users/omniauth_callbacks'
  devise_for :admin_users, devise_config

  root "welcome#index"
  get '/api', to: 'api#index'

  namespace :api do 
	  namespace :v1 do 
  		resources :candidates, :videos, :cities, only: [:index, :show]
  	end	
  end

  resources :donations, except: :index
  
end
