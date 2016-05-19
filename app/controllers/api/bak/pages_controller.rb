
module Api
  class PagesController < Api::BaseController

    private

    def page_params
      params.require(:page).permit(:title, :description)
    end

    def query_params
      params.permit(:title, :description)
    end

  end
end
