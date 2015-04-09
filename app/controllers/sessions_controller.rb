class SessionsController < Devise::SessionsController

  layout 'session'

  skip_before_filter :verify_users

  private

  def after_sign_in_path_for(resource_or_scope)
    polymorphic_url [current_role.role_, :dashboard]
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_url
  end

end
