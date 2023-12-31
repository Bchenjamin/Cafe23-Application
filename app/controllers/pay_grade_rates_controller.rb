class PayGradeRatesController < ApplicationController
    def new
        @pay_grade_rate = PayGradeRate.new
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
        def pay_grade_rate_params
            params.require(:pay_grade_rate).permit(:pay_grade_id, :rate, :start_date, :end_date)
        end  

end
