require_relative "../lib/board"

describe Board do 
	context "when initialized" do 
		before(:all) do 
			@board = Board.new
		end
		it "is an instance of 'Board'" do 
			expect(@board).to be_an_instance_of Board
		end
		it "has empty board" do 
			expect(@board.board_arr).to eql([
												[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
										  	  	[" ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "," ☐ "],
											])
		end
	end
end

