Rails.application.routes.draw do

  resources :timeslots
  resources :articles
  resources :guests
  resources :activities
  resources :shifts 
  resources :volunteers
  resources :pages

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
 
  comfy_route :cms_admin, :path => '/admin'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  # authenticated :user do
  #   resources :activities, only: [:new, :create, :edit, :update, :destroy, :index, :show]
  #   #resources :activities
  # end

  
  root "pages#home"

  # namespace :ccf do
  #   resources :shifts
  # end

  get "about" => "pages#about"
  get "news" => "pages#news"
  get "media" => "pages#media"
  get "tours" => "pages#tours"
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
  get "financial" => "pages#financial"
  get "ccf" => "pages#ccf"
  get "ccf_volunteer" => "activities#index"
  get "user_shifts" => "activities#my_shifts"

  # devise_scope :user do
  #   get '/auth/:provider/callback', to: 'devise/sessions#create'
  # end
  
  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true
end
