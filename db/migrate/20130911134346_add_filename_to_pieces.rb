class AddFilenameToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :filename, :string
  end
end
