class User < ApplicationRecord
    has_many :layers
    has_many :user_compositions
    has_many :compositions, through: :user_compositions
    has_many :compositions, foreign_key: :creator
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with:/.+@.+\..+/, message: "Must be a valid email"}
    validates :user_name, presence: true, uniqueness: true, format: {with: /\A[a-zA-Z0-9\-_]+\z/, message: "Must be a valid username"}
    # validates :email, presence: true, uniqueness: true, format: {with:/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/, message: "Must be a valid email"}

end
