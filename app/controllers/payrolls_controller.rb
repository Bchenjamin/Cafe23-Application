require 'date'
class PayrollsController < ApplicationController
    def store_form
        authorize! :store_form, :payrolls_controller
    end

    def employee_form
        authorize! :employee_form, :payrolls_controller
        if current_user.manager_role?
            redirect_to home_path
        end
    end
    
    def employee_report
        authorize! :employee_report, :payrolls_controller
        @employee_payroll = PayrollCalculator.new(DateRange.new(params[:start_date].to_s.to_date, params[:end_date].to_s.to_date))
        @employee = Employee.find(employee_params[:employee_id])
        @emp_pay = @employee_payroll.create_payroll_record_for(@employee)
    end

    def store_report
        authorize! :store_report, :payrolls_controller
        @store_payroll = PayrollCalculator.new(DateRange.new(params[:start_date].to_s.to_date, params[:end_date].to_s.to_date))
        @store = Store.find(store_params[:store_id])
        @store_pay = @store_payroll.create_payrolls_for(@store)
    end

    private
        def store_params
            params.permit(:store_id, :start_date, :end_date)
        end

        def employee_params
            params.permit(:employee_id, :start_date, :end_date)
        end

end
