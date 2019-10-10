class AddDownloadCountToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :download_count, :integer, default: 0
  end
end
