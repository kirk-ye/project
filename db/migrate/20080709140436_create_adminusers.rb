class CreateAdminusers < ActiveRecord::Migration
  def self.up
    create_table :adminusers do |t|
      t.column :Name, :string
      t.column :Hashed_Password, :string
      t.column :Salt, :string
    end
  end

  def self.down
    drop_table :adminusers
  end
end
