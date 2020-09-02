class CompositionsController < ApplicationController
    def show
        comp = Composition.find(params[:id])
        layers = comp.serialize_layers
        the_res = {
            id: comp.id,
            title: comp.name,
            origTempo: comp.tempo,
            numBars: comp.num_bars,
            timeSigNum: comp.time_sig_num,
            timeSigDenom: comp.time_sig_denom,
            layers:layers
        }
        render json: the_res
    end

    def create
        comp = Composition.create!(composition_params)
        render json: {id:comp.id}
    end

    private

    def composition_params
        params.require(:composition).permit(:creator_id, :tempo, :name, :num_bars, :time_sig_num, :time_sig_denom)
    end
end
