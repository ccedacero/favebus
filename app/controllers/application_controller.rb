class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_rider
  helper_method :logged_in?

  def current_rider
    Rider.find_by(id: session[:rider_id])
  end

  def logged_in?
    !current_rider.nil?
  end

  def authorized
    redirect_to "/welcome" unless logged_in?
  end
end
