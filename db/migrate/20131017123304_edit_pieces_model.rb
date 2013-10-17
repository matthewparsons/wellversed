class EditPiecesModel < ActiveRecord::Migration
  def change
  	change_column :pieces, :author_id, :integer
  end

end
