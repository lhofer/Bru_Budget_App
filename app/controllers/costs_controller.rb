class CostsController < ApplicationController
  def index
  	@costs = current_user.costs
  end

  def new
  	@cost = current_user.costs.build
  end

  def create
	  @cost = current_user.costs.create(cost_params)

  	if @cost.save
  		redirect_to root_path
  	else
  		render 'form'
  	end
  end

  def edit
  	@cost = Cost.find(params[:id])
  end

  def update
  	@cost = current_user.costs.find(params[:id])

	if @cost.update(cost_params)
		redirect_to root_path
	else
		render 'edit'
	end
  end

  def show
  	@cost = current_user.costs.find(params[:id])
  end

  def destroy
  	@cost = current_user.costs.find(params[:id])
  	@cost.destroy
  	redirect_to root_path
  end

  private 
  	def cost_params
  		params.require(:cost).permit(:item, :cost, :location)
  	end
end
