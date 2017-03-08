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
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def calculate
    self.quality_for_sale
    self.decrease_sell_in
    self.quality_amount if self.sell_in < 0
  end

  def increase_quality(amount=1)
    self.quality += amount if self.quality < 50
  end

  def decrease_quality(amount=1)
    self.quality -= amount if self.quality > 0
  end

  def decrease_sell_in(amount=1)
    self.sell_in -= amount
  end

  def quality_amount(amount=1)
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
  def decrease_sell_in(amount=1); end
  def quality_amount(amount=1); end
end

class AgedBrie < ItemDefauts
  def quality_for_sale
    self.increase_quality
  end
end

class Backstage < ItemDefauts
  def quality_amount(amount=1); end

  def quality_for_sale
    self.increase_quality
    self.increase_quality if self.sell_in < 11
    self.increase_quality if self.sell_in < 6
  end
end

class Conjured < ItemDefauts
  def quality_for_sale
    self.decrease_quality(2)
  end
end
