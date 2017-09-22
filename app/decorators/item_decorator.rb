module ItemDecorator
  def show_price
    if self.price == 9999
      "交渉"
    else
      "#{self.price}円"
    end
  end
end
