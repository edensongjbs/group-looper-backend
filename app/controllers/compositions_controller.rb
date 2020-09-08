class CompositionsController < ApplicationController
    before_action :logged_in?

    def show
        cu = current_user
        comp = Composition.find(params[:id])
        layers = comp.serialize_layers(cu)
        the_res = {
            creatorName: comp.creator.user_name,
            id: comp.id,
            title: comp.name,
            origTempo: comp.tempo,
            numBars: comp.num_bars,
            timeSigNum: comp.time_sig_num,
            timeSigDenom: comp.time_sig_denom,
            layers:layers,
            userName: cu.user_name
        }
        render json: the_res
    end

    def create
        comp = Composition.create!(composition_params.merge(creator: current_user))
        render json: {id:comp.id}
    end

    private

    def composition_params
        params.require(:composition).permit(:tempo, :name, :num_bars, :time_sig_num, :time_sig_denom)
    end
end
