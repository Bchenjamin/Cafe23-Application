class ShiftsController < ApplicationController
  before_action :set_shifts, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  
  def index
  end

  def show
  end

  def new
    @store = Store.new
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      flash[:notice] = "Successfully added #{@shift.name} store."
      redirect_to @shift
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      flash[:notice] = "Successfully updated #{@shift.name} store."
      redirect_to @shift
    else
      render action: 'edit'
    end
  end

  def destroy
    raise UrlGenerationError
  end

  private
    def set_shift
      @shift = Shift.find(params[:id])
    end

    def store_params
      params.require(:shift).permit(:assignment_id, :date, :start_time, :end_time, :notes, :status)
    end  
end

