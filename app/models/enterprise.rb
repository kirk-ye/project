class Enterprise < ActiveRecord::Base
  def self.search(page,categoryid)
    paginate  :per_page => 50, 
              :page => page,
              :conditions => ['categoryid = ?', categoryid], 
              :order => 'createtime'
  end
end
