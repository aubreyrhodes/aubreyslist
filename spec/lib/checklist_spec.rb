require 'rspec'
require_relative '../../checklist'

describe Checklist do
  subject{ Checklist.new %w{ item1 item2 } }

  describe '#items' do
    it 'returns a list of all items' do
      subject.items =~ %w{ item1 item2 }
    end
  end
end
