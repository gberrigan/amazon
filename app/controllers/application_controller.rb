class ApplicationController < ActionController::Base
    def current_user
        return nil unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
      end

      helper_method :current_user
     
      before_action :authenticate!
     
      private
      def authenticate!
        redirect_to sign_in_path, notice: 'You must be signed in to do that' unless current_user
      end
end
