class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.integer :user_id
      t.integer :piece_id
      t.integer :times
      t.integer :score

      t.timestamps
    end

    add_index :studies, :user_id
    add_index :studies, :piece_id
    add_index :studies, [:user_id, :piece_id], unique: true
  end
end
