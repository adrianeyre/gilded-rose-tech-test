class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.increase_quality_for_sale
      item.decrease_sell_in
      item.quality_amount if item.sell_in < 0
    end
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

class Other < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
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

  def increase_quality_for_sale
    self.decrease_quality
  end
end

class Sulfuras < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def increase_quality(amount=1)
    self.quality += amount if self.quality < 50
  end

  def decrease_quality(amount=1)
    self.quality -= amount if self.quality > 0
  end

  def decrease_sell_in(amount=1)

  end

  def quality_amount(amount=1)

  end

  def increase_quality_for_sale

  end
end

class AgedBrie < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def increase_quality(amount=1)
    self.quality += amount if self.quality < 50
  end

  def decrease_quality(amount=1)
    self.quality -= amount
  end

  def decrease_sell_in(amount=1)
    self.sell_in -= amount
  end

  def quality_amount(amount=1)
    self.increase_quality(amount)
  end

  def increase_quality_for_sale
    self.increase_quality
  end
end

class Backstage < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def increase_quality(amount=1)
    self.quality += amount if self.quality < 50
  end

  def decrease_quality(amount=1)
    self.quality -= amount
  end

  def decrease_sell_in(amount=1)
    self.sell_in -= amount
  end

  def quality_amount(amount=1)

  end

  def increase_quality_for_sale
    self.increase_quality
    self.increase_quality if self.sell_in < 11
    self.increase_quality if self.sell_in < 6
  end

end
