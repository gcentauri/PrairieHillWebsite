Rails.application.routes.draw do

  resources :guests
  resources :activities
  resources :shifts 
  resources :volunteers

  #resources :volunteer, :controller => "shifts"

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
 
  comfy_route :cms_admin, :path => '/admin'

  devise_for :users
  resources :pages

  root "pages#home"

  # namespace :ccf do
  #   resources :shifts
  # end

  get "about" => "pages#about"
  get "news" => "pages#news"
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
  get "ccf_volunteer" => "shifts#volunteer"
  get "user_shifts" => "shifts#user_shifts"

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true
end
