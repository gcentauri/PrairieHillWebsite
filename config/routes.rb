
Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    resources :activities,
              :pages,
              :shifts,
              :volunteers,
              :users
  end
  
  resources :activities
  resources :shifts 
  resources :volunteers

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  
  comfy_route :cms_admin, :path => '/admin'

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :pages

  root "pages#home"

  get "about", to: "pages#about"
  get "news", to: "pages#news"
  get "events", to: "pages#events"
  get "programs", to: "pages#programs"
  get "calendar", to: "pages#calendar"
  get "contact", to: "pages#contact"
  get "staffandboard", to: "pages#staff"
  get "jobs", to: "pages#jobs"
  get "donate", to: "pages#donate"
  get "camp", to: "pages#summer_camp"
  get "csv", to: "pages#csvupload"
  get "uniq", to: "pages#unique"
  get "ccf", to: "pages#ccf"
  get "user_shifts", to: "shifts#user_shifts"
  get "gram", to: "pages#jquery_instagram"

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true
end
