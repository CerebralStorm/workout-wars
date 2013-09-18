class StaticController < ApplicationController
  skip_before_filter :authenticate_user!, only:[:index]
  
  def index
    redirect_to current_user if user_signed_in?
  end
end
