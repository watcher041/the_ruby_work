
class ItemsController < ApplicationController

  before_action :find_item, except: [:index,:new,:create]
  impressionist actions: [:show]

  def index
  end
  
  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)
    brand = Brand.find_or_create_by(name:params[:item][:brand])
    @item.brand_id = brand&.id

    if @item.save && @item.images.length < 10 
      redirect_to root_path
    else
      redirect_to new_item_path
    end

  end

  def edit
  end

  def update
    if @item.update(item_params) && @item.images.length < 10 
      redirect_to root_path
    else
      redirect_to edit_item_path(params[:id])
    end
  end

  def show
  end
  
  private
  
  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item)
          .permit(:id, 
                  :name, 
                  :detail, 
                  :price, 
                  :status, 
                  :pay_side,
                  :category_id, 
                  :prefecture_id, 
                  images_attributes: [:id, :data, :item_id, :_destroy])
          .merge(user_id: current_user.id)
  end

end
