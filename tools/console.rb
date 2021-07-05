require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

oak = Location.new("GWPC", "Oakland", 300)
berk = Location.new("IronWorks", "Berkeley", 400)

jenny = Trainer.new("Jenny", 1000)
henry = Trainer.new("Henry", 1000)
jess = Trainer.new("Jess", 2300)
bob = Trainer.new("Bob", 1800)

diana = Client.new("Diana", 32, oak)
ben = Client.new("Ben", 32, oak)
ian = Client.new("Ian", 32, berk)
monica = Client.new("Monica", 32, berk)
joe = Client.new("Joe", 32, berk)

jenny.join_location(oak)
jenny.join_location(berk)
henry.join_location(oak)
jess.join_location(berk)
bob.join_location(oak)
bob.join_location(berk)

diana.assign_trainer(jenny)
ben.assign_trainer(henry)
ian.assign_trainer(jess)
monica.assign_trainer(jess)



Pry.start
