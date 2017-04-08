class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to root_path
    end
  end

  def message_params
    params.require(:message).permit(:body, :contract_id)
  end
end
