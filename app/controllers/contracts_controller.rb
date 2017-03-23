class ContractsController < ApplicationController
  before_action :check_contract, only: %i(show update)
  before_action :set_item, only: %i(show create update)
  before_action :set_contract, only: %i( show update)
  before_action :check_user, only: %i(show update)
  before_action :create_check_user, only: %i( create )

  def create
    contract = Contract.new(contract_params)
    if contract.save
      @item.purchased = true
      @item.save
      redirect_to contract_path
    else
      render item_path(@item)
    end
  end

  def show
    @message = Message.new
    @message.contract_id = @contract.id
    @messages = Message.where(contract_id: @contract.id)
  end

  def update
    if @contract.status == "uncompleted"
      @contract.update(status: "pre_completed", complete_id: current_user.id)
      redirect_to contract_path(@contract.id)
    elsif @contract.status == "pre_completed"
      @contract.update(status: "completed" )
      redirect_to contract_path(@contract.id)
    else
      redirect_to root_path
    end
  end

  private

  def check_contract
    if Contract.find_by(item_id: params[:id]) == nil
      redirect_to item_path(params[:id]), alert: "契約がまだ成立していません。"
    end
  end

  def contract_params
    params.permit(:id).merge(purchaser_id: current_user.id, seller_id: @item.seller_id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def create_check_user
    # 購入者 != 出品者
    # 購入者 != 非ログインユーザー
    if current_user.id == @item.seller_id
      redirect_to item_path(params[:id])
    end
  end

  def check_user
    # アクセスユーザー == 購入者 or 売却者
    # アクセスユーザー != 非ログインユーザー
    unless current_user.id == @contract.purchaser_id || current_user.id == @contract.seller_id
      redirect_to root_path, alert: "不当なユーザーです"
    end
  end
end
