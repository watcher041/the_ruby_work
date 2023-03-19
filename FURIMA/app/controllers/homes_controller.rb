
class HomesController < ApplicationController

  def index
    @items = Item.order(impressions_count: 'DESC').limit(10)
  end

end
