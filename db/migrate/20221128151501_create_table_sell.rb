class CreateTableSell < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :amount
      t.belongs_to :user, index: true
      t.belongs_to :kitties, index: true
      t.timestamps
    end
  end
end
