class AddFilenameToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :filename, :string
    remove_column :pieces, :content
  end
end
