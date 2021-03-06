class ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i(show create update)
  before_action :create_check_item, only: %i( create )
  before_action :create_check_user, only: %i( create )
  before_action :check_contract, only: %i(show update)
  before_action :set_contract, only: %i( show update)
  before_action :check_user, only: %i(show update)

  def create
    contract = Contract.new(contract_params)
    if contract.save
      # NotificationMailer.contract_notification_mail(contract).deliver
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
    @messages = @contract.messages.includes(:from_user)
  end

  def update
    if @contract.status == "uncompleted"
      @contract.update(status: "pre_completed", complete_id: current_user.id)
      redirect_to contract_path(@contract.item.id)
    elsif @contract.status == "pre_completed"
      @contract.update(status: "completed" )
      redirect_to contract_path(@contract.item.id)
    else
      redirect_to root_path
    end
  end

  private

  def contract_params
    params.permit().merge(purchaser_id: current_user.id, seller_id: @item.seller_id, item_id: @item.id)
  end

  def check_contract
    if Contract.find_by(item_id: params[:id]) == nil
      redirect_to item_path(params[:id]), alert: "契約がまだ成立していません。"
    end
  end

  def set_item
    @item = Item.find_by_id(params[:id])
    if @item == nil
      redirect_to item_path(params[:id]), alert: "クソです。"
    end
  end

  def set_contract
    @contract = Contract.find_by(item_id: params[:id])
  end

  def create_check_user
    # 購入者 != 出品者
    # 購入者 != 非ログインユーザー
    if current_user.id == @item.seller_id
      redirect_to item_path(params[:id]), "ユーザーが不当です。"
    end
  end

  def check_user
    # アクセスユーザー == 購入者 or 売却者
    # アクセスユーザー != 非ログインユーザー
    unless current_user.id == @contract.purchaser_id || current_user.id == @contract.seller_id
      redirect_to root_path, alert: "不当なユーザーです"
    end
  end

  def create_check_item
    if @item.published == false
      redirect_to item_path(@item.id), alert: "公開されていないアイテムです"
    end
  end
end
