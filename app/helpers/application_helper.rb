module ApplicationHelper

  def render_flash
    if flash[:notice]
      render :partial => "layouts/flash", :locals => { :message => flash[:notice] }
    end
  end
end
