class Backstage < ItemDefauts
  def quality_amount(amount=QualityAmount); end

  def quality_for_sale
    self.increase_quality
    self.increase_quality if self.sell_in < SellInMax1
    self.increase_quality if self.sell_in < SellInMax2
  end
end
