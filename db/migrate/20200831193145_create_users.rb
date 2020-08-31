class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :img_url
      t.string :password_digest
      t.text :bio
      t.string :user_name
    end
  end
end
