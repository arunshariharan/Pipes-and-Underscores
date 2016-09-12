require_relative '../../Account/AccountNumbers'

describe 'AccountNumbers' do
  let(:source) { File.open(File.expand_path("../../Source/data.txt"), "r") }
  let(:destination) { File.new(File.expand_path("../../Output/Test_Output.txt"), "a") }
  let!(:account) { AccountNumbers.new(source, destination) }

  context '#initialize' do
    it ' initializes required data' do
      expect(account.total_account_numbers).to_not be nil
      expect(account.destination).to_not be nil
      expect(account.source).to_not be nil
    end

    it 'does not load source into memory' do
      expect(account.file).to be_nil
    end
  end

  context '#read_file' do
    subject { account.read_file }

    it 'loads the source into memory' do
      subject
      expect(account.file).to_not be nil
    end
  end
end