class GildedRose
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_quality
    if item.name == "NORMAL ITEM"
      return update_quality_normal
    elsif item.name == "Aged Brie"
      return update_quality_aged_brie
    elsif item.name == 'Sulfuras, Hand of Ragnaros'
      return update_quality_sulfuras
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      return update_quality_backstage
    end
  end

  def update_quality_normal
    item.sell_in -= 1
    return if item.quality == 0

    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
  end

  def update_quality_aged_brie
    item.sell_in -= 1
    return if item.quality >= 50

    item.quality += 1
    item.quality += 1 if item.sell_in <= 0 && item.quality < 50
  end

  def update_quality_sulfuras

  end

  def update_quality_backstage
    item.sell_in -= 1
    return if item.quality == 50
    return item.quality = 0 if item.sell_in < 0 

    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
  end
end

def update_quality(items)
  items.each do |item|
    GildedRose.new(item).update_quality  
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

