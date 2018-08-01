require './model/menu'
require 'spec_variables'
describe Menu do
  let(:subject) { described_class.new('menu_1') }
  let(:connection) { PG.connect(dbname: 'TakeAwayWeb_test') }
  context 'Feature 1 Menu contains dishes and prices' do
    describe '#menu' do
      it { expect(subject).to respond_to(:menu) }
      it { expect(subject.menu).to be_an(Array) }
      it { expect(subject.menu).to eq(menu_1) }
    end
    describe '#create_menu' do
      it { expect(subject).to respond_to(:create_menu) }
    end
    describe '#format_menu' do
      it { expect(subject).to respond_to(:format_menu).with(1).arguments }
    end
  end
end
