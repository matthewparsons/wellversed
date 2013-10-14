class RenameDatabaseColumn < ActiveRecord::Migration
  def up
		rename_column :pieces, :author, :author_id
  end

  def down
		rename_column :pieces, :author_id, :author
  end
end
