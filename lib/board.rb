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

	def populate
		ship_lengths = [2,3,3,4,5]
		ship_lengths.each { |ship_length| add_a_ship ship_length }
	end

	def add_a_ship length
		x, y, direction = random_start
		while !is_water_clear?(length, [x,y], direction)
			x, y, direction = random_start
		end
		place_ship(length, [x,y], direction)
	end

	def clear
			@rows = @rows.map {|a| a.map {|cell| " "}}
	end

	def random_start
		@directions = [:north,:south,:east,:west]
		@values = [0,1,2,3,4,5,6,7,8,9]
		[@values.sample,@values.sample,@directions.sample]
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
		x, y = coords
	
		case direction
		when :north 
			@rows[y][x]   = "s"
			@rows[y-1][x] = "s"
			@rows[y-2][x] = "s" if length > 2
			@rows[y-3][x] = "s" if length > 3
			@rows[y-4][x] = "s" if length > 4	
		when :south 
			@rows[y][x]   = "s"
			@rows[y+1][x] = "s"
			@rows[y+2][x] = "s" if length > 2
			@rows[y+3][x] = "s" if length > 3
			@rows[y+4][x] = "s" if length > 4	
		when :east
			@rows[y][x]   = "s"
			@rows[y][x+1] = "s"
			@rows[y][x+2] = "s" if length > 2
			@rows[y][x+3] = "s" if length > 3
			@rows[y][x+4] = "s" if length > 4	
		when :west
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

	def is_water_clear?(ship_length, coordinates, direction)
		x,y = coordinates
		ship = Array.new(ship_length) { " " }
		comparison_array = array_eastward(ship_length,x,y) if direction == :east
		comparison_array = array_westward(ship_length,x,y) if direction == :west
		comparison_array = array_northward(ship_length,x,y) if direction == :north
		comparison_array = array_southward(ship_length,x,y) if direction == :south
		ship == comparison_array
	end

	def array_eastward ship_length, x, y
		@rows[y].slice(x...(x + ship_length))
	end

	def array_westward ship_length, x, y
		@rows[y].slice((x-ship_length+1)..x)
	end

	def array_southward ship_length, x, y
		(0...ship_length).inject([]) do |array, i| 
			@rows[y+i].nil? ? array << "nil" : array << @rows[y+i][x]
		end
	end

	def array_northward ship_length, x, y
		(0...ship_length).inject([]) do |array, i| 
			@rows[y-i].nil? ? array << "nil" : array << @rows[y-i][x]
		end
	end

end