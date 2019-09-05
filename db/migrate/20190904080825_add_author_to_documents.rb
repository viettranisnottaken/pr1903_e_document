class AddAuthorToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :author, :string, default: "Unknown"
  end
end
