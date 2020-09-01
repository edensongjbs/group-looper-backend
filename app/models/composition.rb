class Composition < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :layers

    def serialize_layers
        self.layers.to_a.map{ |l| {
                compositionId: l.composition_id,
                instrumentName: l.sound_preset_name,
                userId: l.user_id,
                layerName: l.name,
                id: l.id,
                layerString: l.pitch_events,
                readOnly: l.read_only
            }
        }
    end
end
