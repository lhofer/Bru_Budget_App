class CostsController < ApplicationController
  def index
  	@user = current_user
  	@costs = @user.costs
  end

  def new
  	@user = current_user
  	@cost = @user.costs.build
  end

  def create
  	@user = current_user

	@cost = @user.costs.create(cost_params)

	if @cost.save
		redirect_to root_path
	else
		render 'form'
	end
  end

  def edit
  	@cost = Cost.find(params[:id])
  	@user = User.find(params[:user_id])
  end

  def update
  	@user = current_user
  	@cost = @user.costs.find(params[:id])

	if @cost.update(cost_params)
		redirect_to root_path
	else
		render 'edit'
	end
  end

  def show
  	@user = current_user
  	@cost = @user.costs.find(params[:id])
  end

  def destroy
  	@user = current_user
  	@cost = @user.costs.find(params[:id])
  	@cost.destroy
  	redirect_to root_path
  end

  private 
  	def cost_params
  		params.require(:cost).permit(:item, :cost, :location)
  	end
end
