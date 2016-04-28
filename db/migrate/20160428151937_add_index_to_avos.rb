class AddIndexToAvos < ActiveRecord::Migration
  def change
  	add_index :avos, [:name,:installation], unique: true
  end
end
