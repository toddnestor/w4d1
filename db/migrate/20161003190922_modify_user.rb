class ModifyUser < ActiveRecord::Migration
  def change
    remove_column :users, :fname
    remove_column :users, :lname

    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :email, :string, null: false, default: ""
  end
end
