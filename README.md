# Prairie Hill Learning Center

Rails application for [prairiehill.com](http://www.prairiehill.com)

## 2016 ReDesign

    Mon May 16 15:21:05 CDT 2016

This was one of my first applications and took on many bloated features as I
made things work properly, but it's time for some spring cleaning! As I prepare
for the Viking Code School this summer, I'm taking it upon myself to get back
to some older projects that need some love as I apply what I will learn from 
this course. [Check](https://www.tumblr.com/blog/vikingreins) [out](https://twitter.com/50nand3r) [my](https://github.com/son1112) [progress](http://www.sonarch.org) [here](https://www.tumblr.com/blog/vikingreins)!

### Reconstruction Plan

The sad truth is that, in great excitement for learning a new tool, I certainly
went the nuby way of adding nearly everything under the sun. This was like my
first car. I put it to the test, but really wore down it around the edges and
made a mess of it (at least in my mind). 

-   The Strip Down

        Wed May 18 10:02:36 CDT 2016
    
    Now, I did consider stripping everything down and building the frontend design
    back up, but I've recently started to learn AngularJS. My new plan is to build 
    a new application in Angular and turn this old application into the static 
    content API. This is not to say that a will not happen, but let's
    put that off for just one more second.
    
    Here's a skeletal outline of the new setup:
    
    -   [ ] Phill API (Rails)
        -   [ ] Content
    -   [ ] Phill Frontend (Angular)
        -   [ ] CMS
        -   [ ] Volunteer Application
    -   [ ] firebase
        -   Eventually, I will end up moving everything to this side
            -   [ ] Content
            -   [ ] Volunteers/Users

-   Research

    -   [ ] convert rails application into api-only
        
        <http://edgeguides.rubyonrails.org/api_app.html>
        
        -   [ ] Grape
            
            <http://www.thegreatcodeadventure.com/making-a-rails-api-with-grap/>
            <https://github.com/ruby-grape/grape>
            <https://github.com/ruby-grape/grape/blob/v0.16.2/README.md>
            <http://www.ruby-grape.org/>
            <https://groups.google.com/forum/#!forum/ruby-grape>
            
            -   stable release
                
                2
                
                    gem 'grape'
                
                1.2.4.3.1
                
                5
                
                    app/controllers/api/base.rb
                
                    module API
                      class Base < Grape::API
                        mount API::V1::Base
                      end
                    end
                
                6
                
                    app/controllers/api/v1/base.rb
                
                    module API
                      module V1
                        class Base < Grape::API
                          mount API::V1::Activities
                          # mount API::V1::AnotherResource
                        end
                      end
                    end
                
                7
                
                    app/controllers/api/v1/activities.rb
                
                    module API
                      module V1
                        class Activities < Grape::API
                          include API::V1::Defaults
                    
                          resource :activities do
                            desc "Return all activities"
                            get "", root: :activities do
                              Activity.all
                            end
                    
                            desc "Return an activity"
                            params do
                              requires :id, type: String, desc: "ID of the activity"
                            end
                            get ":id", root: "activity" do
                              Activity.where(id: permitted_params[:id]).first!
                            end
                          end
                        end
                      end
                    end
                
                8
                
                    app/controllers/api/v1/defaults.rb
                
                    module API  
                      module V1
                        module Defaults
                          extend ActiveSupport::Concern
                    
                          included do
                            prefix "api"
                            version "v1", using: :path
                            default_format :json
                            format :json
                            formatter :json, 
                                 Grape::Formatter::ActiveModelSerializers
                    
                            helpers do
                              def permitted_params
                                @permitted_params ||= declared(params, 
                                   include_missing: false)
                              end
                    
                              def logger
                                Rails.logger
                              end
                            end
                    
                            rescue_from ActiveRecord::RecordNotFound do |e|
                              error_response(message: e.message, status: 404)
                            end
                    
                            rescue_from ActiveRecord::RecordInvalid do |e|
                              error_response(message: e.message, status: 422)
                            end
                          end
                        end
                      end
                    end
                
                1.2.2
                
                    config/routes.rb
                
                    Rails.application.routes.draw do
                      mount API::Base, at: "/"
                    end
                
                2
                
                    gem 'rack-cors', :require => 'rack/cors'
                
                1
                
                    config/application.rb
                
                    module API
                      class Application < Rails::Application
                        config.middleware.use Rack::Cors do
                          allow do
                            origins "*"
                            resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options]
                          end
                        end
                        config.active_record.raise_in_transactional_callbacks = true
                      end
                    end
                
                2
                
                    gem 'grape-active_model_serializers'
                
                4
                
                    app/serializers/activity_serializer.rb
                
                    class ActivitySerializer < ActiveModel::Serializer
                    
                      attributes :id, :work_area, :coordinator, :sign, :num_tickets, :vol_needed, :shift_ids, :created_at, :updated_at, :comments, :start_time, :end_time, :category
                    
                    end
                
                2
                
                    gem 'grape-swagger'
                
                6
                
                    app/controllers/api/v1/base.rb
                
                    require "grape-swagger-rails"
                    
                    module API
                      module V1
                        class Base < Grape::API
                          mount API::V1::Activities
                    
                          add_swagger_documentation(
                            api_version: "v1",
                            hide_documentation_path: true,
                            mount_path: "/api/v1/swagger_doc",
                            hide_format: true
                          )
                        end
                      end
                    end
                
                3
                
                    config/routes.rb
                
                    mount GrapeSwaggerRails::Engine, at: "/documentation"

## Config

<./config/application.rb>

    require File.expand_path('../boot', __FILE__)
    
    require 'csv'
    require 'writeexcel'
    require 'rails/all'
    
    
    # Require the gems listed in Gemfile, including any gems
    # you've limited to :test, :development, or :production.
    Bundler.require(*Rails.groups)
    
    module API
      class Application < Rails::Application
        config.middleware.use Rack::Cors do
          allow do
            origins "*"
            resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options]
          end
        end
        config.active_record.raise_in_transactional_callbacks = true
      end
    end
    
    module PrairieHillWebsite
    
    #  config.assets.initialize_on_precompile = false
      class Application < Rails::Application
        # Use the responders controller from the responders gem
        config.app_generators.scaffold_controller :responders_controller
    
        config.generators do |g|
          g.stylesheets false
        end
    
        config.font_assets.origin = '*'
    
        config.action_dispatch.default_headers = {
          'X-Frame-Options' => ''
        }
    
        #config.cache_store = :dalli_store
    
        # Settings in config/environments/* take precedence over those specified here.
        # Application configuration should go into files in config/initializers
        # -- all .rb files in that directory are automatically loaded.
    
        # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
        # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
        # config.time_zone = 'Central Time (US & Canada)'
    
        # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
        # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
        # config.i18n.default_locale = :de
      end
    end

### Gems

<./Gemfile>

    source 'http://rubygems.org'
    ruby '2.3.1'
    
    gem 'rails', '4.2.6'
    gem 'sass-rails', '>= 3.2'
    gem 'compass-rails', '~> 2.0.alpha.0'
    gem 'uglifier', '2.5.1'
    gem 'coffee-rails', '4.0.1'
    gem 'jquery-rails', '3.1.1'
    gem 'jquery-ui-rails'
    gem 'jbuilder'
    gem 'kaminari'
    gem 'responders'
    gem 'bcrypt'
    gem 'devise'
    gem 'pg'
    gem 'comfortable_mexican_sofa', '1.12.7'
    gem 'sdoc', '~> 0.4.0',          group: :doc
    gem 'paperclip', :git => 'https://github.com/thoughtbot/paperclip', :ref => '523bd46c768226893f23889079a7aa9c73b57d68'
    gem 'aws-sdk'
    gem 'mail_form'
    gem 'simple_form'
    gem 'inherited_resources', github: 'josevalim/inherited_resources', branch: 'rails-4-2'
    gem 'skrollr-rails'
    gem 'rails_admin'
    gem 'picturefill'
    gem 'autoprefixer-rails'
    gem 'chronic'
    gem 'acts_as_xlsx'
    gem 'axlsx'
    gem 'axlsx_rails'
    gem 'rubyzip'
    gem 'writeexcel', '1.0.5'
    gem 'figaro'
    gem 'meta-tags'
    gem 'metamagic'
    gem 'safe_yaml', '1.0.4'
    gem 'sitemap_generator'
    gem 'dynamic_sitemaps'
    gem 'fullcalendar-rails'
    gem 'momentjs-rails'
    gem 'jquery-datetimepicker-rails'
    gem 'cocoon'
    gem 'turbolinks'
    gem 'jquery-turbolinks'
    gem 'masonry-rails'
    gem 'omniauth', '~> 1.2.2'
    gem 'omniauth-google-oauth2'
    gem 'json'
    gem 'instagramjs-rails'
    gem 'dalli'
    gem 'foundation-rails'
    gem 'foundation-icons-sass-rails'
    gem 'jquery-slick-rails'
    gem 'koala', '~> 2.2'
    gem 'jquery-scrollto-rails'
    gem 'font_assets'
    gem 'font-awesome-rails'
    gem 'cancancan', '~> 1.10'
    gem 'dotenv-rails', :groups => [:development, :test]
    gem 'jscrollpane-rails'
    gem 'spring',        group: :development
    
    gem 'grape'
    gem 'rack-cors', :require => 'rack/cors'
    gem 'grape-active_model_serializers'
    gem 'grape-swagger-rails'
    
    group :development, :test do
      gem 'byebug'
      gem 'sqlite3'
      gem 'foreman'
      gem 'pry-rails'
      gem 'unicorn'
      gem 'rails-dev-tweaks', '~> 1.1'
    end
    
    group :production do
      gem 'rails_12factor'
      gem 'unicorn-rails'
    end

### Routes

<./config/routes.rb>

    Rails.application.routes.draw do
    
      mount API::Base, at: "/"
    
      mount GrapeSwaggerRails::Engine, at: "/documentation"
    
      # namespace :api, defaults: {format: 'json'} do
      #   resources :activities,
      #             :pages,
      #             :shifts,
      #             :volunteers,
      #             :users
      # end
    
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

### API

1.2.4.3.1

<./app/serializers/activity_serializer.rb>

    class ActivitySerializer < ActiveModel::Serializer
    
      attributes :id, :work_area, :coordinator, :sign, :num_tickets, :vol_needed, :shift_ids, :created_at, :updated_at, :comments, :start_time, :end_time, :category
    
    end

### MVC

-   Models

-   Views

-   Controllers

    -   API Controllers
    
        <./app/controllers/api>
        
        <./app/controllers/api/base.rb>
        
            module API
              class Base < Grape::API
                mount API::V1::Base
              end
            end
        
        <./app/controllers/api/v1/base.rb>
        
            require "grape-swagger"
            
            module API
              module V1
                class Base < Grape::API
                  mount API::V1::Activities
                  # mount API::V1::AnotherResource
            
                  add_swagger_documentation(
                    api_version: "v1",
                    hide_documentation_path: true,
                    mount_path: "/api/v1/swagger_doc",
                    hide_format: true
                  )
            
                end
              end
            end
        
        <./app/controllers/api/v1/activities.rb>
        
            module API
              module V1
                class Activities < Grape::API
                  include API::V1::Defaults
            
                  resource :activities do
                    desc "Return all activities"
                    get "", root: :activities do
                      Activity.all
                    end
            
                    desc "Return an activity"
                    params do
                      requires :id, type: String, desc: "ID of the activity"
                    end
                    get ":id", root: "activity" do
                      Activity.where(id: permitted_params[:id]).first!
                    end
                  end
                end
              end
            end
        
        <./app/controllers/api/v1/defaults.rb>
        
            module API  
              module V1
                module Defaults
                  extend ActiveSupport::Concern
            
                  included do
                    prefix "api"
                    version "v1", using: :path
                    default_format :json
                    format :json
                    formatter :json, 
                              Grape::Formatter::ActiveModelSerializers
            
                    helpers do
                      def permitted_params
                        @permitted_params ||= declared(params, 
                                                       include_missing: false)
                      end
            
                      def logger
                        Rails.logger
                      end
                    end
            
                    rescue_from ActiveRecord::RecordNotFound do |e|
                      error_response(message: e.message, status: 404)
                    end
            
                    rescue_from ActiveRecord::RecordInvalid do |e|
                      error_response(message: e.message, status: 422)
                    end
                  end
                end
              end
            end
    
    -   NB
    
        1.1.1.2
