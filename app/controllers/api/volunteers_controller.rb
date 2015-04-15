
module Api
  class VolunteersController < Api::BaseController

    private

    def volunteer_params
      params.require(:volunteer).permit(:name, :email, :phone)
    end

    def query_params
      params.permit(:name, :email, :phone)
    end

  end
end
