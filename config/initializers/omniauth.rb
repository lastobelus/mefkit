Rails.application.config.middleware.use OmniAuth::Builder do
  providers = ENV.fetch("OAUTH_ENABLED_PROVIDERS", "").split(/ *, */)
  providers.each do |provider_name|
    env_name = provider_name.upcase

    key = ENV.fetch("#{env_name}_OAUTH_APP_ID")
    secret = ENV.fetch("#{env_name}_OAUTH_APP_SECRET")
    scope = ENV.fetch("#{env_name}_OAUTH_DEFAULT_SCOPE")

    provider provider_name.to_sym, key, secret, scope: scope
  end
  on_failure { |env| AuthenticationsController.action(:failure).call(env) }
end
