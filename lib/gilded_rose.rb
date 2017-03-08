require_relative 'item'
require_relative 'item_defaults'
require_relative 'other.rb'
require_relative 'sulfuras'
require_relative 'aged_brie'
require_relative 'backstage'
require_relative 'conjured'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each {|item| item.calculate}
  end

end
