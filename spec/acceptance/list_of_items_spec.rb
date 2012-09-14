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
end
