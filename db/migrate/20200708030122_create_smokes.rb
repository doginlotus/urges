class CreateSmokes < ActiveRecord::Migration[6.0]
  def change
    create_table :smokes do |t|
      t.datetime :datetime
      t.date :date
      t.string :what
      t.text :notes

      t.timestamps
    end
  end
end
