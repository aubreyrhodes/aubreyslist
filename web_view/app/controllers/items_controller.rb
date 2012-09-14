class ItemsController < ApplicationController
  @@checklist = Checklist.new %w{item1 item2 item3}

  def index
    @items = @@checklist.items
  end
end
