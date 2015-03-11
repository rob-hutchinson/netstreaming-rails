class EditUserDefault < ActiveRecord::Migration
  def change
    change_column :users, :currently_rented, :integer, default: 0
  end
end
