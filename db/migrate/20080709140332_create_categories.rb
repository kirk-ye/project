class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.column :CategoryName, :string
      t.column :CategoryLeft, :string
      t.column :Order, :int
    end
  end

  def self.down
    drop_table :categories
  end
end
