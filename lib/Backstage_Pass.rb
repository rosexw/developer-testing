require_relative 'item'
class BackstagePass < Item
  def update_sell_in
    @sell_in -= 1
  end
  def update_quality
  end
end
