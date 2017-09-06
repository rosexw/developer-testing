class GildedRose
  attr_reader :items

  def initialize item_attributes
    # *args means that if it's an array, it will pass off as an array. Then it works.
    @items = item_attributes.map { |args| Item.new(*args) }
  end

  def update_quality
    # one big method, no comments...
    # good object oriented programming = clean code, easy to read, understand the variables.

    # cleaning up the code:
    @items.each do |item|
      if (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")
        if (item.quality > 0)
          if (item.name != "Sulfuras, Hand of Ragnaros")
            item.quality = item.quality - 1
          end
        end
      else
        # increasing quantity by 2 in certain cases
        # iterate through the items
        # fix semicolons, setting to zero
        # how do we deal with new backstage passes, legendary, etc? no...it structures, not implements
        if (item.quality < 50)
          item.quality = item.quality + 1
          if (item.name == "Backstage passes to a TAFKAL80ETC concert")
            if (item.sell_in < 11)
              if (item.quality < 50)
                item.quality = item.quality + 1
              end
            end
            if (item.sell_in < 6)
              if (item.quality < 50)
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if (item.name != "Sulfuras, Hand of Ragnaros")
        item.sell_in = item.sell_in - 1;
        # should be updating quality, not sell_in...
      end
      if (item.sell_in < 0)
        if (item.name != "Aged Brie")
          if (item.name != "Backstage passes to a TAFKAL80ETC concert")
            if (item.quality > 0)
              if (item.name != "Sulfuras, Hand of Ragnaros")
                item.quality = item.quality - 1
              end
            end
          else
            #setting quality to zero in a bad way
            item.quality = item.quality - item.quality
          end
        else
          if (item.quality < 50)
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

end
