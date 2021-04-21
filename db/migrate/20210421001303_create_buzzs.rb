class CreateBuzzs < ActiveRecord::Migration[6.0]
  def change
    create_table :buzzs do |t|
      t.references :contestant, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.boolean :buzzed

      t.timestamps
    end
  end
end
