class Commons::CommonController < ActionController::Base
  #uses_component_template_root
  def footer
    render(:layout => false)
  end
end