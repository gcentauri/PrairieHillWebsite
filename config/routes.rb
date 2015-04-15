
Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    #namespace :v1 do
    resources :activities, :pages, :shifts, :volunteers, :users
    #end
  end
  
  resources :activities
  resources :shifts 
  resources :volunteers

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  
  comfy_route :cms_admin, :path => '/admin'

  devise_for :users
  resources :pages

  root "pages#home"

  get "about" => "pages#about"
  get "news" => "pages#news"
  get "events" => "pages#events"
  get "programs" => "pages#programs"
  get "calendar" => "pages#calendar"
  get "contact" => "pages#contact"
  get "staffandboard" => "pages#staff"
  get "jobs" => "pages#jobs"
  get "donate" => "pages#donate"
  get "camp" => "pages#summer_camp"
  get "csv" => "pages#csvupload"
  get "uniq" => "pages#unique"
  get "ccf" => "shifts#volunteer"
  get "user_shifts" => "shifts#user_shifts"

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true
end
