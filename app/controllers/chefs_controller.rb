class ChefsController < ApplicationController
  before_action :set_chef, only: %i[show edit update]

  def index
    @chefs = Chef.includes(:recipes).all
    fresh_when(@chefs)
  end

  def show
    fresh_when(@chef)
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash[:success] = 'Chef updated successfully'
      redirect_to @chef
    else
      logger.debug "Chef update errors #{@chef.errors.full_messages}"
      render 'edit'
    end
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = 'Chef created successfully'
      redirect_to @chef
    else
      logger.debug "Chef errors #{@chef.errors.full_messages}"
      render 'new'
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end
end
