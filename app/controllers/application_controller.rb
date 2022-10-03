class ApplicationController < ActionController::Base
    class AuthorizationException < StandardError
    end
  
    rescue_from AuthorizationException do
      render text: "Access Denied", status: :unauthorized
    end
  
    protected
    def authenticate_student_or_admin!
      unless student_signed_in? or admin_signed_in?
        raise AuthorizationException.new
      end
    end
end
