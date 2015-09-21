module Api
  module V1
    class ApiController < ActionController::Base


      def current_user
        @current_user ||=  User.find_by_api_key(params[:api_key]) if params[:api_key]
      end
      helper_method :current_user

      def current_permission
        @current_permission ||= Permissions.permission_for(current_user)
      end

      private

       def restrict_access
         api_key = User.find_by_api_key(params[:api_key])
         head :unauthorized unless api_key
       end
    end
  end
end