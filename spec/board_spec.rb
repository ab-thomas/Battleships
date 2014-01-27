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

  context "(when trying to place ships)" do
    it "should know if a given eastward stretch of water is clear" do
      expect(board.is_water_clear?(3, [0,0], :east)).to eq(true)
    end

    it "should know if a southward stretch of water is clear" do
      expect(board.is_water_clear?(2, [1,3], :south)).to eq(true)
    end

    it "should know if a given westward stretch of water is clear" do
      expect(board.is_water_clear?(3, [6,0], :west)).to eq(true)
    end

    it "should know if a northward stretch of water is clear" do
      expect(board.is_water_clear?(2, [1,3], :north)).to eq(true)
    end

    it "should know if a stretch of water is not clear" do
      expect(board.is_water_clear?(3, [6,0], :east)).to eq(false)
    end

    it "should know if a stretch goes out of the array" do
      expect(board.is_water_clear?(3, [9,2], :east)).to eq(false)
    end

    it "should really know if a stretch goes out of the array" do
      expect(board.is_water_clear?(3, [9,9], :south)).to eq(false)
    end
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
  
  it "should be able to test it's OK to, and place a ship at given co-ordinates" do 

    expect(board.is_water_clear?(5,[0,0],:south)).to eq(true)
    board.place_ship(5,"a1",:south)
    expect(board.rows).to eq([
			       ["s"," "," "," "," "," "," ","s","s","s"],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," ","s"," "," "," "," "," "," "," "],
			       ["s"," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "]
			     ])
  end

  it "should return two co-ordinates, 0-10, and a direction" do 

  	a,b,c = board.random_start
  	puts "#{a}  #{b}  #{c}"

  end





  

end