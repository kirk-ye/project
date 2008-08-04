class AddCategory < ActiveRecord::Migration
  def self.up
    add_column :categories,:IsShow,:bit,:default=>1
  end

  def self.down
    remove_colum :products,:IsShow
  end
end
