# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '6c02c4988a482d20ffdbbfec67949bf9'
  #rescue_from ActiveRecord::RecordNotFound :with => :rescue_record_not_found
  #def rescue_record_not_found  
  #  render :file => "#{RAILS_ROOT}/public/404.html"  
  #end
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  def gbToUtf8(text)
    Iconv.iconv("GB2312//IGNORE","UTF-8//IGNORE",text)
  end
end
