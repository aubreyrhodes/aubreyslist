class ItemsController < ApplicationController
  @@checklist = Checklist.new %w{item1 item2 item3}

  def index
    @items = @@checklist.items
    @checked_items = @@checklist.checked_items
  end

  def new
  end

  def create
    @@checklist = @@checklist.add_item(params[:item])
    redirect_to items_path
  end

  def check
    @@checklist = @@checklist.check_off_item(params[:item])
    redirect_to items_path
  end
end
