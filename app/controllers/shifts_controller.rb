class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :set_today
  before_action :check_login
  
  def index
    @upcoming_shifts = Shift.upcoming.chronological
    @completed_shifts = Shift.completed.chronological
  end

  def show
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to @shift
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to @shift
    else
      render action: 'edit'
    end
  end

  def destroy
    if @shift.destroy
      redirect_to shifts_path
    else
      render action: 'show'
    end
  end

  def time_in
    if @shift_today == nil
      flash[:notice] = "You do not have any shifts today"
      redirect_to home_path
    else
      @shift_today.start_shift_at()
      flash[:notice] = "Your shift has started."
      redirect_to home_path
    end
  end

  def time_out
    if @shift_today == nil
      flash[:notice] = "You do not have any shifts today"
      redirect_to home_path
    else
      @shift_today.end_shift_at()
      flash[:notice] = "Your shift has ended."
      redirect_to home_path
    end
  end

  def time_clock
    if @shift_today == nil
      flash[:notice] = "You do not have any shifts today"
      redirect_to home_path
    end
  end


  private
    def set_shift
      @shift = Shift.find(params[:id])
    end

    def set_today
      date_today = current_user.shifts.for_dates(DateRange.new(Date.current, Date.current)).first
      if date_today
        @shift_today = TimeClock.new(date_today)
      else
        @shift_today = nil
      end
      
    end

    def shift_params
      params.require(:shift).permit(:assignment_id, :date, :start_time, :end_time, :notes, :status)
    end  
end

