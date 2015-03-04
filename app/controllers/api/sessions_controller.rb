module Api
  class SessionsController < BaseController

    def login
      @user = User.login params[:username],
                         params[:password],
                         request
      session[:current_user_id] = @user.id if @user
      
      respond_with @user
    end

    def logout
      @user = current_user
      reset_session
      
      redirect_to '/users/login'
    end
  end
end
