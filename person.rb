# This is my person class.  The person class is one of the main classes in my program and it is one of the main
# parts of my "AI".  It controls boarding, leaving, and alerting the elevator to a need to pick up or drop off.
# Zach Hogan
# 5/1/15

class Person
	attr_accessor :current_floor, :intended_floor, :on_elevator, :starting_floor

	def initialize(starting_floor,intended_floor)
		@starting_floor = starting_floor
		@current_floor = starting_floor
		@intended_floor = intended_floor
		@on_elevator = false
	end

	def get_floor
		@current_floor
	end

	def check_status
		@on_elevator
	end

	def press_button(building)
		if !building.elevators[0].pickup.include?(@starting_floor)
			building.elevators[0].add_pickup(@starting_floor)
		end
	end


	def clock_tick(building)
		if @on_elevator
			if @current_floor == @intended_floor
				leave_elevator(building)
			else
				if building.elevators[0].curr_direction == 1
					@current_floor = @current_floor + 1
				else
					@current_floor = @current_floor - 1
				end
			end
		else
			if @current_floor != @intended_floor
				press_button(building)
				if building.elevators[0].curr_floor == @current_floor
					board_elevator(building)
				end
			end
		end
	end

	# Unfortunately I did not get to the point of more than 1 elevator; however, the way I implemented it, 
	# it should not be hard to do so.  I just did not have the time.
	def board_elevator(building)
		@on_elevator = true
		building.floors[@current_floor].persons -= 1
		building.elevators[0].curr_load +=1
		if !building.elevators[0].destinations.include?(@intended_floor)
			building.elevators[0].add_destination(@intended_floor)
		end
	end

	def leave_elevator(building)
		@on_elevator = false
		building.floors[@current_floor].persons += 1
		building.elevators[0].curr_load -=1
	end
end