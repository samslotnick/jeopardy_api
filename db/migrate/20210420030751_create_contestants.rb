class CreateContestants < ActiveRecord::Migration[6.0]
  def change
    create_table :contestants do |t|
      t.string :name
      t.integer :score
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
