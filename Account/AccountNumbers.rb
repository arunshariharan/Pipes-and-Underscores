
class AccountNumbers

  attr_accessor :file, :total_account_numbers, :source, :destination

  def initialize(source, destination)
    @source = source
    @destination = destination
    @count = File.foreach(@source).count
    @total_account_numbers = @count/4
  end

  def read_file
    @file = IO.readlines(source)
  end

end