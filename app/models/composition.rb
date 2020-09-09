class Composition < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :layers
    has_many :user_compositions
    has_many :users, through: :user_compositions
    validates :name, presence: true
    validates :tempo, numericality: [greater_than_or_equal_to: 10, less_than_or_equal_to: 500]

    def serialize_layers(user)
        self.layers.to_a.map{ |l| l.serialize(user) }
    end
end
