class ChefsController < ApplicationController
  before_action :set_chef, only: %i[show edit update destroy]
  before_action :require_authenticated_user, except: %i[index show new create]
  before_action :validate_same_chef, only: %i[edit update destroy]

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 4).includes(:recipes)
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

  def destroy
    old = @chef.destroy
    flash[:success] = "#{old.name} was deleted!"
    redirect_to chefs_path
  end

  private

  def validate_same_chef
    logger.debug "Is current chef an admin? #{current_chef.admin?}"
    return unless @chef != current_chef && !current_chef&.admin?

    flash[:danger] = 'You arent this Chef'
    redirect_to recipes_path
  end

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
