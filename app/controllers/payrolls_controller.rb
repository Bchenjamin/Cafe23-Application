class PayrollsController < ApplicationController
    before_action :set_pay_grade_rate, only: [:new]
    before_action :check_login
    authorize_resource
    def store_form
    end

    def employee_form
    end
    
    def employee_report
        employee_payroll = PayrollCalculator.new(DateRange.new(employee_payroll_params))
    end

    def store_report
        store_payroll = PayrollCalculator.new(DateRange.new(store_payroll_params))
    end

    private
    def session_params
        params.require(:session).permit(:username, :password)
    end  

    def employee_payroll_params
        params.require(:employees).permit(:employee_id, :start_date, :end_date)
    end

    def store_payroll_params
        params.require(:stores).permit(:store_id, :start_date, :end_date)
    end
end
