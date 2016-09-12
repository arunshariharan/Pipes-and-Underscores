require 'json'

class MatchPipesToNumber

	def initialize(raw_data)
		@data = JSON.parse(raw_data)
	end

	def find_num(single_account_number)
		case single_account_number
		when @data["ONE"]
			return  "1"
		when @data["TWO"]
			return  "2"
		when @data["THREE"]
			return  "3"
		when @data["FOUR"]
			return  "4"
		when @data["FIVE"]
			return  "5"
		when @data["SIX"]
			return  "6"
		when @data["SEVEN"]
			return  "7"
		when @data["EIGHT"]
			return  "8"
		when @data["NINE"]
			return  "9"
		when @data["NINE_WITH_NEWLINE"]
			return  "9"
		when @data["ZERO"]
			return  "0"
		else
			return  "?"
		end
	end
end