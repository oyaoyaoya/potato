class NotificationMailer < ApplicationMailer
  default from: ENV['POTATO_G_MAIL_ADDRESS']

   def contract_notification_mail(contract)
     @contract = contract
     @user = @contract.seller
     mail(to: @user.email,
          subject: "商品が購入されました。")
   end

   def message_notification_mail(message, contract)
     @message = message.body
     @from_user = message.from_user
     @contract = contract
     if @from_user.id == contract.seller_id
       @to_user = contract.purchaser
     else
       @to_user = contract.seller
     end
     mail(to: @to_user.email,
          subject: "Potato|取引メッセージが届いています。")
   end
end
