require './../simulation.rb'


describe Building do

	it "should create a building with 1 elevator and 5 floors" do
		building = Building.new(1, 5)
		expect(building.number_of_floors).to eq(5)
		expect(building.number_of_elevators).to eq(1)
	end

end
