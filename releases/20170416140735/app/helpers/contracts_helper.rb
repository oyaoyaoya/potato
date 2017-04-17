module ContractsHelper
  def user_name(contract)
    a = []
    a << contract.seller_id
    a << contract.purchaser_id
    a.delete(current_user.id)
    user = User.find(a[0])
    user.name
  end

  def complete_status(contract)
    if contract.status == "completed"
    #完了
      "disabled"
    elsif contract.status == "pre_completed" && contract.complete_id == current_user.id
    #半完了(自分押した)
      "disabled"
    elsif contract.status == "pre_completed"
      #半完了(相手押した)
    end
  end

end
