class AddSenderToBuzzs < ActiveRecord::Migration[6.0]
  def change
    add_column :buzzs, :sender, :string
    
  end
end
