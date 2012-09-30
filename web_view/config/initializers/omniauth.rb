Rails.application.config.middleware.use OmniAuth::Builder do
  # Work around until nil issue is fixed - https://github.com/intridea/omniauth/issues/597
  OmniAuth.config.logger = Logger.new(STDOUT)
  OmniAuth.logger.progname = "omniauth"

  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
