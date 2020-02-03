class GymTrainer
    @@all = []
    def self.all
        @@all
    end

    attr_reader :trainer, :location
    def initialize(trainer, location)
        @trainer = trainer
        @location = location
        self.class.all << self
    end


end