class Composition < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :layers

    def serialize_layers(user)
        self.layers.to_a.map{ |l| l.serialize(user) }
    end
end
