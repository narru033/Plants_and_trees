class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if params[:user][:photo].present?
        params[:user][:photo].each do |picture|
          @user.attachments.create(:photo=> picture)
        end
      end
      redirect_to home_index_path, notice: 'Contributor was successfully created.'
    else
      redirect_to root_path, alert: 'Your are somthing went wrong!. Please fill the mandotary(*) fields.'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :address, :city, :state, :zip_code, :country)
    end

end
