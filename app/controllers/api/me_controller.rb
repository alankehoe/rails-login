module Api
  class MeController < BaseController
    def index
      @current_user = current_user
      respond_with @current_user
    end

    def update
      @current_user = current_user
      @current_user.update! user_params
      respond_with @current_user
    end

    private

    def user_params
      params.required(:me).permit :first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation
    end
  end
end
