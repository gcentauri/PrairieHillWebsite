class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :volunteer, only: [:show, :edit, :update, :destroy]

  def index
    @shifts = Shift.all

    @shiftss = Shift.order(:title)
    respond_to do |format|
      format.html
      format.xls # { send_data @shiftss.to_csv(col_sep: "\t") }
    end

  end

  def volunteer
    @activities = Activity.all
    @shifts = Shift.all
    @user = current_user
    @shift_titles = @shifts.pluck(:title)
    @uniq_shifts = @shift_titles.uniq
    @vols_needed = @shifts.pluck(:vols_needed)

    unless current_user
      render action: 'login'
    end

    if current_user
      @username = @user.first_name + " " + @user.last_name
    end

  end

  def user_shifts
    @user = current_user
    @shifts = Shift.all
    @username = @user.first_name + " " + @user.last_name
    @user_shifts = @shifts.where(volunteer: @username)
  end

  def sandbox
    @shifts = Shift.all

    respond_to do |format|
      format.html
      format.json {}
    end
  end

  def show
  end

  def new
    @shift = Shift.new
  end

  def edit
  end

  def login
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

    shift = Shift.find params[:id]

    if @shift.update(shift_params)
      redirect_to @shift, notice: 'THANK YOU!'
    else
      render :edit
    end

  end

  def destroy
    @shift.destroy
    redirect_to shifts_url, notice: 'Shift was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or contraints between actions.
  def set_shift
    @shift = Shift.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shift_params
    params.require(:shift).permit(:title, :time, :vols_needed, :volunteer, :comments)
  end
end
