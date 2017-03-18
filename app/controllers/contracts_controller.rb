class ContractsController < ApplicationController
  before_action :set_item, only: %w( create update)
  before_action :set_contract, only: %w( show update)
  def create
    contract = Contract.new(contract_params)
    if contract.save
      @item.contract = true
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
    binding.pry
    # @contract.status = "completed"
  end

  private
  def contract_params
    params.permit(:id).merge(purchaser_id: current_user.id, seller_id: @item.seller_id, item_id: @item.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def set_contract
    @contract = Contract.find(params[:id])
  end
end
