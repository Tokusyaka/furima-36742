class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @item = Item.all
    query = 'SELECT * FROM items'
    @items = Item.find_by_sql(query)
    @items = Item.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :explanation, :category_id, :status_id, :postage_id, :prefecture_id,
                                 :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
