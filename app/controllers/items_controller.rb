class ItemsController < ApplicationController
  before_action :set_textbook, only: %w( new create index)
  before_action :set_item, only: %w( show )

  def index
   @items = Item.where(textbook_id: @textbook.id)
  end

  def new
    @item = Item.new
    @item.name = @textbook.name
    @item.course_id = @textbook.course_id
    @item.textbook_id = @textbook.id
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to textbook_items_path
    else
      render :new
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:price, :status).merge(course_id: @textbook.course_id, textbook_id: @textbook.id, name: @textbook.name, seller_id: current_user.id)
  end
  def set_textbook
    @textbook = Textbook.find(params[:textbook_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
