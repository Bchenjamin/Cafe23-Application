class PayGradeRatesController < ApplicationController
    before_action :set_pay_grade_rate, only: [:new]
    before_action :check_login
    
    def new
        @pay_grade_rate = PayGradeRate.new
        @pay_grade = PayGrade.find(params[:pay_grade_id])
        @temp = @pay_grade_rate.pay_grades
    end

    def create
        @pay_grade_rate = PayGradeRate.new(pay_grade_rate_params)
        if @pay_grade_rate.save
          redirect_to pay_grade_path(PayGradeRate.last.pay_grade)
        else
          render action: 'new'
        end
    end

    private
        def set_pay_grade_rate
            @pay_grade_rate = PayGradeRate.find(params[:id])
        end

        def pay_grade_rate_params
            params.require(:pay_grade_rate).permit(:pay_grade_id, :rate, :start_date, :end_date)
        end  

end
