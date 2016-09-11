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
    shift = Shift.find(@timeslot.shift_id)
    activity = Activity.find(@timeslot.activity_id)
    unless @timeslot.user_id.nil?
      redirect_to activities_path, notice: "Thank you for signing up for #{activity.work_area}, #{shift.nick}!"
    else
      redirect_to activities_path, notice: "Your shift, #{activity.work_area}, #{shift.nick} has successfully been cancelled!"
    end
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
