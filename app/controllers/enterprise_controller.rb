class EnterpriseController < ApplicationController
  #layout "index"
    
  
  def index
  end
  
  def detail
    
    begin
      @ent = Enterprise.find(params[:id])
      #@ent = Enterprise.find(:first,:conditions=>["e.id = ?",params[:id]],:joins => "as e left join categories as c on e.categoryid = c.id")
      correlation_ent(@ent.CategoryId)
    
    rescue  =>error  #RecordNotFound
      puts error.to_s
      logger.error("Attempt to access invalid product #{params[:id]}" + error.to_s)
      #redirect_to :action => :index
    end
    render(:layout => "index")
  end
  
  def list 
    #@ents = Enterprise.find(:all,:conditions =>["CategoryId = ?",params[:cid]],:offset=>2,:limit=>50)
    
    @ents = Enterprise.search(params[:page]||1,params[:cid])
    #puts @ents.total_pages
    #puts @ents.total_entries
  end
  
  def correlation_ent(categoryid) # 相关企业
    @corr_ents = Enterprise.find_by_sql(["select * from ( SELECT id,entname FROM enterprises where enterprises.categoryid = ? limit 10,10000) as a   ORDER BY RAND()  limit 10,10",categoryid])
    #
  end
  
end
