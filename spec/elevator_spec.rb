require './../simulation.rb'


describe Elevator do

	it "should create a elevator with a max height of 5 floors" do
		elevator = Elevator.new(5)
		expect(elevator.max_floor).to eq(5)
	end

	it "should have a resting floor of 0" do
		elevator = Elevator.new(5)
		expect(elevator.curr_floor).to eq(0)
	end

	it "should add destinations" do
		elevator = Elevator.new(5)
		elevator.add_destination(3)
		expect(elevator.destinations[0]).to eq(3)
	end

	it "should add pick ups" do
		elevator = Elevator.new(5)
		elevator.add_pickup(3)
		expect(elevator.pickup[0]).to eq(3)
	end

	it "should be able to move up and down" do
		elevator = Elevator.new(5)
		elevator.move
		elevator.move
		elevator.switch_direction
		elevator.move
		expect(elevator.curr_floor).to eq(1)
	end

	it "should go back down to resting if there are no destinations or pickups" do
		elevator = Elevator.new(5)
		elevator.clock_tick
		expect(elevator.curr_floor).to eq(0)
	end

end
