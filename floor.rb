# This is my floor class. I didn't make it very interesting.  It just knows how many people are on the floor
# and what floor number it is.  It is basically a container.
# Zach Hogan
# 5/1/15

class Floor

	attr_accessor :floor_num, :persons
	def initialize(num_people, floor_num)
		@floor_num = floor_num
		@persons = num_people
	end

	def get_floor_number
		@floor_num
	end


	def get_number_of_people
		@persons
	end

	def to_s
		"floor number: #{@floor_num}, number of people: #{@persons}"
	end

end