class UserComposition < ApplicationRecord
    belongs_to :user
    belongs_to :composition
end
