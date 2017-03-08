class Conjured < ItemDefauts
  def quality_for_sale
    self.decrease_quality(QualityAmount*2)
  end
end
