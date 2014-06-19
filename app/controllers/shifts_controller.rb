class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :volunteer, only: [:show, :edit, :update, :destroy]

  def index
    @shifts = Shift.all
  end

  def volunteer
    @shifts = Shift.all
    @user = current_user
#    @volunteered = @shift.user_ids.length

    unless current_user
      render action: 'new'
    end

  end

  def show
  end

  def new
    @shift = Shift.new
  end

  def edit
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to @shift, notice: 'Shift was successfully created.'
    else
      render :new
    end
  end

  def update
    @user = current_user

    if @shift.update(shift_params)
      redirect_to @shift, notice: 'Shift was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to pages_url, notice: 'Shift was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or contraints between actions.
  def set_shift
    @shift = Shift.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shift_params
    params.require(:shift).permit(:title, :time, :vols_needed, :user_ids => [])
  end
end
