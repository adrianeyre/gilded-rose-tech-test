require_relative '../lib/gilded_rose'

describe GildedRose do
  before(:each) do
    @items = [Item.new("foo", 0, 0),
              Item.new("bar", 10, 10),
              Item.new("Aged Brie", 10, 10)]
    GildedRose.new(@items).update_quality()
  end

  describe "#update_quality" do
    it "does not change the name" do
      expect(@items[0].name).to eq "foo"
    end

    it "sell_in minus 1" do
      expect(@items[0].sell_in).to eq -1
    end

    it "quantity stays the same if quantity equals 0" do
      expect(@items[0].quality).to eq 0
    end

    it "quantity minus 1 if quantity is greater than 0" do
      expect(@items[1].quality).to eq 9
    end

    it "quantity minus 1 if quantity is greater than 0" do
      expect(@items[2].sell_in).to eq 9
    end
  end


end
