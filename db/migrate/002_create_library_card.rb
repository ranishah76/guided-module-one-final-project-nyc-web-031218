class CreateLibraryCard < ActiveRecord::Migration
  def change
    create_table :librarycards do |t|
      t.integer :user_id
      t.integer :book_id
    end
  end
end
