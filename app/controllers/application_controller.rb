class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_authentication

  protected

  def layout_authentication
    'authentication' if devise_controller?
  end
end
