class ItemsController < ApplicationController
  @@checklists ||= {}

  def index
    @@checklists[current_email] ||= Checklist.new([])
    checklist = @@checklists[current_email]
    @items = checklist.items
    @checked_items = checklist.checked_items
  end

  def new
  end

  def create
    @@checklist[current_email] = @@checklist[current_email].add_item(params[:item])
    redirect_to items_path
  end

  def check
    @@checklist[current_email] = @@checklist[current_email].check_off_item(params[:item])
    redirect_to items_path
  end
end
