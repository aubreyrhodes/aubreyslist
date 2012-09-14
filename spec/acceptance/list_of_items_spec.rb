require 'rspec'
require_relative '../../checklist'

describe 'list of items' do
  let(:list){ Checklist.new ['item1', 'item2', 'item3'] }

  it 'allows me to view a list of items' do
    list.items.should =~ ['item1', 'item2', 'item3']
  end

  it 'allows me to add an item to the list' do
    new_list = list.add_item('item4')
    new_list.items =~ ['item1', 'item2', 'item3', 'item4']
  end

  it 'allows me to mark an item as completed' do
    new_list = list.check_off_item('item1')
    new_list.checked_items.should == ['item1']
  end

  it 'does not allow me to mark items not in the list as completed' do
    new_list = list.check_off_item('bad_item')
    new_list.checked_items.should_not include('bad_item')
  end

  it 'does not show completed items in items list' do
    new_list = list.check_off_item('item1')
    new_list.items.should_not include('item1')
  end
end
