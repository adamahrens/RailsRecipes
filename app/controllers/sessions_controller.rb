class SessionsController < ApplicationController
  def new
  end

  def create
    @chef = Chef.find_by(email: params[:session][:email])
    if @chef&.authenticate(params[:session][:password])
      session[:chef_id] = @chef.id
      flash[:success] = 'Successfully logged in'
      redirect_to @chef
    else
      flash.now[:danger] = 'Check your email & password'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'Logged out'
    redirect_to root_path
  end
end
