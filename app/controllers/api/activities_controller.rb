
module Api
  class ActivitiesController < Api::BaseController

    private

    def activity_params
      params.require(:activity).permit(:work_area, :coordinator, :sign, :num_tickets, :vol_needed, :comments)
    end

    def query_params
      params.permit(:work_area, :coordinator, :sign, :num_tickets, :vol_needed, :comments)
    end

  end
end
