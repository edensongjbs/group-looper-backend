class CreateCompositions < ActiveRecord::Migration[6.0]
  def change
    create_table :compositions do |t|
      t.string :name
      t.integer :time_sig_num
      t.integer :time_sig_denom
      t.float :tempo
      t.integer :creator_id
      t.integer :num_bars
    end
  end
end
