class AgedBrie < ItemDefauts
  def quality_for_sale
    self.increase_quality
  end
end
