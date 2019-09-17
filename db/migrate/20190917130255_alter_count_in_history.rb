class AlterCountInHistory < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :count, :counter
  end
end
