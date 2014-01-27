require "./lib/player"

describe Player do

  let(:player) {Player.new("name")}
  #let(:board) {Board.new}

  def clear_rows # This is terrible. Remove ASAP
    player.board.set_value_at_coords(" ", "H1")
    player.board.set_value_at_coords(" ", "I1")
    player.board.set_value_at_coords(" ", "J1")
    player.board.set_value_at_coords(" ", "C4")
    player.board.set_value_at_coords(" ", "C5")
    player.board.set_value_at_coords(" ", "C6")
    player.board.set_value_at_coords(" ", "A9")
    player.board.set_value_at_coords(" ", "A10")
  end

  it "there should be a player" do
    expect(player.name).to eq("name") 
  end


  it "should have a board" do
    expect(player.board).to be_true
  end

  it "should tell us if opponent still has ships floating initially" do
    # expect the players board to have ships floating
    expect(player).to have_ships_still_floating
  end

  it "should tell us if there are no ships floating" do
    clear_rows
    expect(player).not_to have_ships_still_floating
  end

  it "should be able shoot at coordinates at opponents board" do
    board = double :board
    expect(board).to receive(:register_shot).with('A1')
    player.shoot("A1", board)
  end

end



