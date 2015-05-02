# This is my simulation class. It basically initializes everything and runs my simulation. Right now, numbers of different
# objects need to be hard coded.  Right now there can only be one elevator, but as many floors and people as you want.
# The output is as follows - floor #: +/- (depending on whether the elevator is on that floor) floor_population: #
# Zach Hogan
# 5/1/15 

require_relative 'elevator'
require_relative 'floor'
require_relative 'building'
require_relative 'person'

class Simulation
	attr_accessor :actors, :building, :elevator

	def initialize()
		@building = Building.new(1,5)
		@actors = Array.new
		
		#registering the elevators so their clock_ticks will be called. I only use clock_tick in the person and elevator classes, not he building and floors
		for elevator in @building.elevators
			register(elevator)
		end

		(0..4).each do
			add_person
		end
	end

	def run(n)
		print_all
		(0..n-1).each do |i|
			for actor in @actors
				if actor.is_a? Person
					actor.clock_tick(@building)
				else
					actor.clock_tick
				end
			end
			print_all
		end
	end

	def add_person
		starting_floor = Random.rand(0..@building.get_number_of_floors-1)
		intended_floor = Random.rand(0..@building.get_number_of_floors-1)
		person = Person.new(starting_floor, intended_floor)
		register(person)
		@building.floors[starting_floor].persons += 1
		person.press_button(building)
	end

	def register(actor)
		@actors.push(actor)
	end

	def print_all
		result = @building.to_a
		string_result = "________________________ \n\n"
		i = @building.get_number_of_floors-1
		# Will be used to list number of people waiting to get on the elevator
		people_waiting = 0

		while i >= 0
			for actor in @actors
				if actor.is_a? Person and actor.current_floor == i and actor.current_floor != actor.intended_floor
					people_waiting += 1
				end
			end
			string_result = string_result + "floor #{i}: #{result[i]} floor_population: #{@building.floors[i].persons} people_waiting: #{people_waiting}\n"
			i = i - 1
			people_waiting = 0
		end
		string_result += "amount_on_elevator: #{@building.elevators[0].curr_load}\n"
		puts string_result + "________________________"
	end

end



