require_relative "../lib/game"
describe Game do 
	describe "#check_victory" do 
		context "when there are four connected" do 
			before(:all) do 
				@game = Game.new
				@game.board.board_arr = [
								[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
							  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
							  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
							  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
							  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "],
						  	  	[" ☐ "," ☐ "," ☐ "," ⚽ "," ☐ "," ☐ "," ☐ "]
						  	  ]
				@game.check_victory
			end
			it "results in game over" do 
				expect(@game.game_over).to be_truthy

			end
		end
	end
end