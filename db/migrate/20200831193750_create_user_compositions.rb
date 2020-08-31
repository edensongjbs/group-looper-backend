class CreateUserCompositions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_compositions do |t|
      t.integer :user_id
      t.integer :composition_id
      t.timestamps
    end
  end
end
