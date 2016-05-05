class AddFieldToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :subtitle, :text
  end
end
