class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    def admin_only
      if current_user
        @name = current_user.email
        # unless current_user.has_role? :admin
        #   render :text => "你的权限不够！！！"
        # end
        # next
      else
        redirect_to '/users/sign_in'
      end
    end
end
