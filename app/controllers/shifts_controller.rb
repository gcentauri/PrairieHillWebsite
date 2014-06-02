class ShiftsController < ApplicationController
  def index
    if params[:status] == "activated"
      @shifts = Shift.activated
    else
      @shifts = Shift.inactivated
    end
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(params[:shift])
    if @shift.save
      redirect_to @shift
    else
      render "new"
    end
  end
end
