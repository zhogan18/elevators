# This is my elevator class.  It uses two queues to know where to pick people up and drop them off. 
# One queue gets new values when a person pushes the elevator button to alert the elevator of a person.
# The other, the destinations queue, gets new values when the person enters the elevators. This is similar
# to when a person actually enters an elevator. The elevator will move based off of the 0th index in the 
# destinations queue.  If that is empty it will go off of the pickups queue, and if that is empty, it simply goes
# to the resting floor.
# Zach Hogan
# 5/1/15

class Elevator
	attr_accessor :curr_load, :curr_floor, :curr_direction, :max_floor, :destinations, :pickup
	ELEV_MAX_PERSONS = 10
	MOVING_UP = 1
	MOVING_DOWN = 0
	ELEV_RESTING_FLOOR = 0
	def initialize(max_floor)
		@curr_load = 0
		@curr_direction = MOVING_UP
		@curr_floor = ELEV_RESTING_FLOOR
		@max_floor = max_floor
		@pickup = Array.new
		@destinations = Array.new
	end

	def add_destination(floor)
		@destinations.push(floor)
	end

	def add_pickup(floor)
		@pickup.push(floor)
	end

	def clock_tick
		if !@destinations.empty?
			if @destinations[0] > @curr_floor
				@curr_direction = MOVING_UP
			elsif @destinations[0] < @curr_floor
				@curr_direction = MOVING_DOWN
			end
			move
		elsif !@pickup.empty?
			if @pickup[0] > @curr_floor
				@curr_direction = MOVING_UP
			elsif @pickup[0] < @curr_floor
				@curr_direction = MOVING_DOWN
			end
			move
		else
			move_to_resting
		end

		if @destinations.include?(@curr_floor)
			@destinations.delete(@curr_floor)
		end
		if @pickup.include?(@curr_floor)
			@pickup.delete(@curr_floor)
		end
				
	end

	def move_to_resting
		if @curr_floor != ELEV_RESTING_FLOOR
			@curr_floor = @curr_floor - 1
		end
	end

	def curr_floor
		return @curr_floor
	end

	def move
		if @curr_direction == MOVING_UP
			@curr_floor = @curr_floor + 1
		else
			@curr_floor = @curr_floor - 1
		end
	end

	def switch_direction
		if @curr_direction == MOVING_UP
			@curr_direction = MOVING_DOWN
		else
			@curr_direction = MOVING_UP
		end
	end
end