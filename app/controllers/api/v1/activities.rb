module API
  module V1
    class Activities < Grape::API
      include API::V1::Defaults
      
      resource :activities do
        desc "Return all activities"
        get "", root: :activities do
          Activity.all
        end
        
        desc "Return an activity"
        params do
          requires :id, type: String, desc: "ID of the activity"
        end
        get ":id", root: "activity" do
          Activity.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
