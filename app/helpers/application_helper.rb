module ApplicationHelper

  def render_flash
    flashes = ''
    [:error, :notice, :success].each do |f|
      if flash[f]
        flashes << render(:partial => "layouts/flash",
                          :locals => { :message => flash[f] })
      end
    end
    return flashes
  end

  def secure_mail_to(email, name = nil)
    return name if email.blank?
    mail_to email, name, :encode => 'javascript'
  end

  def at(klass, attribute, options = {})
    klass.human_attribute_name(attribute.to_s, options = {})
  end

  def openid_link
    link_to at(User, :openid_identifier), "http://openid.net/"
  end
end
