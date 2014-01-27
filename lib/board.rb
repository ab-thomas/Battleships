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

	def owner
		@player.name
	end

	def rows
		@rows
	end

	# def is_water_clear?(ship_length, at_coordinates, direction)
	# 	if direction == :north

	# 	elsif direction == :east
	# 		ship_length.times do |i|
	# 			check_coords(at_coordinates)
	# 		end
	# 	elsif direction == :south

	# 	elsif direction == :west

	# 	else
	# 		"panic"
	# 	end
	# end
end