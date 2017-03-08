require_relative './board'
require_relative './player'

class Game
	attr_accessor :board, :game_over
	def initialize
		@player1_sym = " ⚽ "|| " 1 " || " ⚽ "
		@player2_sym = " ⚾ "||" 2 " || " ⚾ "
		@board = Board.new
		@player1 = Player.new(@board.board_arr,@player1_sym)
		@player2 = Player.new(@board.board_arr, @player2_sym)
		@game_over = false
	end
	def run
		puts "Welcome to connect FOUR. "
		@board.show
		while true
			puts "Player 1 please: "
			@player1.drop
			@board.show
			check_victory
			puts "Player 2 please: "
			@player2.drop
			@board.show
			check_victory
		end
	end
	def check_victory
		make_container
		# check diagonal grps for 4 consecutive symbols
		for i in 1..12
			for j in 0..2
				if @container["grp#{i}"][j..j+3].all? { |e|e == @player1_sym} || @container["grp#{i}"][j..j+3].all? { |e|e == @player2_sym }
					@game_over = true
					puts "game over bye bye"
					exit
				end
			end
		end
		# check vertical grps for 4 consecutive symbols
		for i in 13..19
			for j in 0..2
				if @container["grp#{i}"][j..j+3].all? { |e|e == @player1_sym } || @container["grp#{i}"][j..j+3].all? { |e|e == @player2_sym }
					@game_over = true
					puts "game over bye bye"
					# exit
				end
			end
		end
		# check horizontal grps for 4 consecutive symbols
		for i in 20..25
			for j in 0..2
				if @container["grp#{i}"][j..j+3].all? { |e|e == @player1_sym } || @container["grp#{i}"][j..j+3].all? { |e|e == @player2_sym }
					@game_over = true
					puts "game over bye bye"
					exit
				end
			end
		end
		# check for draw
		for i in 0..25
			if @container["grp#{i}"].all? {|item| item != " ☐ "} 
				if i == 25
					@game_over = true
					puts "It's a draw."
					exit
				end
				next
			end
			break
		end
	end

	def make_container
		@container = {}
		for i in 0..25
			@container["grp#{i}"] = []
		end
		# grp1-grp12 are diagonal grp
		5.downto(0) do |i|
			@container["grp1"] << @board.board_arr[i][5-i]
		end
		5.downto(0) do |i|
			@container["grp2"] << @board.board_arr[i][6-i]
		end
		5.downto(1) do |i|
			@container["grp3"] << @board.board_arr[i][7-i]
		end
		5.downto(2) do |i|
			@container["grp4"] << @board.board_arr[i][8-i]
		end
		4.downto(0) do |i|
			@container["grp5"] << @board.board_arr[i][4-i]
		end
		3.downto(0) do |i|
			@container["grp6"] << @board.board_arr[i][3-i]
		end

		5.downto(2) do |i|
			@container["grp7"] << @board.board_arr[i][i-2]
		end
		5.downto(1) do |i|
			@container["grp8"] << @board.board_arr[i][i-1]
		end
		5.downto(0) do |i|
			@container["grp9"] << @board.board_arr[i][i]
		end
		5.downto(0) do |i|
			@container["grp10"] << @board.board_arr[i][i+1]
		end
		4.downto(0) do |i|
			@container["grp11"] << @board.board_arr[i][i+2]
		end
		3.downto(0) do |i|
			@container["grp12"] << @board.board_arr[i][i+3]
		end
		# grp 13 - 19 are vertical grps
		for i in 13..19
			for j in 0..5
				@container["grp#{i}"] << @board.board_arr[j][i-13]
			end
		end
		# grp 20 - 25 are horizontal grps
		for i in 20..25
			for j in 0..5
				@container["grp#{i}"] = @board.board_arr[j]
			end
		end
	end
end	

# game = Game.new
# game.run