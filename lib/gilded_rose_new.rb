class GildedRose

  Non_quantity_depreciation_items = ["Aged Brie","Backstage passes to a TAFKAL80ETC concert"]
  Items_to_increase = ["Backstage passes to a TAFKAL80ETC concert"]

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      p "ITEM #{item}"
      if non_quantity_depreciation(item)
        lower_item_qantity(item) if item.name != "Sulfuras, Hand of Ragnaros"
      else
        if item.quality < 50
          increase_item_quantity(item)
          increase_item_quantity(item) if items_to_increase(item)
        end
      end
      lower_sell_in(item) if item.name != "Sulfuras, Hand of Ragnaros"
      if item.sell_in < 0
        if item.name != "Aged Brie"
          lower_item_qantity(item) if item.name != "Sulfuras, Hand of Ragnaros"
        else
          increase_item_quantity(item) if item.quality < 50
        end
      end
    end

  end

  private

  def non_quantity_depreciation(item)
    !Non_quantity_depreciation_items.include? item.name
  end

  def lower_item_qantity(item, amount=1)
    item.quality =- amount if item.quality > 0
  end

  def lower_sell_in(item, amount=1)
    item.sell_in =- amount
  end

  def increase_item_quantity(item, amount=1)
    item.quality = item.quality + amount
  end

  def items_to_increase(item)
    Items_to_increase.include? item.name && item.sell_in < 11
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
