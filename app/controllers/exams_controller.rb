class ExamsController < ApplicationController
    before_action :set_exam, only: [:edit, :update, :destroy]
    
  def index
    @exams = Exam.all
  end

  def new
#    @exam = Exam.new
    if params[:back]
      @exam = Exam.new(exams_params)
    else
      @exam = Exam.new
    end




  end
  
  def edit
#    @exam = Exam.find(params[:id])
  end
  
  def confirm
    @exam = Exam.new(exams_params)
    render :new if @exam.invalid?
  end

  
  def update
#    @exam =Exam.find(params[:id])
    #@exam.update(exams_params)
    @exam.update(exams_params)
    if @exam.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to exams_path, notice: "更新しました！"
    else
      # 入力フォームを再描画します。
      render 'edit'
    end    
    
  end
  
  def destroy
#    @exam = Exam.find(params[:id])
    @exam.destroy
    redirect_to exams_path,notice:"削除しました"
  end
  
  def create
    #Exam.create(exams_params)
    #redirect_to exams_path,notice:"ツイートしました"
     @exam = Exam.new(exams_params)
    if @exam.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to exams_path, notice: "ツイートしました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  private
    def exams_params
      params.require(:exam).permit(:content)
    end
    
    def set_exam
      @exam = Exam.find(params[:id])
    end
end