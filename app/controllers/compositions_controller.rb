class CompositionsController < ApplicationController
    before_action :logged_in?

    def show
        cu = current_user
        comp = Composition.find(params[:id])
        layers = comp.serialize_layers(cu)
        users = comp.user_compositions.to_a.map{|uc| {userName:uc.user.user_name, creatorName:uc.creator.user_name}}
        # byebug
        if comp.users.to_a.include?(cu)
            the_res = {
                creatorName: comp.creator.user_name,
                id: comp.id,
                title: comp.name,
                origTempo: comp.tempo,
                numBars: comp.num_bars,
                timeSigNum: comp.time_sig_num,
                timeSigDenom: comp.time_sig_denom,
                layers:layers,
                userName: cu.user_name,
                users:users
            }
            render json: the_res
        else
            render json: {message: "User isn't a part of this composition"}
        end
    end

    def create
        cu = current_user
        # byebug
        comp = Composition.create!(composition_params.merge(creator: current_user))
        UserComposition.create!(composition: comp, user: cu, creator: cu)
        render json: {id:comp.id}
    end

    private

    def composition_params
        params.require(:composition).permit(:tempo, :name, :num_bars, :time_sig_num, :time_sig_denom)
    end
end
