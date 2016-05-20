class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end

  include SessionsHelper

  private
  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      redirect_to new_session_path
    end
  end
end
