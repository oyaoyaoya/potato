class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      # NotificationMailer.message_notification_mail(@message, @contract).deliver
      respond_to do |format|
        format.json
      end
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :contract_id)
  end

  def set_contract
    @contract = Contract.find(params[:message][:contract_id])
  end
end
