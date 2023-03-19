
class CategoriesController < ApplicationController

  def index
    @categories = Category.where(ancestry:nil)

    respond_to do |format|
      format.html
      format.json{
        render json: @categories
      }
    end 
  end

  def show

    @category = Category.find(params[:id])
    @categories = @category.children

    respond_to do |format|
      format.html
      format.json{
        render json: @categories
      }
    end 

  end

  def item_list
    @items = []
    Item.find_each do |item|
      parent_id = Category.find(item.category_id).ancestor_ids.first
      if @items.length >= 10
        break
      elsif parent_id == params[:id].to_i
        @items << item
      end
    end
  end

end