require 'board'

describe Board do 
	it "should know who owns it" do
		player = double :player, name: "Fred"
		board = Board.new(player)
		expect(board.owner).to eq("Fred")
	end

	it "should return a representation of the board" do
		player = double :player, name: "Fred"
		board = Board.new(player)
		expect(board.rows.length).to eq(10)
		board.rows.each { |a| expect(a.length).to eq(10) }
	end
end