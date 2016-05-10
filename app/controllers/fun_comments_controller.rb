class FunCommentsController < ApplicationController
  before_action :set_fun_comment, only: [:show, :edit, :update, :destroy]

  # GET /fun_comments
  # GET /fun_comments.json
  def index
    @fun_comments = FunComment.all
  end

  # GET /fun_comments/1
  # GET /fun_comments/1.json
  def show
  end

  # GET /fun_comments/new
  def new
    @fun_comment = FunComment.new
  end

  # GET /fun_comments/1/edit
  def edit
  end

  # POST /fun_comments
  # POST /fun_comments.json
  def create
    @fun_comment = FunComment.new(fun_comment_params)

    respond_to do |format|
      if @fun_comment.save
        format.html { redirect_to @fun_comment, notice: 'Fun comment was successfully created.' }
        format.json { render :show, status: :created, location: @fun_comment }
      else
        format.html { render :new }
        format.json { render json: @fun_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fun_comments/1
  # PATCH/PUT /fun_comments/1.json
  def update
    respond_to do |format|
      if @fun_comment.update(fun_comment_params)
        format.html { redirect_to @fun_comment, notice: 'Fun comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @fun_comment }
      else
        format.html { render :edit }
        format.json { render json: @fun_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fun_comments/1
  # DELETE /fun_comments/1.json
  def destroy
    @fun_comment.destroy
    respond_to do |format|
      format.html { redirect_to fun_comments_url, notice: 'Fun comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fun_comment
      @fun_comment = FunComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fun_comment_params
      params.require(:fun_comment).permit(:author_no, :name, :body, :deleted)
    end
end
