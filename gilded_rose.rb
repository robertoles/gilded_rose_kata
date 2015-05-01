def update_quality(items)
  items.each do |i|
    tickets = i.name == 'Backstage passes to a TAFKAL80ETC concert'
    sulfuras = i.name == 'Sulfuras, Hand of Ragnaros'

    i.sell_in -= 1 unless sulfuras

    if i.name == 'Aged Brie'
      i.quality += i.sell_in < 1 ? 2 : 1
    elsif tickets and i.sell_in >= 0
      i.quality += 1
      i.quality += 1 if i.sell_in < 10
      i.quality += 1 if i.sell_in < 5
    elsif tickets and i.sell_in < 0
      i.quality = 0 
    elsif !sulfuras
      reduction = i.sell_in < 0 ? 2 : 1
      reduction *= 2 if i.name.match('Conjured')
      i.quality -= reduction
    end
    
    if !sulfuras
      i.quality = 0 if i.quality < 0
      i.quality = 50 if i.quality > 50
    end
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

