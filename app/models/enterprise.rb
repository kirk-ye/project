require 'acts_as_ferret'
class Enterprise < ActiveRecord::Base
  set_primary_key "Id"
  acts_as_ferret( {:fields => {
                        :Id => {:store => :yes},
                        :EntName => {:store => :yes},
                        :CategoryId =>{:store => :yes},
                        :Expenses =>{}     }},
                  {:analyzer=>RMMSeg::Ferret::Analyzer.new  }
                  )
  # mysql search
  def self.search(page,categoryid)
    paginate  :per_page => 50, 
              :page => page,
              :conditions => ['categoryid = ?', categoryid], 
              :order => 'createtime'
  end
  
  def self.searchword(page,categoryid,word)
    paginate  :per_page => 50, 
              :page => page,
              :conditions => ['categoryid = ? AND Expenses like ? ', categoryid,'%'+word+'%'], 
              :order => 'createtime'
  end
  
  def self.searchwordNoCategorId(page,word)
    paginate  :per_page => 50, 
              :page => page,
              :conditions => ['Expenses like ? ','%'+word+'%'], 
              :order => 'createtime'
  end
  
 
end
