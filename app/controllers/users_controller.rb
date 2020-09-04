class UsersController < ApplicationController

    def create
        # byebug
        user = User.new(user_name: params[:user_name], password: params[:password], password_confirmation: params[:password_confirmation], email: params[:email], name: params[:name] )
        if user.valid?
            user.save
            render json: {userName: user.user_name, jwt: encode_token({user_id: user.id})}     
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :name, :email, :password_digest, :img_url, :bio)
    end

end
