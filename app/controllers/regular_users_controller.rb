class RegularUsersController < ApplicationController
  
  def show
    @regular_user = RegularUser.find(regular_user_params[:id])
  end
  
  private
  
  def regular_user_params
    params.permit(:id)
  end
end

