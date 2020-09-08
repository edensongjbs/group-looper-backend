class Layer < ApplicationRecord
    belongs_to :user
    belongs_to :composition

    def serialize(user)
        # byebug
        {
            compositionId: self.composition_id,
            instrumentName: self.sound_preset_name,
            userName: self.user.user_name,
            layerName: self.name,
            id: self.id,
            layerString: self.pitch_events,
            readOnly: self.read_only, 
            oldId: self.temporary_id
        }
    end
end
