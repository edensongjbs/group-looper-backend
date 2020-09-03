class LayersController < ApplicationController
    def create
        layer = Layer.create!(layer_params)
        composition = layer.composition
        # this is where we'll do the Action Cable stuff
        CompositionsChannel.broadcast_to(composition, layer.serialize)
        # byebug
        render json: {oldId:layer.temporary_id, newId: layer.id}
    end

    private

    def layer_params
        params.require(:layer).permit(:composition_id, :sound_preset_name, :user_id, :name, :temporary_id, :pitch_events, :read_only)
    end
end
