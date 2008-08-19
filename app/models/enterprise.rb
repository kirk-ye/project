class Enterprise < ActiveRecord::Base
  def self.search(page,categoryid)
    paginate  :per_page => 50, 
              :page => page,
              :conditions => ['categoryid = ?', categoryid], 
              :order => 'createtime'
  end
  
  def self.searchword(page,categoryid,word)
    paginate  :per_page => 50, 
              :page => page,
              :conditions => ['categoryid = ? AND Expenses like "%?%" ', categoryid,word], 
              :order => 'createtime'
  end
  
  def self.searchwordNoCategorId(page,word)
    puts word
    paginate  :per_page => 50, 
              :page => page,
              :conditions => ['Expenses like "%?%" ',word], 
              :order => 'createtime'
  end
end
