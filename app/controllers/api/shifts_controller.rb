
module Api
  class ShiftsController < Api::BaseController

    private

    def shift_params
      params.require(:shift).permit(:title, :time, :vols_needed, :volunteers, :volunteer, :guest)
    end

    def query_params
      params.permit(:title,  :time, :vols_needed, :volunteers, :volunteer, :guest)
    end

  end
end
