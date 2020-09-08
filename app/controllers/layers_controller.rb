class LayersController < ApplicationController
    before_action :logged_in?

    def create
        # byebug
        layer = Layer.create!(layer_params.merge(user: current_user))
        composition = layer.composition
        
        CompositionsChannel.broadcast_to(composition, {action:'ADD_LAYER', layer:layer.serialize(current_user)})
        
        render json: {oldId:layer.temporary_id, newId: layer.id}
    end

    def destroy
        layer = Layer.find(params[:id])
        composition = layer.composition
        if (layer.user == current_user) || (composition.creator == current_user)
            layer.destroy
            CompositionsChannel.broadcast_to(composition, {action:'DELETE_LAYER', layerId:params[:id].to_i})
            render json: {message: "Layer successfully deleted"}
        else
            render json: {error: "Layer cannot be deleted by this user"}
        end
    end

    private

    def layer_params
        params.require(:layer).permit(:composition_id, :sound_preset_name, :name, :temporary_id, :pitch_events, :read_only)
    end
end
