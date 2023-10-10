class HobbiesController < ApplicationController
    def index
    end
  
    def new
      @hobby = Hobby.new
    end
  
    def show
      @hobby = Hobby.find_by(id: params[:id])
    end
  
    def create
      @hobby = Hobby.new(hobby_params)
      params[:hobby][:question] ? @hobby.question = params[:hobby][:question].join("") : false
      if @hobby.save
          flash[:notice] = "診断が完了しました"
          redirect_to hobby_path(@hobby.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def hobby_params
        params.require(:hobby).permit(:id, question: [])
    end
end
