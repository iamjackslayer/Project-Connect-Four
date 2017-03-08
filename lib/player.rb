require_relative "./board"
class Player
	attr_accessor :board
	def initialize(board_arr,symbol_str)
		@board = board_arr
		@symbol_str = symbol_str
	end

	def drop(stdin = $stdin, stdout = $stdout)
		input =  stdin.gets.chomp.to_i
		(@board.length-1).downto(0) do |i|
			if @board[i][input-1] == " ☐ "
				@board[i][input-1] = @symbol_str
		
				break
			elsif i == 0
				stdout.puts "Column is full. Please choose another column."
				drop
			end

		end
	end
end
