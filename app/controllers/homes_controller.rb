class HomesController < ApplicationController
  def top
  end
  
  def create
    list = List.new(list_params)
    list.save
    flash[:notice] = "Signed out successfully"
    redirect_to root_path
  end
end
