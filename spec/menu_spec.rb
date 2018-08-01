require './model/menu'
require 'spec_variables'
describe Menu do
  let(:db_processor) { double :db_processor              }
  let(:subject)      { described_class.new(db_processor) }
  before(:each)      { add_menu_to_test_db               }
  context 'Feature 1 Menu contains dishes and prices' do
    before(:each) { allow(db_processor).to receive(:read_from_db).and_return(menu_1) }
    describe '#menu' do
      it { expect(subject).to respond_to(:menu) }
      it { expect(subject.menu).to eq(menu_1) }
    end
    describe '#create_menu' do
      it { expect(subject).to respond_to(:create_menu) }
      it { expect(subject.create_menu).to eq(menu_1) }
    end
  end
end
