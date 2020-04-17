class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :not_acceptable
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: { message: "comment successfully updated.", success: true, data: @comment }, status: 200
    else
      puts "Errors= #{@comment.errors.full_messages.join(", ")}"
      render json: { message: "comment NOT updated because #{@comment.errors.full_messages.join(", ")}", success: false, data: @comment.errors.full_messages }, status: 406
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    render json: { message: "comment successfully deleted.", success: true, data: @comment }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
