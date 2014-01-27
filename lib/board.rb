class Board
	def initialize player
		@player = player
		@rows = Array.new(10) { Array.new(10) { '' } }
	end

	def owner
		@player.name
	end

	def rows
		@rows
	end
end