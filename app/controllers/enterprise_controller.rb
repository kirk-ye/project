class EnterpriseController < ApplicationController
  #layout "index"
  protect_from_forgery :only => :index
  
  IsSearchIndex = true #表示当前是查找ferret索引
  
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
    @categories = Category.find(:all,:conditions=>"IsShow = 1",:order => "'Order' desc")
    render(:layout => "index")
  end
  
  def search
    redirect_to("/list/"+params[:cid].to_s) if params[:cid] != "0" && (params[:search] == nil ||params[:search].empty?)
    if IsSearchIndex
      searchindex
    else
      if (params[:cid].nil? ||params[:cid] == "0")
        @ents = Enterprise.searchwordNoCategorId(params[:page]||1,params[:search])
      else
        @ents = Enterprise.searchword(params[:page]||1,params[:cid],params[:search])
      end
    end
    @categories = Category.find(:all,:conditions=>"IsShow = 1",:order => "'Order' desc")
    @title = "企业收录网 "
    render(:template => 'enterprise/list')
  end
  
  def list 
    #@ents = Enterprise.find(:all,:conditions =>["CategoryId = ?",params[:cid]],:offset=>2,:limit=>50)
    @cid = params[:cid]
    @ents = Enterprise.search(params[:page]||1,params[:cid])
    @categories = Category.find(:all,:conditions=>"IsShow = 1",:order => "'Order' desc")
    @title = "企业收录网"
  end
  
  # 查找ferret中的index
  def searchindex
    if (params[:cid].nil? ||params[:cid] == "0")
      @ents = Enterprise.find_with_ferret(params[:search],:page =>(params[:page]||1),:per_page => 50)
    else
      @ents = Enterprise.find_with_ferret(params[:search],:conditions =>["CategoryId = ? ",params[:cid]],:page =>(params[:page]||1),:per_page => 50)
    end
    #puts @ents.total_hits.to_s + "dddddddd"
  end
  
  def correlation_ent(categoryid) # 相关企业
    @corr_ents = Enterprise.find_by_sql(["select * from ( SELECT id,entname FROM enterprises where enterprises.categoryid = ? limit 10,10000) as a   ORDER BY RAND()  limit 10,10",categoryid])
  end
  
end
