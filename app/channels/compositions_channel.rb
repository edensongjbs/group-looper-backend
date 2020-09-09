


class CompositionsChannel < ApplicationCable::Channel
  
    def subscribed
      
      @composition = Composition.find(params[:composition])
      # byebug
      stream_for @composition
    end

    def received(data)
      CompositionsChannel.broadcast_to(@composition, {
        layers: @composition.layers, user_compositions: @composition.user_compositions
      })
    end

    def unsubcribed

    end
end