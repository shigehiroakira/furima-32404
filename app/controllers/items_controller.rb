class ItemsController < ApplicationController


    def index
      @item = Item.order("created_at DESC")
  end
  def new
  @item =Item.new
  end

  def create
    @article = Item.new(item_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:description,:category_id,:status_id,:shipping_cost_id,:shipping_day_id,:prefecture_id)
  end

end