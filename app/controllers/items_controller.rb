class ItemsController < ApplicationController
  before_action :set_textbook, only: %w( new create)
  before_action :set_item, only: %w( show edit update)
  before_action :authenticate_user!, except: %w( show new )

  def new
    @item = Item.new
    @item.item_type = params[:item_type].to_i
    @item.name = @textbook.name
    if @item.item_type == "item_order"
      render "for_want"
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      if params[:item][:item_type] == "item_order"
        item_type_param = 1
      else
        item_type_param = 0
      end
      redirect_to new_textbook_item_path(@item.textbook_id, @item, item_type: item_type_param), alert: "フォームを全て埋めてください"
    end
  end

  def show
    if @item.item_type == "sell"
      @item_type = ["btn", "購入"]
    else
      @item_type = ["amber grey-text", "お譲り"]
    end
    @comments = @item.item_comments
    @comment = ItemComment.new
  end

  def edit
  end

  def update
    if @item.update(update_params)
      flash[:notice] = "更新完了しました"
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:price, :status, :item_type, :delivery, :description).merge(course_id: @textbook.course_id, textbook_id: @textbook.id, name: @textbook.name, seller_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:price, :status, :published, :delivery, :description)
  end

  def set_textbook
    @textbook = Textbook.find(params[:textbook_id])
  end

  def set_item
    @item = Item.unscoped.all.find_by_id(params[:id])
    if @item == nil
      redirect_to root_path, alert: "アイテムが存在しません。"
    end
  end

end
