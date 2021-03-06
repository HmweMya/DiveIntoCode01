class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer =current_user.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to q_path(@answer.q), notice: 'コメントの作成に成功しました。' }
        format.json { render :show, status: :created, location: @answer }
        @q = @answer.q
        @answers = @q.answers
        format.js {render :index, notice: 'コメントの作成に成功しました。'}
        Answermailer.sendmail_confirm(@answer).deliver
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to q_path(@answer.q), notice: 'コメントは正常に更新されました。' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to q_path(@answer.q), notice: 'コメントが正常に消されました。' }
      format.json { head :no_content }
      @q = @answer.q
      format.js { render :index, notice: 'コメントが正常に消されました。' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:q_id, :user_id, :content)
    end
end
