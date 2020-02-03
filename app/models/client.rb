class Client
    @@all = []
    def self.all
        @@all
    end

    #clients join a gym at a particular location
    #after they are assigned a trainer, they have access
    #to all the trainer's associated locations

    attr_accessor :name, :age, :trainer, :location
    def initialize(name, age, location)
        @name = name
        @age = age
        @location = location
        self.class.all << self
    end

    def assign_trainer(trainer)
        self.trainer = trainer
        self.location = "See view_locations"
    end

    def view_locations
        if self.trainer
            gyms = GymTrainer.all.select {|assoc| assoc.trainer == self.trainer}
            gyms.map {|gym| gym.location}
        else
            self.location
        end
    end

end