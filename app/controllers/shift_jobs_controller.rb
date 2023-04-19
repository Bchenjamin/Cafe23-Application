class ShiftJobsController < ApplicationController
    before_action :set_shift_job, only: [:show, :edit, :destroy]
    before_action :check_login
  
  def index
  end

  def show
  end

  def new
    @shift_job = ShiftJob.new
  end

  def create
    @shift_job = ShiftJob.new(shift_job_params)
    if @shift_job.save
      flash[:notice] = "Successfully added #{@shift_job.job.name} Job to #{@shift_job.shift.assignment.employee.proper_name}."
      redirect_to shift_path(ShiftJob.last.shift)
    else
      render action: 'new'
    end
  end

  def edit
  end

  def destroy
    @shift_job.destroy
    redirect_to shift_path(@shift_job.shift)
  end


  private
    def set_shift_job
      @shift_job = ShiftJob.find(params[:id])
    end

    def shift_job_params
      params.require(:shift_job).permit(:shift_id, :job_id)
    end  
end

