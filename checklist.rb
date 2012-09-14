class Checklist
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def add_item(item)
    Checklist.new(@items << item)
  end
end
