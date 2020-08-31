class CreateLayers < ActiveRecord::Migration[6.0]
  def change
    create_table :layers do |t|
      t.integer :composition_id
      t.string :sound_preset_name
      t.integer :user_id
      t.string :name
      t.string :temporary_id
      t.text :pitch_events
      t.boolean :read_only
    end
  end
end
