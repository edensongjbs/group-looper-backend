class CompositionsController < ApplicationController
    def show
        comp = Composition.first
        the_res = {
            title: comp.name,
            origTempo: comp.tempo,
            numBars: comp.num_bars,
            timeSigNum: comp.time_sig_num,
            timeSigDenom: comp.time_sig_denom,
            layers:[]
        }
        render json: the_res
    end
end
