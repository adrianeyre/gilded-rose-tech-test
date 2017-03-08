class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each {|item| item.calculate}
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

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

class Other < ItemDefauts
  def quality_for_sale
    self.decrease_quality
  end
end

class Sulfuras < ItemDefauts
  def decrease_sell_in(amount=DecreaseSellInDefault); end
  def quality_amount(amount=QualityAmount); end
end

class AgedBrie < ItemDefauts
  def quality_for_sale
    self.increase_quality
  end
end

class Backstage < ItemDefauts
  def quality_amount(amount=QualityAmount); end

  def quality_for_sale
    self.increase_quality
    self.increase_quality if self.sell_in < SellInMax1
    self.increase_quality if self.sell_in < SellInMax2
  end
end

class Conjured < ItemDefauts
  def quality_for_sale
    self.decrease_quality(QualityAmount*2)
  end
end
