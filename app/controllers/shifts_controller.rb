# -*- coding: utf-8 -*-
class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.all
    @shifts = Shift.all
    @shiftss = Shift.order(:title)
  end
  
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
        format.html { redirect_to ccf_user_shifts_path , notice: 'Period was successfully updated.' }
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
  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:title, :time, :start_time, :end_time, :activity_id, :vols_needed, :volunteer, :guest, :user_id, :category, :_destroy)
  end
end
