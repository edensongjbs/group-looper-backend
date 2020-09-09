class AuthController < ApplicationController
    before_action :logged_in?, only: :index

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

    def index
        compositions = current_user.compositions.to_a.map{|comp| {id:comp.id, title:comp.name}}
        render json: {compositions:compositions}
    end

end
