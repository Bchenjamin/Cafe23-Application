class JobsController < ApplicationController
    before_action :set_job, only: [:edit, :update, :destroy]
    before_action :check_login

    def index
      @active_jobs = Job.alphabetical.active
      @inactive_jobs = Job.alphabetical.inactive
    end

    def new
      @job = Job.new
    end

    def edit
    end

    def create
      @job = Job.new(job_params)
      if @job.save
        redirect_to jobs_path
      else
        render action: 'new'
      end
    end

    def update
      if @job.update(job_params)
        redirect_to jobs_path
      else
        render action: 'edit'
      end
    end

    def destroy
      if @job.destroy
        redirect_to jobs_path
      else
        render action: 'index'
      end
    end

    private
      def set_job
        @job = Job.find(params[:id])
      end

      def job_params
        params.require(:job).permit(:name, :description, :active)
      end  
end
