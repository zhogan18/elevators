# My building class is like my floor class, just a little more complicated.  It is basically a container for everything.
# Everything that is "smart" is in the elevator and person classes.  Building is simply to hold everything and allow access to
# the data.  Right now, every building can only have 1 elevator.  I tried to code it in such a way as to allow for multiple elevators
# but I don't have the time to finish it.  I believe it wouldn't be too difficult of a problem to solve though as the trickiest part,
# which is probably what would take the most time, would be how to manage who entered which elevator.
# Zach Hogan
# 5/1/15
class Building
	attr_accessor :number_of_elevators, :number_of_floors, :elevators, :floors

	def initialize(elevators, floors)
		@number_of_elevators = elevators
		@number_of_floors = floors
		@elevators = Array.new
		@floors = Array.new
		(1..@number_of_elevators).each do |i|
			@elevators.push(Elevator.new(@number_of_floors))
		end
		(0..@number_of_floors - 1).each do |i|
			@floors.push(Floor.new(0, i))
		end
	end

	def get_number_of_elevators
		@number_of_elevators
	end

	def get_number_of_floors
		@number_of_floors
	end

	def to_a
		result = Array.new	
		(0..@number_of_floors - 1).each do |i|
			result.push('')
			(1..@number_of_elevators).each do |j|
				if @elevators[j-1].curr_floor == i
					result[i] = result[i] + '+'
				else
					result[i] = result[i] + '-'
				end
			end
			
		end
		result		
	end

end