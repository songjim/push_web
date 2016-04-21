class AddAvosColumn < ActiveRecord::Migration
  def change
  	add_column :avos, :name, :string
  end
end
