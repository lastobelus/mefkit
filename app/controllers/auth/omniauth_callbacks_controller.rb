module Auth
  class OmniauthCallbacksController < Devise::Controller
    prepend_before_action { request.env["devise.skip_timeout"] = true }

    def create
    end

    def passthru
      render status: 404, plain: "Not found. Authentication passthru."
    end

    def failure
      set_flash_message! :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
      redirect_to after_omniauth_failure_path_for(resource_name)
    end

    def setup
      request.env["omniauth.strategy"].options["scope"] = flash[:scope] || request.env["omniauth.strategy"].options["scope"]
      render :text => "Setup complete.", :status => 404
    end

    def upgrade
      oauth_scope = nil

      provider = params[:provider]

      oauth_scope = ENV.fetch("#{provider.upcase}_OMNIAUTH_UPGRADED_SCOPE", nil)

      if oauth_scope
        redirect_to user_omniauth_authorize_path(params[:provider]), flash: { scope: oauth_scope }
      end
    end

    protected

    def failed_strategy
      request.respond_to?(:get_header) ? request.get_header("omniauth.error.strategy") : request.env["omniauth.error.strategy"]
    end

    def failure_message
      exception = request.respond_to?(:get_header) ? request.get_header("omniauth.error") : request.env["omniauth.error"]
      error = exception.error_reason if exception.respond_to?(:error_reason)
      error ||= exception.error if exception.respond_to?(:error)
      error ||= (request.respond_to?(:get_header) ? request.get_header("omniauth.error.type") : request.env["omniauth.error.type"]).to_s
      error.to_s.humanize if error
    end

    def after_omniauth_failure_path_for(scope)
      new_session_path(scope)
    end

    def translation_scope
      "devise.omniauth_callbacks"
    end

    def form_
    def generic_callback(provider)
      @identity = Identity.find_for_oauth env["omniauth.auth"]

      @identifiable = @identity.identifiable || scope

      if @identifiable.nil?
        @identifiable = build_resource(email: @identity.email || "")
        @identifiable.save!
      end

      if @identifiable.email.blank? && @identity.email
        @identifiable.update_attribute(:email, @identity.email)
      end

      if @identifiable.persisted?
        @identity.update(identifiable: @identifiable)
        # This is because we've created the user manually, and Device expects a
        # FormUser class (with the validations) -- I don't think I will need to do this since I changed to use devise build_resource
        # @user = FormUser.find @user.id
        sign_in_and_redirect @identifiable, event: :authentication
        set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
      else
        session["devise.#{provider}_data"] = env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end
end
