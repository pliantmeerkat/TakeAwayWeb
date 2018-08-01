require './model/db_processor'
require 'spec_variables'
describe DbProcessor do
  let(:subject) { described_class.new('TakeAwayWeb_test') }
  context 'Reading methods' do
    describe '#read_from_db' do
      before(:each) { add_menu_to_test_db }
      it { expect(subject).to respond_to(:read_from_db) }
      it { expect(subject.read_from_db).to eq(menu_1) }
    end
    describe '#format_sql_query' do
      # it { expect(subject.send :format_sql_query).to eq(meu_1) }
    end
  end
  context 'Addition related methods' do
    describe '#add_to_db' do
      it { expect(subject).to respond_to(:add_to_db) }
      it 'added data is correctly entered into db' do
        subject.add_to_db(test_dishes)
        expect(subject.read_from_db).to eq(menu_1)
      end
    end
    describe '#connection' do
      it { expect(subject).to respond_to(:connector) }
    end
  end
  context 'Subtraction related methods' do
    it { expect(subject).to respond_to(:rm_from_db) }
  end
  context 'Update related methods' do

  end
  context 'Deletion methods' do

  end
end
