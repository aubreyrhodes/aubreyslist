require 'rspec'

describe 'list of items' do
  it 'allows me to view a list of items' do
    list = Checklist.new ['item1', 'item2', 'item3']
    list.items.should =~ ['item1', 'item2', 'item3']
  end
end
