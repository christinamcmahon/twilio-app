class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.valid? && @user.save
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: "failed to create user" }, status: :not_acceptable
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: { message: "user successfully updated.", success: true, data: @user }, status: 200
    else
      puts "Errors= #{@user.errors.full_messages.join(", ")}"
      render json: { message: "user NOT updated because #{@user.errors.full_messages.join(", ")}", success: false, data: @user.errors.full_messages }, status: 406
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: { message: "user successfully deleted.", success: true, data: @user }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password_digest, :avatar, :name, :bio)
    end
end
