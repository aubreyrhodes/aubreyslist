class Checklist
  attr_reader :items, :checked_items

  def initialize(items, checked_items = [])
    @items = items
    @checked_items = checked_items
  end

  def add_item(item)
    Checklist.new([item] + @items, @checked_items)
  end

  def check_off_item(item)
    if @items.include?(item)
      Checklist.new(@items - [item], @checked_items << item)
    else
      self
    end
  end
end
