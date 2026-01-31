class PerfumesController < ApplicationController
    def index
    end

    def new
        @perfume = Perfume.new
    end

    def show
        @perfume = Perfume.find_by(id: params[:id])
    end

    def create
      @perfume = Perfume.new(perfume_params)
      
        if params[:perfume][:question]
        result_code = params[:perfume][:question].join("")
        @perfume.question = result_code

        @perfume.mood_type =
            case result_code
            when "1111", "1112", "1121", "1211", "2111"
                "energetic"
            when "2222", "2221", "2212", "2122"
                "tired"
            else
                "normal"
        end
        end


      @perfume.user_id = current_user.id
      
      if @perfume.save
          flash[:notice] = "診断が完了しました"
          redirect_to perfume_path(@perfume.id)
      else
          redirect_to :action => "new"
      end
    end

    private
    def perfume_params
        params.require(:perfume).permit(:id, question: [])
    end
end
