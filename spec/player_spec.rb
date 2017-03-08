require_relative "../lib/player"
require_relative "../lib/board"
describe Player do 
	context "when initialized with a new board and a symbol" do 
		before(:all) do 
			@player = Player.new(Board.new.board_arr," ⚽ ")
		end
		describe "player's board" do 
			it "is empty" do 
				expect(@player.board).to eql([
												[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
										  	  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											])
			end
		end
		describe "#drop" do
			before(:all) do 
				@input = StringIO.new('4')
				@player.drop(@input)
			end
			context "when board is empty" do 
				context "when the player inputs '4'" do 
					describe "player's board's fourth column" do 
						it "is stacked with a symbol" do 
							expect(@player.board).to eql([
															[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
														  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
														  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
														  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
														  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
													  	  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
														])
						end
					end
				end
			end
			context "when one column is fully filled" do 
				context "when the player inputs '4'" do 
					before(:all) do 
						@player.board = [
											[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
										  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
										  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
										  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
										  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
									  	  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
										]
						$stdin = StringIO.new("3\n")
						@input = StringIO.new("4\n")
						@output = StringIO.new
						@player.drop(@input,@output)	
						$stdin = STDIN
						@output.pos = 0
					end
					describe "output string" do 
						it "is 'Column is full. Please choose another column.'" do 
							expect(@output.read).to eql("Column is full. Please choose another column.\n")
						end
					end
					context "when '3' is input when prompted" do 
						describe "player's board's third column" do 
							it "is stacked with a symbol" do 
								expect(@player.board).to eql([
																[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
															  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
															  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
															  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
															  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
														  	  	[" ☐ "," ☐ "," ⚽ "," ⚽ "," ☐ "," ☐ "," ☐ "],
															])
							end
						end
					end

				end
			end
		end
	end
end
