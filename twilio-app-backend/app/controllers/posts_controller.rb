class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :not_acceptable
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: { message: "post successfully updated.", success: true, data: @post }, status: 200
    else
      puts "Errors= #{@post.errors.full_messages.join(", ")}"
      render json: { message: "post NOT updated because #{@post.errors.full_messages.join(", ")}", success: false, data: @post.errors.full_messages }, status: 406
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    render json: { message: "post successfully deleted.", success: true, data: @post }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :date_time, :content, :img, :user_id, :likes)
    end
end
