class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :code
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
