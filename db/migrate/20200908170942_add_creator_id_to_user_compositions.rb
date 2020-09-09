class AddCreatorIdToUserCompositions < ActiveRecord::Migration[6.0]
  def change
    add_column :user_compositions, :creator_id, :integer
  end
end
