class UserComposition < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    belongs_to :user
    belongs_to :composition

    def deletable_by(user)
        (self.user == user) || (self.creator == user) || (self.composition.creator == user)
    end

end
