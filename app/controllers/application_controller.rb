class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You are not authorized to access this page."
  end

  before_action :load_ability

  private

  def load_ability
    @current_ability ||= Ability.new(current_user)
  end
  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    redirect_to not_found_error_path
  end
end
