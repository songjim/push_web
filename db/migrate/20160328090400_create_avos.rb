class CreateAvos < ActiveRecord::Migration
  def change
    create_table :avos do |t|
    	t.string :installation
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
