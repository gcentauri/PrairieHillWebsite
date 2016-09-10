class TimeslotsController < ApplicationController
  before_action :set_timeslot, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @timeslots = Timeslot.all
    respond_with(@timeslots)
  end

  def show
    respond_with(@timeslot)
  end

  def new
    @timeslot = Timeslot.new
    respond_with(@timeslot)
    authorize! :manage, @timeslot
  end

  def edit
    authorize! :manage, @timeslot
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.save
    respond_with(@timeslot)
  end

  def update
    @timeslot.update(timeslot_params)
    #respond_with(@timeslot)
    redirect_to activities_path, notice: 'Activity was successfully updated.'
  end

  def destroy
    @timeslot.destroy
    respond_with(@timeslot)
    authorize! :manage, @timeslot
  end

  private
    def set_timeslot
      @timeslot = Timeslot.find(params[:id])
    end

    def timeslot_params
      params.require(:timeslot).permit(:activity_id, :shift_id, :guestname, :user_id)
    end
end
