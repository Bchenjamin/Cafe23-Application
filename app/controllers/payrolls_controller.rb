require 'date'
class PayrollsController < ApplicationController
    def store_form
    end

    def employee_form
        if current_user.manager_role?
            redirect_to home_path
        end
    end
    
    def employee_report
        @employee_payroll = PayrollCalculator.new(DateRange.new(params[:start_date].to_s.to_date, params[:end_date].to_s.to_date))
        # payroll = @employee_payroll.create_payroll_record_for(@employee)
    end

    def store_report
        @store_payroll = PayrollCalculator.new(DateRange.new(params[:start_date].to_s.to_date, params[:end_date].to_s.to_date))
        # payroll = @store_payroll.create
    end

end
