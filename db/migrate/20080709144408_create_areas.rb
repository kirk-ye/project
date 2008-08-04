class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.column :Name, :string
      t.column :Leaf, :string
      t.column :Order, :int
    end
  end

  def self.down
    drop_table :areas
  end
end
