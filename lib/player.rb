class Player

attr_reader :name
attr_accessor :board

  def initialize(name)
    @name = name
    @board = Board.new(self)
  end

  def has_ships_still_floating?
    rows = board.rows
    rows_with_ships = rows.select { |a| a.include?("s") }.length
    rows_with_ships != 0 
  end

  # def shoot(at_coordinates, opponent_board)
      #  board.register_
  # end
end