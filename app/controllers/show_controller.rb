class ShowController < ApplicationController
  

  def index
    @categories = Category.find(:all,:conditions=>"IsShow = 1",:order => "'Order' desc")
    #@new_ents = Enterprise.find([223,2245,555,333,666,542,664,777,6643,44452])
    @new_ents = Array.new
    
  end
  
  def in_allcount
    puts Enterprise.aaf_index.ferret_index.size
    #@e = Enterprise.new
    #@e.EntName = "测试数据"
    #@e.save
    #puts Enterprise.aaf_index.ferret_index.size
    @ent = Enterprise.find_by_contents("数据")
    puts @ent.size.to_s + "sss"
  end
  def test_count
    @e = Enterprise.find(558)
    @e.EntName ="数据数据数据"
    puts @e.Id
    puts @e.save
    
    render(:template => 'show/test')
    #puts Enterprise.aaf_index.ferret_index.size
    #@ent = Enterprise.find_by_contents('数据')
    #puts @ent.size.to_s + "sss"
  end
  def ind
    Enterprise.bulk_index([47752,47753,556])
  end
  
end
