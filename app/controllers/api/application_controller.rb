class Api::ApplicationController < ActionController::API
    before_action :doorkeeper_authorize!

    protected

    # helper method to access the current user from the token
    def current_user
      return nil if doorkeeper_token[:scope] != 'admin'
      @current_admin ||= Admin.find_by(id: doorkeeper_token[:resource_owner_id]) 
    end    

    def current_student
      return nil if doorkeeper_token[:scope] != 'student'
      @current_student ||= Student.find_by(id: doorkeeper_token[:resource_owner_id])
    end
end