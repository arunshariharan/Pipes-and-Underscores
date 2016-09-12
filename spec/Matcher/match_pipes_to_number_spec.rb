require_relative "../../Matcher/MatchPipesToNumber"
require 'json'

describe 'MatchPipesToNumber' do 
  let(:raw_data) { File.read(File.expand_path("../../Database/NumberData.json")) }
  let(:matcher) { MatchPipesToNumber.new(raw_data) }  
  
  context '#find_num' do
    let(:one) { ["   ", "  |", "  |"] }
    let(:two) { [" _ ", " _|", "|_ "] }
    let(:three) { [" _ ", " _|", " _|"] }
    let(:four) { ["   ", "|_|", "  |"] }
    let(:five)  { [" _ ", "|_ ", " _|"] }
    let(:six) { [" _ ", "|_ ", "|_|"] }
    let(:seven) { [" _ ", "  |", "  |"] }
    let(:eight) { [" _ ", "|_|", "|_|"] }
    let(:nine) { [" _ ", "|_|", " _|"] }
    let(:nine_with_newline) { [" _\n", "|_|", " _|"] }
    let(:zero) { [" _ ", "| |", "|_|"] }
    let(:unknown) { ["_|_ ", "| |", "|_|"] }

    let(:account_number_hash) do
    {
      one => "1", 
      two => '2', 
      three => '3', 
      four => '4', 
      five => '5', 
      six => '6', 
      seven => '7', 
      eight => '8', 
      nine => '9', 
      nine_with_newline => '9', 
      zero => '0',
      unknown => '?'
    } 
    end

    context 'returns question mark' do
      it 'for unknown value' do
        expect(matcher.find_num(unknown)).to eql '?'
      end

      it 'for unreadble values' do
        expect(matcher.find_num('_)IPI4deas')).to eql '?'
      end
    end
    

    it 'returns correct number for each identified value from database' do
      account_number_hash.each do |key, value|
        expect(matcher.find_num(key)).to eql value
      end
    end
  end
end