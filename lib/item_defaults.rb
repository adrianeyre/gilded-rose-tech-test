class ItemDefauts < Item
  QualityMax = 50
  QualityMin = 0
  SellInMin = 0
  SellInMax1 = 11
  SellInMax2 = 6
  IncreaseQualityDefault = 1
  DecreaseQualityDefault = 1
  DecreaseSellInDefault = 1
  QualityAmount = 1

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def calculate
    self.quality_for_sale
    self.decrease_sell_in
    self.quality_amount if self.sell_in < SellInMin
  end

  def increase_quality(amount=IncreaseQualityDefault)
    self.quality += amount if self.quality < QualityMax
  end

  def decrease_quality(amount=DecreaseQualityDefault)
    self.quality -= amount if self.quality > QualityMin
  end

  def decrease_sell_in(amount=DecreaseSellInDefault)
    self.sell_in -= amount
  end

  def quality_amount(amount=QualityAmount)
    self.decrease_quality(amount)
  end

  def quality_for_sale; end
end
