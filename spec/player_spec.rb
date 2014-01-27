require "./lib/player"

describe Player do

  let(:player) {Player.new("name")}

  it "there should be a player" do
    expect(player.name).to eq("name") 
  end


  



end