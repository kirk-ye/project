class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :EntId, :int
      t.column :Content, :string
      t.column :FromIP, :string
      t.column :CreateTime, :datetime
      t.column :Type, :int
      t.column :Status, :int
    end
  end

  def self.down
    drop_table :comments
  end
end
