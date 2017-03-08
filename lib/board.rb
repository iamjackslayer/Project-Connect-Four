
class Board
	attr_accessor :board_arr
	def initialize
		@board_arr = [
						[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
					  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
					  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
					  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
					  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
				  	  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
					]
	end

	def show
		print " ========================================\n\n"
		@board_arr.each do |row|
			print " "
			row.each do |item|
				print " #{item} "
			end
			print "\n\n"
		end
		print " ========================================\n\n"
	end

end

# Board.new.show