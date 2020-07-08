class CreateUrgeFors < ActiveRecord::Migration[6.0]
  def change
    create_table :urge_fors do |t|
      t.string :urge

      t.timestamps
    end
  end
end
