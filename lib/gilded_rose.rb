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
      #WTF? why are we updating sell in here? #update_quality
      if (item.name != "Sulfuras, Hand of Ragnaros")
        item.sell_in = item.sell_in - 1;
      end

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
        # a lot of negative testing here...switch to positive testing (flip the if/else), don't use the keyword "unless"

        # deal with items that don't degrade (and may improve) over time
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
      #sell_in update was here
      # items degrade faster or altogether after sell_in reaches 0
      if (item.sell_in < 0)
        if (item.name != "Aged Brie")
          if (item.name != "Backstage passes to a TAFKAL80ETC concert")
            if (item.quality > 0)
              if (item.name != "Sulfuras, Hand of Ragnaros")
                item.quality = item.quality - 1
              end
            end
          else
            # instead of subtracting item.quality from item.quality, set it to 0.
            item.quality = 0
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
