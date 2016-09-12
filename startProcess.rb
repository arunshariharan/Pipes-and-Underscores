require_relative "Account/AccountNumbers"
require_relative "Parser/FileParser"
require_relative "Writer/Output"

source = File.open(File.expand_path("Source/data.txt"), "r")
destination = File.new(File.expand_path("Output/Parsed_Account_Numbers.txt"), "a")
database = File.read(File.expand_path("Database/NumberData.json"))

matcher = MatchPipesToNumber.new(database)

account_number = AccountNumbers.new(source, destination)
unprocessed_file = account_number.read_file

output = Output.new(destination)
output.write_total_account_numbers(account_number.total_account_numbers)

parser = FileParser.new(unprocessed_file, account_number, destination, matcher)
starting_line_number_to_parse = 0
parser.parse_file(starting_line_number_to_parse)

