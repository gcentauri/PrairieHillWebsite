
module Api
  class UsersController < Api::BaseController
    #http_basic_authenticate_with name: "admin", password: "secret"
    http_basic_authenticate_with name: "admin", password: ENV["API_PASS"]

    private

    def activity_params
      params.require(:activity).permit(:email, :username, :name, :admin, :first_name, :last_name, :phone)
    end

    def query_params
      params.permit(:activity).permit(:email, :username, :name, :admin, :first_name, :last_name, :phone)
    end

  end
end
