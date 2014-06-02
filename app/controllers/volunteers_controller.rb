class VolunteersController < ApplicationController
  def index
    if params[:status] == "activated"
      @volunteers = Volunteer.activated
    else
      @volunteers = Volunteer.inactivated
    end
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(params[:volunteer])
    if @volunteer.save
      redirect_to @volunteer
    else
      render "new"
    end
  end
end
