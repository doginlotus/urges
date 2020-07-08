class CreateUrges < ActiveRecord::Migration[6.0]
  def change
    create_table :urges do |t|
      t.datetime :datetime
      t.date :date
      t.integer :urge_for_id
      t.text :notes

      t.timestamps
    end
  end
end
