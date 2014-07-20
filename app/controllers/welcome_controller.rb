class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def hayawakari
    respond_to do |format|
      format.html { render :layout => false }
    end
  end
end
