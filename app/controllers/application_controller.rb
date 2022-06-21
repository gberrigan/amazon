class ApplicationController < ActionController::Base
    def current_user
        return nil unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
      end

      helper_method :current_user
     
      before_action :authenticate!
     
      private
      def authenticate!
        unless current_user
        flash[:notice] = 'You must be signed in to do that'
        redirect_to sign_in_path
        end
      end
end
