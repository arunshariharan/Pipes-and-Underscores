require_relative "../Matcher/MatchPipesToNumber"
require_relative "../Writer/Output"

class FileParser

	def initialize(unprocessed_file, account_number, destination, matcher)
    @total_char = 0
    @single_account_number = ""
    @number_array = []
    @account_number = account_number
    @unprocessed_file = unprocessed_file
    @output = Output.new(destination)
    @matcher = matcher
	end

  def parse_file(line_no)
    @account_number.total_account_numbers.times do |acc_num|
      9.times do |each_number|
        @number_array << @unprocessed_file[line_no][@total_char..@total_char+2]
        @number_array << @unprocessed_file[line_no+1][@total_char..@total_char+2]
        @number_array << @unprocessed_file[line_no+2][@total_char..@total_char+2]
        @single_account_number += @matcher.find_num(@number_array)
        @total_char += 3      
        reset_array
      end
      @output.write_account_number(@single_account_number)
      line_no += 4    
      reset_values
    end
  end

  private

  def reset_array
    @number_array = []
  end

  def reset_values
    @single_account_number = ""
    @total_char = 0
  end
end