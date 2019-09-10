class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string, default: "user"
    add_column :users, :requested, :string
    add_column :users, :reason, :string
  end
end
