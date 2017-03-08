class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.decrease_quality
          end
        end
      else
        item.increase_quality
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 11
            item.increase_quality
          end
          if item.sell_in < 6
            item.increase_quality
          end
        end
      end

      item.decrease_sell_in

      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.decrease_quality
              end
            end
          else
            item.decrease_quality
          end
        else
          item.increase_quality
        end
      end
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
end
