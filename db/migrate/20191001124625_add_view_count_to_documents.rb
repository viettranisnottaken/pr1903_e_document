class AddViewCountToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :view_count, :integer
  end
end
