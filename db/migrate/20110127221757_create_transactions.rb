class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :description
      t.integer :category_id
      t.date :executed_at
      t.decimal :amount, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
