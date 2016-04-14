class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    def admin_only
      if current_user
        @name = current_user.email
      else
        redirect_to '/users/sign_in'
      end
    end
end
