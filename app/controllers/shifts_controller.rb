# -*- coding: utf-8 -*-
class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  #before_action :volunteer, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.all
    @shifts = Shift.all
    #@sorted = @shifts.sort_by { |s| s.title }
    @shiftss = Shift.order(:title)
    #respond_to do |format|
    #  format.csv { send_data @shifts.to_csv }
    #  format.xls # { send_data @shiftss.to_csv(col_sep: "\t") }
#   #   format.xlsx { send_data @shifts.to_xlsx }
    #  format.xlsx { send_file @shifts.to_xlsx }
    #end
  end

  # def volunteer
  #   @activities = Activity.all
  #   @shifts = Shift.all
  #   @user = current_user
  #   @shift_titles = @shifts.pluck(:title)
  #   @uniq_shifts = @shift_titles.uniq
  #   @vols_needed = @shifts.pluck(:vols_needed)

  #   @setup = @uniq_shifts.find { |e| /Setup/ =~ e }
  #   @teardown = @uniq_shifts.find { |e| /Tear/ =~ e }

  #   @firstLast = [@setup, @teardown]
  #   @middle = @uniq_shifts - @firstLast
  #   @activityOrder = [@setup].concat(@middle.concat([@teardown]))

  #   #unless current_user
  #    # render action: 'login'
  #   #end

  #   if current_user
  #     @username = @user.first_name + " " + @user.last_name
  #   end

  # end


  # def sandbox
  #   @shifts = Shift.all

  #   respond_to do |format|
  #     format.html
  #     format.json {}
  #   end
  # end

  def new
    @shift = Shift.new
  end

  def show
  end
  
  def edit
  end

  def login
  end

  def create
    @shift = Shift.new(shift_params)

    respond_to do |format|
      if @shift.save
        flash[:success] = "Shift saved!"
        #redirect_to @shift, notice: 'Shift was successfully created.'
        format.html { redirect_to Activity.find(@shift.activity_id) }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    
    shift = Shift.find params[:id]

    respond_to do |format|
      if @shift.update(shift_params)
        #      redirect_to @shift, notice: 'THANK YOU!'
        format.html { redirect_to activities_path , notice: 'Period was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { hdad :no_content }
    end
  end

  private
  # Use callbacks to share common setup or contraints between actions.
  def set_shift
    @shift = Shift.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shift_params
    params.require(:shift).permit(:title, :time, :start_time, :end_time, :activity_id, :vols_needed, :volunteer, :guest, :user_id, :_destroy)
  end
end
