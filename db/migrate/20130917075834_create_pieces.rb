class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :author_id
      t.string :title
      t.string :filename

      t.timestamps
    end
  end
end
