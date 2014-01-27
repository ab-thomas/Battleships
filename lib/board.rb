class Board
	def initialize player
		@player = player
		#@rows = Array.new(10) { Array.new(10) { '' } }
		@rows = [
			       [" "," "," "," "," "," "," ","s","s","s"],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," ","s"," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       [" "," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "],
			       ["s"," "," "," "," "," "," "," "," "," "]
			     ]
		@x_axis = { "A" => 0, "B" => 1, "C" => 2, "D" => 3,"E" => 4, "F" => 5,
							"G" => 6, "H" => 7, "I" => 8, "J" => 9
						}
	end

	def check_coords coords_array
		x, y = coords_array
		@rows[y][x]
	end

	def set_value_at_coords value, coords_array
		x, y = coords_array
		@rows[y][x] = value
	end

	def register_shot at_coordinates
		converted_coordinates = convert_coords(at_coordinates)
		old_value = check_coords(converted_coordinates)
		set_value_at_coords("o", converted_coordinates) if old_value == " "
		set_value_at_coords("x", converted_coordinates) if old_value == "s"			
	end

	def convert_coords coords
		x = @x_axis[coords[0].upcase]
		y = coords.slice(1..-1).to_i - 1
		[x, y]
	end

	def opponents_view
		@rows.map {|a| a.map {|cell| cell == "s" ? " " : cell}}
	end

	def place_ship length, coords, direction
		x, y = convert_coords(coords)
		case direction
		when :north 
			puts 'north'
			@rows[y][x]   = "s"
			@rows[y-1][x] = "s"
			@rows[y-2][x] = "s" if length > 2
			@rows[y-3][x] = "s" if length > 3
			@rows[y-4][x] = "s" if length > 4	
		when :south 
			puts 'south'
			@rows[y][x]   = "s"
			@rows[y+1][x] = "s"
			@rows[y+2][x] = "s" if length > 2
			@rows[y+3][x] = "s" if length > 3
			@rows[y+4][x] = "s" if length > 4	
		when :east
			puts 'east'
			@rows[y][x]   = "s"
			@rows[y][x+1] = "s"
			@rows[y][x+2] = "s" if length > 2
			@rows[y][x+3] = "s" if length > 3
			@rows[y][x+4] = "s" if length > 4	
		when :west
			puts 'west'
			@rows[y][x]   = "s"
			@rows[y][x-1] = "s"
			@rows[y][x-2] = "s" if length > 2
			@rows[y][x-3] = "s" if length > 3
			@rows[y][x-4] = "s" if length > 4	
		end
	end
	def owner
		@player.name
	end

	def rows
		@rows
	end

	def is_water_clear?(ship_length, at_coordinates, direction)
		x,y = at_coordinates
		ship = Array.new(ship_length) { " " }
		if direction == :east
			comparison_array = @rows[y].slice(x...(x + ship_length))
		elsif direction == :south
			comparison_array = ship.inject([]) do |array, co| 
				y += 1
				array << @rows[y-1][x]
			end
		end
		ship == comparison_array
	end

end