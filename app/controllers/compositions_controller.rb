class CompositionsController < ApplicationController
    def show
        comp = Composition.first
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
end
