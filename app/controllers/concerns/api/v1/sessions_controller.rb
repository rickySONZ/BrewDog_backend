class Api::V1::SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            render json: {
                id: user.id,
                status: 200,
                username: user.username,
                password: user.password,
                logged_in: true
            }
        elsif user
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
