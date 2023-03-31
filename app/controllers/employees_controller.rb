  class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    before_action :check_login

    def index
      if current_user.admin_role?
        @active_employees = Employee.active
        @inactive_employees = Employee.inactive
      else # manager role 
        @active_employees = current_user.current_assignment.store.employees.active
        @inactive_employees = current_user.current_assignment.store.employees.inactive
      end
    end

    def show
      @current_assignment = @employee.current_assignment
      @other_assignments = @employee.assignments
    end

    def new
      @employee = Employee.new
    end

    def create
      @employee = Employee.new(employee_params)
      if @employee.save
        flash[:notice] = "Successfully added #{@employee.proper_name} as an employee."
        redirect_to @employee
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @employee.update(employee_params)
        flash[:notice] = "Updated #{@employee.proper_name}'s information."
        redirect_to @employee
      else
        render action: 'edit'
      end
    end

    def destroy
      if @employee.destroy
        redirect_to employees_path
      else
        render action: 'show'
      end
    end

    private
      def set_employee
        @employee = Employee.find(params[:id])
      end

      def employee_params
        params.require(:employee).permit(:first_name, :last_name, :ssn, :phone, :date_of_birth, :role, :username, :password, :password_confirmation, :active)
      end  
  end
