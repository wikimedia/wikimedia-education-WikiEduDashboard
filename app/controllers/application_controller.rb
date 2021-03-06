class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  helper_method :course_slug_path
  def course_slug_path(slug)
    course_path(:id => slug).gsub("%2F", "/")
  end

  helper_method :rtl?
  def rtl?
    tag = I18n::Locale::Tag::Rfc4646.tag(I18n.locale)
    tag.language.in? ["ar", "dv", "fa", "he", "ku", "ps", "sd", "ug", "ur", "yi"]
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    if I18n.locale != I18n.default_locale
      { locale: I18n.locale }.merge options
    else
      options
    end
  end
end
