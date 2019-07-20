class CreateClues < ActiveRecord::Migration[5.1]
  def change
    create_table :clues do |t|
      t.string :uuid
      t.string :text

      t.timestamps
    end
  end
end
