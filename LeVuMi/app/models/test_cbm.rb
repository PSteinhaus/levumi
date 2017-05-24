class TestCBM < TestSpeed

  def draw_items(ability)
    pools = items.map{|i| i.difficulty}.uniq
    itemset = Array.new
    (1..len).each  do
      remaining = items - itemset
      i = remaining.sample
      if (itemset.size > 0)
        count = 0
        while (count < 500) & ((i.itemtext.first.downcase == itemset.last.itemtext.first.downcase) |
                               (i.itemtext.first + itemset.last.itemtext.first == 'bd') |
                               (i.itemtext.first + itemset.last.itemtext.first == 'db') |
                               ((pools.size > 1) & (i.difficulty == itemset.last.difficulty)))
          i = remaining.sample
          count = count + 1
        end
      end
      itemset = itemset + [i]
    end
    return itemset.map{|i| i.id}
  end

end
