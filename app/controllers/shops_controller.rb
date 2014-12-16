class ShopsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @mall = Mall.find(params[:mall_id])
    @shop = @mall.shops.build
  end
  
  def show
    
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def index
    @mall = Mall.find(params[:mall_id])
    @shops = Shop.where(mall_id: params[:mall_id])
  end
  
  def update
    @shop = Shop.find params[:id]
    @shop.update_attributes!(shop_params)
    mall = @shop.mall
    redirect_to mall_shops_path(mall)
  end

  def create
     @mall = Mall.find(params[:mall_id])
     @shop = @mall.shops.create(shop_params)
     redirect_to mall_shops_path
  end
  private 
  def shop_params
    params.require(:shop).permit(:name, :floor, :category)
  end
end
