class Plateau
	def grid_limits(x_grid_limit, y_grid_limit)
		@x_grid_limit = x_grid_limit.to_i
		@y_grid_limit = y_grid_limit.to_i
	end
end

class Rover < Plateau
	def initialize(x_position, y_position, direction)
		@x_position = x_position.to_i
		@y_position = y_position.to_i
		@direction = direction.upcase
	end

	def in_grid
		if @x_position >= x_grid_limit
			puts "Cannot move any further along the x-axis"
		elsif @y_position >= y_grid_limit
			puts "cannoy move any further along the y-axis"
		end
	end

	def rover_input(movements)
		separated_movements = movements.scan(/./)
		separated_movements.each do |movement|
			case movement
				when "L"
					turn_left
				when "R"
					turn_right
				when "M"
					move_one
				else
					puts "Input not recognized"
			end
		end
	end

	def turn_left
		case @direction
			when "N" then "E"
			when "E" then "S"
			when "S" then "W"
			when "W" then "N"
		end
	end

	def turn_right
		case @direction
			when "N" then "W"
			when "W" then "S"
			when "S" then "E"
			when "E" then "N"
		end
	end

	def move_one
		case @direction
			when "N"
				@y_position += 1
			when "E"
				@x_position += 1
			when "W"
				@x_position -= 1
			when "S"
				@y_position -= 1
		end
	end
	def final_location
		puts "#{@x_position}, #{@y_position}, #{@direction}"
	end
end

plateau = Plateau.new
plateau.grid_limits(5, 5)

rover1 = Rover.new(1, 2, "N")
rover1.rover_input("LMLMLMLMM")
rover1.final_location

rover2 = Rover.new(3, 3, "E")
rover2.rover_input("MMRMMRMRRM")
rover2.final_location
