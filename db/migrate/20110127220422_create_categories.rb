class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.boolean :income, :default => false, :null => false
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
