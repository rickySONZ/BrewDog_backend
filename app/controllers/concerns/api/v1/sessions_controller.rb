class Api::V1::SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:user][:username])
    
        if @user && @user.authenticate(params[:user][:password])
            @token = encode_token(user_id: @user.id)
            render json: {
                user: {
                id: @user.id,
                status: 200,
                email: @user.email,
                username: @user.username,
                password: @user.password,
                logged_in: true
            },
        token: @token}
        elsif @user
            render json: {
                status: 500,
                error: "Wrong Password"
            }
        else
            render json: {
                status: 500,
                error: "Username Not Found"
            }
        end
    end


end
