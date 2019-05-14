class ChefsController < ApplicationController
  before_action :set_chef, only: %i[show]

  def show
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = 'Chef created successfully'
      redirect_to chef_path(@chef)
    else
      logger.debug "Chef errors #{@chef.errors.full_messages}"
      render 'new'
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :email, :password, :password_confirmation)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end
end
