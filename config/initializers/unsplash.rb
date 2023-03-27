Unsplash.configure do |config|
    config.application_access_key = ENV["UNSPLASH_ACCESS_KEY"]
    config.application_secret = ENV["UNSPLASH_SECRET"]
    config.application_redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
    config.utm_source = "goalgetter_app"
  
    # optional:
  #   config.logger = MyCustomLogger.new
  end