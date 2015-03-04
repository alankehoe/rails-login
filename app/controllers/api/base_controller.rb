module Api
  class BaseController < ApplicationController
    respond_to :json
    
    private
    
    def current_user
      @current_user ||= User.find session[:current_user_id]
    end
  end
end
