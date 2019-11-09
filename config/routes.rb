Rails.application.routes.draw do
  # devise_for :admin_users, :controllers => { omniauth_callbacks: "admin_users/omniauth_callbacks" }
  ActiveAdmin.routes(self)
  # mount Ckeditor::Engine => '/ckeditor'
  
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:omniauth_callbacks] = 'admin_users/omniauth_callbacks'
  devise_for :admin_users, devise_config
  
  
end
