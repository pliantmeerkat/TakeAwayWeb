require './model/order'
describe Order do
  let(:subject) { described_class.new }
  let(:item1)    { { name: :Durain, price: 1200 } }
  let(:item2)    { { name: :Escargot, price: 1500 } }
  context 'Feature 1: has list of items' do
    describe '#item_list' do
      it { expect(subject).to respond_to(:item_list) }
      it { expect(subject.item_list).to be_an(Array) }
      it { expect(subject.item_list.length).to eq(0) }
    end
  end
  context 'Feature 2: Adding and removing items' do
    before(:each) { subject.add_item_to_list(item1) }
    describe '#add_item_to_list' do
      it { expect(subject).to respond_to(:add_item_to_list) }
      it 'can add an item to the list' do
        subject.add_item_to_list(item2)
        expect(subject.item_list.last).to eq(item2)
      end
    end
    describe '#rm_item_from_list' do
      before(:each) { subject.rm_item_from_list(item1) }
      it { expect(subject).to respond_to(:rm_item_from_list) }
      it { expect(subject.item_list.last).to eq(nil) }
      it { expect { subject.rm_item_from_list(item1) }.to raise_error('Not in list') }
      it 'raises error when item not in list is removed' do
        subject.add_item_to_list(item1)
        expect { subject.rm_item_from_list(item2) }.to raise_error('Not in list')
      end
    end
  end
  context 'Feature 3: running total' do
    describe '#total_charge' do
      it { expect(subject).to respond_to(:total_charge) }
      it { expect(subject.total_charge).to eq(0) }
    end
    describe 'Adding/ Subtracting from total' do
      before(:each) { 2.times { |_| subject.add_item_to_list(item1) } }
      it { expect(subject.total_charge).to eq(2400) }
      it 'amends total when item is removed' do
        subject.rm_item_from_list(item1)
        expect(subject.total_charge).to eq(1200)
      end
    end
  end
  context 'Feature 4: class methods' do
    describe '#.create' do
      it { expect(Order).to respond_to(:create) }
      it { expect(Order.create).to be_an(Order) }
    end
    describe '#.instance' do
      it { expect(Order).to respond_to(:instance) }
    end
  end
end
