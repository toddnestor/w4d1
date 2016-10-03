class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname, null: false

      t.timestamps null: false
    end
  end
end
