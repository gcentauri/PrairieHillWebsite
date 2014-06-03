class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]

  def index
    @volunteers = Volunteer.all
  end

  def show
  end

  def new
    @volunteer = Volunteer.new
  end

  def edit
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)

    if @volunteer.save
      redirect_to @volunteer, notice: 'Volunteer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @volunteer.update(volunteer_params)
      redirect_to @volunteer, notice: 'Volunteer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @volunteer.destroy
    redirect_to pages_url, notice: 'Volunteer was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or contraints between actions.
  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :phone)
  end
end
