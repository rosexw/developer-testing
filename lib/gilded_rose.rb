class GildedRose
  attr_reader :items

  def initialize(items)
    # *args means that if it's an array, it will pass off as an array. Then it works.
    @items = items
  end


  def age_one_day
    # one big method, no comments...
    # good object oriented programming = clean code, easy to read, understand the variables.

    # cleaning up the code:
    @items.each do |item|
      item.update_sell_in
      item.update_quality

      #deal with items that degrade in quality over time
      if (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")
          if (item.name != "Sulfuras, Hand of Ragnaros")
            # can put a throw error in here, but not going to do that.
            throw "OH NO!" unless item.class == RegularItem
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
            if (item.sell_in < 10)
              if (item.quality < 50)
                item.quality = item.quality + 1
              end
            end
            if (item.sell_in < 5)
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
