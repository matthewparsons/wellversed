class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :author
      t.string :title
      t.string :filename

      t.timestamps
    end
  end
end
