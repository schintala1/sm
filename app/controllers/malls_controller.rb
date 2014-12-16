class MallsController < ApplicationController
 before_filter :authenticate_user!
  
  def new
  end

  def index
    @malls = Mall.all
  end

  def create
    @mall = Mall.create(mall_params)
    redirect_to malls_path
  end
  

  def update
    @mall = Mall.find params[:id]
    @mall.update_attributes!(mall_params)
    redirect_to mall_path(@mall)
  end

  def edit
    @mall = Mall.find params[:id]
  end
  def show
    id = params[:id]
    @mall = Mall.find(id)
  end
  private
  def mall_params
      params.require(:mall).permit(:name, :location, :phone)
  end
end
