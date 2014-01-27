require 'board'


describe Board do 
let(:player) {double :player, name: "Fred"}
let(:board) {Board.new(player)}

	it "should know who owns it" do
		expect(board.owner).to eq("Fred")
	end

	it "should return a representation of the board" do
		expect(board.rows.length).to eq(10)
		board.rows.each { |a| expect(a.length).to eq(10) }
	end

	it "should know what's at any co-ordinates" do
			expect(board.check_coords([0,6])).to eq(" ")
			expect(board.check_coords([0,7])).to eq(" ")
			expect(board.check_coords([0,8])).to eq("s")
			expect(board.check_coords([0,9])).to eq("s")
	end

  it "should be able to set the value at particular co-ordinates" do
  	expect(board.check_coords([0,0])).to eq(" ")
  	board.set_value_at_coords("o", [0,0])
  	expect(board.check_coords([0,0])).to eq("o")
  end

  it "should be able to shoot a ship" do
  	expect(board.check_coords([0,8])).to eq("s")
  	board.register_shot "A9"
  	expect(board.check_coords([0,8])).to eq("x")
  end

  it "should be able to shoot a ship in any case" do
    expect(board.check_coords([0,8])).to eq("s")
    board.register_shot "a9"
    expect(board.check_coords([0,8])).to eq("x")
  end

  it "should return the opponent's view, with ships removed" do
  	expect(board.opponents_view).to eq([
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "]
			     ])
  end

  it "should be able to place a ship at given co-ordinates" do 
    board.place_ship(5,"A1",:east)
    expect(board.rows).to eq([
			       ["s","s","s","s","s"," "," ","s","s","s"],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "]
			     ])
  end
  it "should be able to place a ship at given co-ordinates" do 
    board.place_ship(4,"A1",:south)
    expect(board.rows).to eq([
			       ["s"," "," "," "," "," "," ","s","s","s"],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "]
			     ])
  end
  it "should be able to place a ship at given co-ordinates" do 
    board.place_ship(3,"d3",:west)
    expect(board.rows).to eq([
			       [" "," "," "," "," "," "," ","s","s","s"],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" ","s","s","s"," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "]
			     ])
  end
  it "should be able to place a ship at given co-ordinates" do 
    board.place_ship(2,"a3",:north)
    expect(board.rows).to eq([
			       [" "," "," "," "," "," "," ","s","s","s"],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "]
			     ])
  end
	



  # context "(when trying to place ships)" do
  #   it "should know if a given stretch of water is clear" do
  #     expect(board.is_water_clear?(3, [0,0], :east)).to be_true
  #   end
  # end

end