class Output

  def initialize(destination)
    @destination = destination
  end

	def write_account_number(single_account_number)
		open(@destination, "a") { |file| 
			file << single_account_number
			file << "\n"
		}
	end

  def write_total_account_numbers(total_count)
    open(@destination, "a") { |file| 
      file << "Total Account numbers = " + total_count.to_s
      file << "\n----------\n"
    }
  end
end