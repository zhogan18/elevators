# Elevators Programming Assignment
This is my elevators programming assignment! I believe my solution works fairly well, but I am sure there is room for improvement.  I put most of the "intelligence" of my program into the Person.rb and Elevator.rb files.  Realistically, for all intensive purposes, Building.rb and Floor.rb are simply containers.  In fact, Building.rb and Floor.rb do not even have a clock_tick function definition as I did not have them use it.  
One of the cool things about my program is the way the elevator works.  I decided to use two queues.  One queue keeps track of all destinations for people entering the elevator, while the other queue keeps track of where people enter the elevator.  Destinations are higher priority and will be checked first as people can just be picked up on the way, but if there are no people on the elevator, the destinations queue is empty, so the elevator then checks  the pickup queue.  Unfornately right now, I only programmed this to use one elevator, as figuring out and writing for how each elevator would know who to pick up was taking more time than I had.  I do believe that it wouldn't be very difficult with the code that I have to add some more elevators.  In fact, a lot of the code assumes there are more than one.  
My Person class has some important features.  Like in real life, it controls when it boards and when it leaves. 
Some sample output is below: 
Everything between the ________________________ is one clocktick. The data represents the status of the building at that clock tick.  To see where the elevator is, just look for a +.  If there is no elevator on that floor, there is a -.
________________________ 

floor 4: - floor_population: 2 people_waiting: 1
floor 3: - floor_population: 0 people_waiting: 0
floor 2: - floor_population: 1 people_waiting: 0
floor 1: - floor_population: 1 people_waiting: 1
floor 0: + floor_population: 1 people_waiting: 1
amount_on_elevator: 0
________________________
________________________ 

floor 4: - floor_population: 2 people_waiting: 1
floor 3: - floor_population: 0 people_waiting: 0
floor 2: - floor_population: 1 people_waiting: 0
floor 1: + floor_population: 0 people_waiting: 1
floor 0: - floor_population: 1 people_waiting: 1
amount_on_elevator: 1
________________________
________________________ 

floor 4: - floor_population: 2 people_waiting: 1
floor 3: - floor_population: 0 people_waiting: 0
floor 2: - floor_population: 1 people_waiting: 0
floor 1: - floor_population: 0 people_waiting: 0
floor 0: + floor_population: 0 people_waiting: 1
amount_on_elevator: 2
________________________
________________________ 

floor 4: - floor_population: 2 people_waiting: 1
floor 3: - floor_population: 0 people_waiting: 0
floor 2: - floor_population: 1 people_waiting: 0
floor 1: + floor_population: 0 people_waiting: 1
floor 0: - floor_population: 1 people_waiting: 0
amount_on_elevator: 1
________________________
________________________ 

floor 4: - floor_population: 2 people_waiting: 1
floor 3: - floor_population: 0 people_waiting: 0
floor 2: + floor_population: 1 people_waiting: 0
floor 1: - floor_population: 0 people_waiting: 0
floor 0: - floor_population: 1 people_waiting: 0
amount_on_elevator: 1
________________________
________________________ 

floor 4: - floor_population: 2 people_waiting: 1
floor 3: + floor_population: 0 people_waiting: 0
floor 2: - floor_population: 2 people_waiting: 0
floor 1: - floor_population: 0 people_waiting: 0
floor 0: - floor_population: 1 people_waiting: 0
amount_on_elevator: 0
________________________
________________________ 

floor 4: + floor_population: 1 people_waiting: 1
floor 3: - floor_population: 0 people_waiting: 0
floor 2: - floor_population: 2 people_waiting: 0
floor 1: - floor_population: 0 people_waiting: 0
floor 0: - floor_population: 1 people_waiting: 0
amount_on_elevator: 1
________________________
________________________ 

floor 4: - floor_population: 1 people_waiting: 0
floor 3: + floor_population: 0 people_waiting: 0
floor 2: - floor_population: 2 people_waiting: 0
floor 1: - floor_population: 0 people_waiting: 0
floor 0: - floor_population: 1 people_waiting: 0
amount_on_elevator: 1
________________________
________________________ 

floor 4: - floor_population: 1 people_waiting: 0
floor 3: - floor_population: 1 people_waiting: 0
floor 2: + floor_population: 2 people_waiting: 0
floor 1: - floor_population: 0 people_waiting: 0
floor 0: - floor_population: 1 people_waiting: 0
amount_on_elevator: 0
