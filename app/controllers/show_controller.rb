class ShowController < ApplicationController
  def index
    @categories = Category.find(:all,:conditions=>"IsShow = 1",:order => "'Order' desc")
    #@c = Category.find(1);
    #@new_ents = Enterprise.find(:all, :conditions =>" ShowFirst =1 ",:order => "CreateTime desc")
    @new_ents = Enterprise.find([223,2245,555,333,666,542,664,777,6643,44452])
  end
end
