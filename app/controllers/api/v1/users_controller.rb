class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :token_authenticate, :index]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
    
    def create
      # byebug
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
    def index
        @users = User.all
        render json: @users
    end
    def token_authenticate
      token = request.headers["Authorization"]
      decoded_token = decode(token)
      # byebug

      user = User.find(decoded_token[0]["user_id"])
      render json: user
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :bio, :avatar)
    end
end 
