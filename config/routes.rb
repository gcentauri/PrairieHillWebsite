
Rails.application.routes.draw do

  resources :events
  namespace :api, defaults: {format: 'json'} do
    resources :activities,
              :pages,
              :shifts,
              :volunteers,
              :users
  end


  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  
  comfy_route :cms_admin, :path => '/admin'

  devise_for :users, :controllers => { registrations: "registrations", passwords: 'users/passwords', sessions: "sessions" }

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
  get 'ccf/info', to: "pages#ccf_info"
  get 'ccf/volunteer', to: 'activities#index'
  get 'ccf/activities', to: 'activities#index'
  get 'all_shifts', to: 'activities#full_list'
  get 'ccf/user_shifts', to: 'shifts#user_shifts'
  get "user_shifts", to: "shifts#user_shifts"
  get 'export', to: 'activities#export', as: :activities_export

  authenticate :user do
    resources :activities
    resources :shifts 
    resources :volunteers
    resources :events
  end
  
  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true
end
