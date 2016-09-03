class ActivitiesController < ApplicationController
#class ActivitiesController < InheritedResources::Base

  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @shifts = Shift.all
    @activities = Activity.all
    @sorted = @activities.sort_by { |a| a.work_area }
    @users = User.all

    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"shift-list.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def full_list
    @shifts = Shift.all
    @activities = Activity.all
    @sorted = @activities.sort_by { |a| a.work_area }
  end

  def show
  end

  def new
    @activity = Activity.new
    @activity.shifts.build
    authorize! :manage, @activity
  end

  def edit
    #@activity.shifts.build
    #authorize! :manage, @activity
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save        
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activities_path, notice: 'Activity was successfully updated.' }
        #format.html { render :edit, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
    authorize! :manage, @activity
  end

  private
  # Use callbacks to share common setup or contraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_params
    params.require(:activity).permit(:work_area, :coordinator, :comments, :sign, :num_tickets, :vol_needed, :shift_ids, shifts_attributes: [:id, :start_time, :end_time, :vols_needed, :category, :_destroy])
  end
end
