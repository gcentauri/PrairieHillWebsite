# Recent Changes

## Sat Sep 24 10:53:44 CDT 2016

-   [X] resolve issue with naked url redirecting to heroku app domain
    -   this should be done via the DNS server, which is presently out of my hands
        TODO: gain DNS access
    
    -   [X] as an alternative, install [rack-canonical-host](https://github.com/tylerhunt/rack-canonical-host)
        -   [X] prevent local redirect
            -   [X] set heroku env variable
                
                    heroku config:add CANONICAL_HOST=www.prairiehill.com
        
        -   [X] <./config.ru>
            
                # This file is used by Rack-based servers to start the application.
                
                require ::File.expand_path('../config/environment',  __FILE__)
                use Rack::CanonicalHost, (ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']), cache_control: 'max-age=3600'
                run Rails.application
