class UserCompositionsController < ApplicationController
    before_action :logged_in?

    def create
        cu = current_user
        user = User.find_by(user_name:params[:user_composition][:user_name])
        composition = Composition.find(params[:user_composition][:composition_id])
        # byebug
        if user
            # byebugsf
            is_new = !(user.compositions.to_a.find{|comp| comp == composition} || (composition.creator == user))
        end
        if user && is_new
            user_obj = {userName:user.user_name, creatorName:cu.user_name}
            # byebug
            UserComposition.create!(user:user, composition:composition, creator:cu)
            CompositionsChannel.broadcast_to(composition, {action:'ADD_USER', user:user_obj})
            render json: user_obj
        else
            render json: {message: "User doesn't exist or is already added"}
        end
    end

    def destroy
        # byebug
        cu = current_user
        user = User.find_by(user_name:params[:user_composition][:user_name])
        composition = Composition.find(params[:user_composition][:composition_id])
        if user && composition
            uc = UserComposition.find_by(user:user, composition:composition)
        end
        if uc && uc.deletable_by(cu)
            uc.destroy
            CompositionsChannel.broadcast_to(composition, {action:'REMOVE_USER', userName: user.user_name})
            render json: {message: "User successfully removed"}
        else
            render json: {message: "User cannot be removed at this time"}
        end
    end

    # private

    # def user_composition_params
    #     params.require(:user_composition).permit(:user)
    # end
end
