class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def create
    @rider = Rider.find_by(username: params[:username])
   if @rider && @rider.authenticate(params[:password])
      sessions[:rider_id] = @rider.id
      redirect_to '/welcome'
   else
      redirect_to '/login'
   end
  end

 
  def welcome
  end

  def page_requires_login
  end

end
