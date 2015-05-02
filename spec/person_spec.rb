require './../simulation.rb'


describe Person do

	it "should create a person with starting and intended floors" do
		person = Person.new(2,5)
		expect(person.starting_floor).to eq(2)
		expect(person.intended_floor).to eq(5)
	end

	it "should allow a person to board an elevator" do
		person = Person.new(0,3)
		building = Building.new(1,5)
		person.board_elevator(building)
		elevator = building.elevators[0]
		expect(elevator.curr_load).to eq(1)
	end

	it "should allow a person to leave an elevator" do
		person = Person.new(0,3)
		building = Building.new(1,5)
		person.board_elevator(building)
		elevator = building.elevators[0]
		person.leave_elevator(building)
		expect(elevator.curr_load).to eq(0)
	end

	it "should allow for a person to say where to pick them up" do
		person = Person.new(1,3)
		building = Building.new(1,5)
		person.press_button(building)
		person.board_elevator(building)
		elevator = building.elevators[0]
		expect(elevator.pickup[0]).to eq(1)
	end

end
