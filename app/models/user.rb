class User < ApplicationRecord
    has_many :layers
    has_many :user_compositions
    has_many :compositions, through: :user_compositions
    has_many :compositions, foreign_key: :creator
end
