class AuthController < ApplicationController

    def create
        if params[:userName]
            user = User.find_by(user_name: params[:userName])
        else
            user = User.find_by(email: params[:email])
        end
        if user && user.authenticate(params[:password])
            render json: {userName: user.user_name, jwt: encode_token({user_id: user.id})}
        else
            render json: {error: "Invalid Username or Password"}
        end
    end

end
