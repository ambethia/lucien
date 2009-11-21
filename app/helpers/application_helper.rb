module ApplicationHelper
  include TagsHelper

  def render_flashes
    [:notice, :success, :warning, :error].collect do |key|
      content_tag(:div, flash[key], :class => "flash #{key}") unless flash[key].blank?
    end.join
  end

  # %li.current= link_to "Orders", "#"
  def nav_link(tab, link, label = nil)
    content_tag :li, :class => @current_tab == tab ? "current" : nil do
      link_to label || tab.to_s.titleize, link
    end
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

  def content_defined?(var)
    content_var_name="@content_for_#{var}"
    !instance_variable_get(content_var_name).nil?
  end
end
